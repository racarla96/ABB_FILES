#!/usr/bin/env python3
"""Read-only RAP probe for an ABB S4 (BaseWare 2.x with the RAP option).

Asks the robot's portmapper (program 100000 v2, UDP/TCP port 111) which TCP ports
serve the RAP RPC programs 300456 (SYNC) and 300457 (FIL), then calls the RPC null
procedure (proc 0) on each. Nothing is written to the robot.

  rap_probe.py 100.100.100.101          # robot IP (the SLIP 'LocalAdress' of the robot)
  rap_probe.py --selftest               # encode/decode check against a local fake server

Program numbers come from static analysis of the kernel (docs/RAP_reverse_engineering.md);
not yet verified against a real robot.
"""
import argparse, random, socket, struct, sys, threading

PMAP, PMAP_VERS, PMAP_GETPORT, PMAP_DUMP = 100000, 2, 3, 4
PROGS = {300456: "RAPRPC_SYNC_PROGRAM", 300457: "RAPRPC_FIL_PROGRAM"}
IPPROTO_TCP, IPPROTO_UDP = 6, 17


def call_msg(xid, prog, vers, proc, args=b""):
    return struct.pack(">IIIIII", xid, 0, 2, prog, vers, proc) + struct.pack(">IIII", 0, 0, 0, 0) + args


def parse_reply(data, xid):
    x, mtype, rstat = struct.unpack(">III", data[:12])
    if x != xid or mtype != 1:
        raise ValueError("not a reply to our call")
    if rstat != 0:
        raise ValueError("call denied (reply_stat=%d)" % rstat)
    # verifier: flavor, len, body; then accept_stat
    vlen = struct.unpack(">I", data[16:20])[0]
    off = 20 + ((vlen + 3) & ~3)
    astat = struct.unpack(">I", data[off:off + 4])[0]
    return astat, data[off + 4:]


def rpc_udp(host, port, prog, vers, proc, args=b"", timeout=3.0):
    xid = random.getrandbits(32)
    s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM); s.settimeout(timeout)
    s.sendto(call_msg(xid, prog, vers, proc, args), (host, port))
    return parse_reply(s.recvfrom(65535)[0], xid)


def rpc_tcp(host, port, prog, vers, proc, args=b"", timeout=5.0):
    xid = random.getrandbits(32)
    msg = call_msg(xid, prog, vers, proc, args)
    with socket.create_connection((host, port), timeout) as s:
        s.sendall(struct.pack(">I", 0x80000000 | len(msg)) + msg)
        hdr = b""
        while len(hdr) < 4: hdr += s.recv(4 - len(hdr))
        n = struct.unpack(">I", hdr)[0] & 0x7FFFFFFF
        body = b""
        while len(body) < n: body += s.recv(n - len(body))
    return parse_reply(body, xid)


def getport(host, prog, vers, prot, pmap_port=111):
    astat, res = rpc_udp(host, pmap_port, PMAP, PMAP_VERS, PMAP_GETPORT, struct.pack(">IIII", prog, vers, prot, 0))
    if astat != 0: raise ValueError("portmapper accept_stat=%d" % astat)
    return struct.unpack(">I", res[:4])[0]


def probe(host, pmap_port=111, tcp_override=None):
    for prog, name in PROGS.items():
        try:
            port = getport(host, prog, 1, IPPROTO_TCP, pmap_port)
        except Exception as e:
            print(f"{name} ({prog}): portmapper query failed: {e}"); continue
        if port == 0:
            print(f"{name} ({prog}): not registered"); continue
        try:
            astat, _ = rpc_tcp(host, tcp_override or port, prog, 1, 0)
            print(f"{name} ({prog}): TCP port {port}, NULL procedure accept_stat={astat} ({'OK' if astat == 0 else 'see RFC 5531'})")
        except Exception as e:
            print(f"{name} ({prog}): TCP port {port}, NULL call failed: {e}")


def selftest():
    """Local fake portmapper (UDP) + fake RAP server (TCP) to check the encoding."""
    tcp = socket.socket(); tcp.bind(("127.0.0.1", 0)); tcp.listen(5); tport = tcp.getsockname()[1]
    udp = socket.socket(socket.AF_INET, socket.SOCK_DGRAM); udp.bind(("127.0.0.1", 0)); uport = udp.getsockname()[1]
    def reply(xid, body=b""):
        return struct.pack(">III", xid, 1, 0) + struct.pack(">II", 0, 0) + struct.pack(">I", 0) + body
    def pm():
        for _ in range(2):
            d, a = udp.recvfrom(1024)
            xid, _, _, prog, _, proc = struct.unpack(">IIIIII", d[:24])
            args = struct.unpack(">IIII", d[40:56])
            udp.sendto(reply(xid, struct.pack(">I", tport if args[0] in PROGS else 0)), a)
    def srv():
        for _ in range(2):
            c, _ = tcp.accept()
            hdr = c.recv(4); n = struct.unpack(">I", hdr)[0] & 0x7FFFFFFF; d = c.recv(n)
            xid = struct.unpack(">I", d[:4])[0]; r = reply(xid)
            c.sendall(struct.pack(">I", 0x80000000 | len(r)) + r); c.close()
    threading.Thread(target=pm, daemon=True).start(); threading.Thread(target=srv, daemon=True).start()
    probe("127.0.0.1", pmap_port=uport)


if __name__ == "__main__":
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("host", nargs="?"); ap.add_argument("--selftest", action="store_true")
    ap.add_argument("--pmap-port", type=int, default=111)
    a = ap.parse_args()
    if a.selftest: selftest()
    elif a.host: probe(a.host, a.pmap_port)
    else: ap.error("give a host or --selftest")

#!/usr/bin/env python3
"""Decode / generate ABB S4 (BaseWare/RobotWare 2.x, 3.0) DISC.ID files.

The file is an ASCII header (CRLF, ends with CRLF CRLF) followed by a 214-247
byte binary tail. The robot serial is hidden in the last 193 bytes at 13+ fixed
positions: serial[i] = (byte + 0xA7 - 2*i) & 0xFF, the string ends with a 0.
Everything else in the tail is filler in 0x5B-0xBF.

  discid.py decode FILE...
  discid.py generate --serial IRB6400-1234 --program 3HAB2316-1/13 \
      --label "BaseWare OS 2.0" --disk 1 --of 3 [--date "Wed May 04 08:16:27 2022"] -o disc.id
  discid.py check FILE...        # decode + compare with the header 'Serial no'
"""
import argparse, random, re, sys, time

POS = [0]
for _i in range(16):
    POS.append(POS[-1] + 18 - _i)  # 0,18,35,51,66,80,93,105,116,126,135,...

TAIL_LEN = 193
FILLER = range(0x5B, 0xC0)

COPYRIGHT = (
    "Property of ABB Vasteras/Sweden.All rights reserved.\r\n"
    "Reproduction,modification,use or disclosure to third\r\n"
    "parties without express authority is strictly forbidden.\r\n"
    "(C) Copyright ABB Robotics Products AB 1993.\r\n\r\n"
)


def disc_serial(data: bytes) -> str:
    base = len(data) - TAIL_LEN
    out = bytearray()
    for i in range(17):
        c = (data[base + POS[i]] + 0xA7 - 2 * i) & 0xFF
        if c == 0:
            break
        out.append(c)
    return out.decode("ascii")


def header_serial(data: bytes) -> str:
    m = re.search(rb"Serial  no ([^\r\n]*)", data)
    return m.group(1).decode("ascii", "replace") if m else ""


def make_header(program, label, serial, disk, of, date=None, make_cmd=4):
    date = date or time.strftime("%a %b %d %H:%M:%S %Y")
    return (
        f"Boot  disk {disk} ({of})\r\n"
        f"Boot unit no 0 Make cmd {make_cmd} {date}\r\n"
        f"Program no {program}\r\n"
        f"Serial  no {serial}\r\n"
        f"Boot discette label text:{label}\r\n" + COPYRIGHT
    ).encode("ascii")


def generate(serial, program, label, disk=1, of=1, date=None, make_cmd=4, rng=random):
    if not 3 < len(serial) <= 16 or not serial.isascii():
        raise ValueError("serial must be 4-16 ASCII characters")
    tail = bytearray(rng.choice(FILLER) for _ in range(rng.randint(214, 247)))
    base = len(tail) - TAIL_LEN
    for i, ch in enumerate(serial.encode() + b"\0"):
        tail[base + POS[i]] = (ch - 0xA7 + 2 * i) & 0xFF
    return make_header(program, label, serial, disk, of, date, make_cmd) + bytes(tail)


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    sub = ap.add_subparsers(dest="cmd", required=True)
    for name in ("decode", "check"):
        p = sub.add_parser(name)
        p.add_argument("files", nargs="+")
    g = sub.add_parser("generate")
    g.add_argument("--serial", required=True)
    g.add_argument("--program", required=True, help="e.g. 3HAB2316-1/13")
    g.add_argument("--label", required=True, help="Boot discette label text")
    g.add_argument("--disk", type=int, default=1)
    g.add_argument("--of", type=int, default=1, help="total number of disks")
    g.add_argument("--date", help='e.g. "Wed May 04 08:16:27 2022" (default: now)')
    g.add_argument("--make-cmd", type=int, default=4)
    g.add_argument("--seed", type=int, help="reproducible filler")
    g.add_argument("-o", "--output", default="disc.id")
    a = ap.parse_args()

    if a.cmd == "generate":
        data = generate(a.serial, a.program, a.label, a.disk, a.of, a.date, a.make_cmd,
                        random.Random(a.seed) if a.seed is not None else random)
        open(a.output, "wb").write(data)
        print(f"{a.output}: {len(data)} bytes, serial {disc_serial(data)}")
        return
    bad = 0
    for f in a.files:
        d = open(f, "rb").read()
        s, h = disc_serial(d), header_serial(d)
        ok = "OK " if s == h else "DIFF"
        bad += s != h
        print(f"{ok} {f}: tail={s!r} header={h!r}")
    sys.exit(1 if bad and a.cmd == "check" else 0)


if __name__ == "__main__":
    main()

#!/usr/bin/env python3
"""Unpack ABB_MC.00x (S4 BaseWare 2.x main-computer image) to a raw a.out image.

Container: text line "#! ABB FLEXIBLE AUTOMATION COMPRESS FORMAT [LZO1X] [10]\n", an 8-byte
blank field, then chunks: 8-byte header (ASCII decimal compressed length, NUL padded) followed
by an LZO1X stream that expands to 10240 bytes. Concatenate the unpacked .000/.001/(.002) files.

  abb_mc_unpack.py OUT.bin ABB_MC.000 ABB_MC.001 [ABB_MC.002]
"""
import sys

def lzo1x(src, ip=0):
    """LZO1X decompress (reference algorithm). Returns (out, ip_after_end_marker)."""
    out=bytearray(); n=len(src)
    state=0  # 0: after match w/o trailing literals; 1-3: trailing lits count; 4: after literal run
    t=src[ip]
    if t>17:
        ip+=1; k=t-17
        out+=src[ip:ip+k]; ip+=k
        state=4 if k>=4 else k
        t=src[ip]; ip+=1
    else:
        t=src[ip]; ip+=1; 
    while True:
        if t<16:
            if state==0:
                if t==0:
                    while src[ip]==0: t+=255; ip+=1
                    t+=15+src[ip]; ip+=1
                k=t+3
                out+=src[ip:ip+k]; ip+=k
                state=4
                t=src[ip]; ip+=1
                continue
            if state<4:
                pos=len(out)-1-(t>>2)-(src[ip]<<2); ip+=1
                L=2
            else:
                pos=len(out)-0x801-(t>>2)-(src[ip]<<2); ip+=1
                L=3
            s=t&3
        elif t>=64:
            pos=len(out)-1-((t>>2)&7)-(src[ip]<<3); ip+=1
            L=(t>>5)-1+2
            s=t&3
        elif t>=32:
            L=t&31
            if L==0:
                while src[ip]==0: L+=255; ip+=1
                L+=31+src[ip]; ip+=1
            L+=2
            d=src[ip]|(src[ip+1]<<8); ip+=2
            pos=len(out)-1-(d>>2); s=d&3
        else:
            L=t&7
            if L==0:
                while src[ip]==0: L+=255; ip+=1
                L+=7+src[ip]; ip+=1
            L+=2
            d=src[ip]|(src[ip+1]<<8); ip+=2
            pos=len(out)-((t&8)<<11)-(d>>2)
            if pos==len(out): return bytes(out), ip
            pos-=0x4000
            s=d&3
        if pos<0: raise ValueError("bad distance")
        for k in range(L): out.append(out[pos+k])
        if s: out+=src[ip:ip+s]; ip+=s
        state=s
        t=src[ip]; ip+=1


def unpack(d):
    p = d.index(b"\n") + 1 + 8
    out = bytearray()
    while p < len(d):
        L = int(d[p:p + 8].rstrip(b"\0")); s = p + 8
        o, used = lzo1x(d, s)
        assert used == s + L, (p, used, s + L)
        out += o; p = s + L
    return bytes(out)


if __name__ == "__main__":
    res = b""
    for f in sys.argv[2:]:
        r = unpack(open(f, "rb").read()); print(f, len(r)); res += r
    open(sys.argv[1], "wb").write(res)

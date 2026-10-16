import re,sys
L=open("dis.txt").read().split("\n")
idx={}
for i,l in enumerate(L):
    m=re.match(r"\s+(0x[0-9a-f]+):\t(.*)",l)
    if m: idx[int(m.group(1),16)]=(i,m.group(2))
D=open("rebased.bin","rb").read()
def cstr(a):
    e=D.index(b"\0",a); return D[a:e].decode("latin1")
def asm_range(a,b):
    return [(ad,idx[ad][1]) for ad in sorted(idx) if a<=ad<b]
def parse_dispatch(start,end):
    ins=asm_range(start,end); cases={}
    lastcmp=None
    for k,(ad,t) in enumerate(ins):
        m=re.match(r"cmpil #(\d+),%d0",t)
        if m: lastcmp=int(m.group(1))
        m=re.match(r"moveq #(\d+),%d1",t)
        if m and ins[k+1][1].startswith("cmpl %d0,%d1"): lastcmp=int(m.group(1))
        if t.startswith("tstl %d0") : lastcmp=0
        m=re.match(r"beq[ws]? (0x[0-9a-f]+)",t)
        if m and lastcmp is not None:
            cases[lastcmp]=int(m.group(1),16); lastcmp=None
    return cases
def case_info(addr):
    a=addr; d4=d3=h=None
    for _ in range(6):
        if a not in idx: break
        t=idx[a][1]
        m=re.match(r"movel #(\d+),%d4",t)
        if m: d4=int(m.group(1))
        m=re.match(r"movel #(\d+),%d3",t)
        if m: d3=int(m.group(1))
        m=re.match(r"movel %d4,%d3",t)
        if m: d3=d4
        m=re.match(r"lea (0x[0-9a-f]+),%a2",t)
        if m: h=int(m.group(1),16)
        if t.startswith(("braw","bras","bra ")): break
        a=sorted(x for x in idx if x>a)[0]
    return d4,d3,h
def handler_names(h):
    names=[]
    ad=h; n=0
    ks=sorted(idx)
    pos=ks.index(h) if h in idx else None
    if pos is None: return names
    for ad in ks[pos:pos+500]:
        t=idx[ad][1]
        for m in re.finditer(r"pea (0x[0-9a-f]+)|pea %pc@\((0x[0-9a-f]+)\)|#(\d{6,8})",t):
            v=m.group(1) or m.group(2) or (m.group(3) and int(m.group(3)))
            v=int(v,16) if isinstance(v,str) else v
            if v and 0x300000<v<len(D)-5:
                try:
                    s=cstr(v)
                    mm=re.match(r"[a-z_0-9]+_1\b",s)
                    if mm and mm.group(0) not in names: names.append(mm.group(0))
                except ValueError: pass
        if t.startswith("rts") : break
    return names
if __name__=="__main__":
    start=int(sys.argv[1],16); end=int(sys.argv[2],16)
    cases=parse_dispatch(start,end)
    for c in sorted(cases):
        d4,d3,h=case_info(cases[c])
        nm=handler_names(h) if h else []
        print(c, "arg_xdr=%s res_xdr=%s handler=%s"%(hex(d4) if d4 else None,hex(d3) if d3 else None,hex(h) if h else None), nm)

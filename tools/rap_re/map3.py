import re,sys,bisect
sys.path.insert(0,"/tmp/claude-1000/re")
import map_cmds as M
from map2 import codes,blocks,ks
def body(h):
    pos=bisect.bisect_left(ks,h); out=[]
    for a in ks[pos:pos+4000]:
        t=M.idx[a][1]; out.append((a,t))
        if t.startswith("rts") and len(out)>1 and out[-2][1].startswith("unlk"): break
    return out
def strs(b):
    res=[]
    for a,t in b:
        for m in re.finditer(r"pea (0x[0-9a-f]+)|pea %pc@\((0x[0-9a-f]+)\)|movel #(\d+),%sp@-",t):
            v=m.group(1) or m.group(2) or m.group(3)
            v=int(v,16) if v.startswith("0x") else int(v)
            if 0x340000<v<len(M.D)-5:
                try: s=M.cstr(v)
                except ValueError: continue
                if len(s)>5 and re.match(r"[ -~\n]+$",s): res.append(s.split("\n")[0][:60])
    return res
if __name__=="__main__":
    for c,b in zip(codes,blocks):
        d4,d3,h=M.case_info(b); bd=body(h); ss=strs(bd)
        print(c,hex(h),"len=%d"%(bd[-1][0]-h), "calls=%d"%sum(1 for a,t in bd if t.startswith(("bsrl","jsr"))), ss[:3])

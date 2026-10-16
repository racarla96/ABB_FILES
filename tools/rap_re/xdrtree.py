import sys,re,bisect
sys.path.insert(0,"/tmp/claude-1000/re")
import map_cmds as M
ks=sorted(M.idx)
PRIM={0x3a480c:"long",0x3a484e:"ulong",0x3a4890:"short",0x3a48e6:"ushort",0x3a4a10:"enum"}
def fn_body(a):
    pos=bisect.bisect_left(ks,a); out=[]
    for ad in ks[pos:pos+800]:
        t=M.idx[ad][1]; out.append((ad,t))
        if t.startswith("rts") and len(out)>1 and out[-2][1].startswith("unlk"): break
    return out
def describe(a,depth=0,seen=None,maxd=4):
    """list of (offset, kind) in wire order for xdr function at a"""
    if a in PRIM: return [(0,PRIM[a])]
    b=fn_body(a); res=[]; off=None; pend=[]
    # alias: pushes fp@(12), fp@(8) then bsr
    txt=[t for _,t in b]
    for i,(ad,t) in enumerate(b):
        m=re.match(r"pea %a2@\((\d+)\)",t)
        if m: off=int(m.group(1))
        elif t.startswith("movel %a2,%sp@-"): off=0
        elif t.startswith("movel %fp@(12),%sp@-") and i+1<len(b) and b[i+1][1].startswith("movel %fp@(8),%sp@-"): off=0
        m=re.match(r"bsr[lw] (0x[0-9a-f]+)",t)
        if m and off is not None:
            tgt=int(m.group(1),16)
            # arguments for string/array: look back for pea 0x.. constants
            back=[x[1] for x in b[max(0,i-9):i]]
            consts=[re.match(r"pea (0x[0-9a-f]+)$",x).group(1) for x in back if re.match(r"pea (0x[0-9a-f]+)$",x)]
            if tgt==0x3a4c12: res.append((off,"string(max=%d)"%int(consts[-1],16) if consts else "string"))
            elif tgt==0x3a4d26:
                el=[x for x in back if re.match(r"pea (%pc@\()?0x3[0-9a-f]{5}",x)]
                res.append((off,"array(max=%s, esz=%s, elem=%s)"%(consts[-3] if len(consts)>2 else "?",consts[-2] if len(consts)>1 else "?",el[-1] if el else "?")))
            elif tgt==0x3a4a24: res.append((off,"opaque"))
            elif tgt in PRIM: res.append((off,PRIM[tgt]))
            elif M.D and 0x36e000<=tgt<0x372000 and depth<maxd:
                sub=describe(tgt,depth+1,seen,maxd)
                if len(sub)==1 and sub[0][0]==0: res.append((off,sub[0][1]))
                else: res.append((off,("struct",[(o,k) for o,k in sub])))
            else: res.append((off,"call %x"%tgt))
            off=None
    return res
def fmt(items,ind=0):
    out=[]
    for o,k in items:
        if isinstance(k,tuple): out.append("  "*ind+"+%d: struct"%o); out+=fmt(k[1],ind+1)
        else: out.append("  "*ind+"+%d: %s"%(o,k))
    return out
if __name__=="__main__":
    for a in sys.argv[1:]:
        print("== xdr",a); print("\n".join(fmt(describe(int(a,16)))))

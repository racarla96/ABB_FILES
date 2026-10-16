import re,sys,bisect
sys.path.insert(0,"/tmp/claude-1000/re")
import map_cmds as M
codes=[1,2,3,4,5]+list(range(1001,1010))+[1501,1502]+list(range(2001,2012))
blocks=[0x37203e,0x372054,0x372066,0x37207c,0x372092,0x3720a8,0x3720be,0x3720d4,0x3720ea,0x372100,0x372116,0x37212c,0x372142,0x372158,0x37216e,0x372184,0x37219a,0x3721b0,0x3721c6,0x3721dc,0x3721f2,0x372208,0x37221c,0x372230,0x372244,0x372258,0x37226c]
ks=sorted(M.idx)
def func_names(h):
    pos=bisect.bisect_left(ks,h); names=[]
    j=pos+1
    while j<len(ks) and not M.idx[ks[j]][1].startswith("linkw %fp"): j+=1
    for a in ks[pos:j]:
        t=M.idx[a][1]
        for m in re.finditer(r"pea (0x[0-9a-f]+)|pea %pc@\((0x[0-9a-f]+)\)|movel #(\d+),%sp@-",t):
            v=m.group(1) or m.group(2) or m.group(3)
            v=int(v,16) if v.startswith("0x") else int(v)
            if 0x340000<v<len(M.D)-5:
                try: s=M.cstr(v)
                except ValueError: continue
                mm=re.match(r"([a-z]+_[a-z_0-9]+?_1)\b",s)
                if mm and mm.group(1) not in names: names.append(mm.group(1))
    return names,ks[j]-ks[pos]
rows=[]
for c,b in zip(codes,blocks):
    d4,d3,h=M.case_info(b)
    nm,size=func_names(h)
    rows.append((c,d4,d3,h,nm,size))
if __name__=="__main__":
    for c,d4,d3,h,nm,size in rows: print(c,"arg=%x res=%x handler=%x size=%d"%(d4,d3,h,size),nm)

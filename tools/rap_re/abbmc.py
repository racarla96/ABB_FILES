import sys
sys.path.insert(0,"/tmp/claude-1000/re")
from lzo import lzo1x
def unpack(d):
    p=d.index(b"\n")+1+8          # text line, then 8-byte (blank) field
    out=bytearray()
    while p<len(d):
        L=int(d[p:p+8].rstrip(b"\0")); s=p+8
        o,used=lzo1x(d,s)
        assert used==s+L,(p,used,s+L)
        out+=o; p=s+L
    return bytes(out)
if __name__=="__main__":
    res=b""
    for f in sys.argv[2:]:
        r=unpack(open(f,"rb").read()); print(f.split("/")[-1],len(r)); res+=r
    open(sys.argv[1],"wb").write(res)

%%%
  VERSION:1
  LANGUAGE:ENGLISH
%%%

MODULE RTTEST
  ! ReadTraj install test (EMU set, not an ABB program). Format v1: 32-byte records.
  ! PC side: PC/rt_send.py. Start this program first, then the sender within 30 s.
  VAR iodev rt_ch;
  VAR robtarget rt_buf{10};
  VAR num rt_n := 0;
  VAR clock rt_clk;

  PROC main()
    TPErase;
    TPWrite "RTTEST: start, run rt_send.py now";
    Open "sio1:", rt_ch \Bin;
    ClkReset rt_clk;
    ClkStart rt_clk;
    ReadTraj rt_ch, rt_buf, rt_n \Time:=30;
    ClkStop rt_clk;
    TPWrite "RT1 n=" \Num:=rt_n;
    TPWrite "RT1 x1=" \Num:=rt_buf{1}.trans.x;
    TPWrite "RT1 x10=" \Num:=rt_buf{10}.trans.x;
    TPWrite "RT1 q1=" \Num:=rt_buf{2}.rot.q1;
    TPWrite "RT1 cf1=" \Num:=rt_buf{1}.robconf.cf1;
    TPWrite "RT1 s=" \Num:=ClkRead(rt_clk);
    ReadTraj rt_ch, rt_buf, rt_n \Time:=5;
    TPWrite "RT2 n=" \Num:=rt_n;
    TPWrite "RT2 y2=" \Num:=rt_buf{2}.trans.y;
    TPWrite "RT2 q3=" \Num:=rt_buf{2}.rot.q3;
    ReadTraj rt_ch, rt_buf, rt_n \Time:=2;
    TPWrite "RT3 n=" \Num:=rt_n;
    Close rt_ch;
    TPWrite "RTTEST: end";
  ENDPROC
ENDMODULE

%%%
  VERSION:1
  LANGUAGE:ENGLISH
%%%

MODULE siotest
  !
  ! DESCRIPTION
  !
  ! Production test of serial channels SIO1, printer1, SIO3 and SIO4
  !
  ! 
  !   
  ! $Revision: 1.1 $
  !
  ! String constant arl_version
  CONST string arl_version:="$Revision: 1.1 $";
  CONST string test_string:="Z";
  VAR iodev ch_bin;
  VAR iodev ch_write;
  VAR num i;
  VAR num answer;
  VAR num in_buff;

  PROC sio_test()
    TPErase;
    TPWrite "Test of serial channel "\Num:=answer;
    IF answer=1 THEN
      Open "sio1:",ch_bin\Bin;
      Open "sio1:",ch_write\Write;
    ELSEIF answer=2 THEN
      Open "printer1:",ch_bin\Bin;
      Open "printer1:",ch_write\Write;
    ELSEIF answer=3 THEN
      Open "sio3:",ch_bin\Bin;
      Open "sio3:",ch_write\Write;
    ELSE
      Open "sio4:",ch_bin\Bin;
      Open "sio4:",ch_write\Write;
    ENDIF
    in_buff:=0;
    FOR i FROM 0 TO 255 DO
      Write ch_write,test_string\NoNewLine;
      in_buff:=ReadBin(ch_bin\Time:=30);
      IF in_buff<>90 THEN
        TPWrite "***** Error! *****";
        TPWrite "Transmitted data = 90";
        TPWrite "Received data = "\Num:=in_buff;
        WaitTime 3;
        Close ch_bin;
        Close ch_write;
        RETURN;
      ENDIF
      in_buff:=0;
    ENDFOR
    TPWrite "******** Test OK *******";
    Close ch_bin;
    Close ch_write;
    RETURN;
  ENDPROC

  PROC main()
    TPErase;
    TPReadFK answer,"Select a channel to test.","sio1","sio2","sio3","sio4","End";
    WHILE answer<5 DO
      sio_test;
      TPReadFK answer,"Select a channel to test.","sio1","sio2","sio3","sio4","End";
    ENDWHILE
    TPErase;
    TPWrite "End of sio test.";
    EXIT;
  ENDPROC
ENDMODULE


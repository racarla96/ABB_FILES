%%%
  VERSION:1
  LANGUAGE:ENGLISH
%%%

MODULE anio
  ! Definition of global variables
  VAR num i;

  PROC main()
    TPErase;
    TPWrite "THE TEST WILL TAKE 90 SECONDS";
    FOR i FROM 1 TO 10 DO
      antest ao1,ai1,"Fel ao1-ai1";
      antest ao2,ai2,"Fel ao2-ai2";
      antest ao3,ai3,"Fel ao3-ai3";
      antest ao4,ai4,"Fel ao4-ai4";
    ENDFOR
    TPWrite "Test OK";
    WaitTime 3;
    EXIT;
  ENDPROC

  PROC antest(
    VAR signalao anout,
    VAR signalai anin,
    string errstring)

    SetAO anout,5;
    WaitTime 0.2;
    IF AInput(anin)<4.8 OR AInput(anin)>5.2 THEN
      TPWrite errstring;
      WaitTime 2;
      EXIT;
    ENDIF
    SetAO anout,-5;
    WaitTime 0.2;
    IF AInput(anin)<-5.2 OR AInput(anin)>-4.8 THEN
      TPWrite errstring;
      WaitTime 2;
      EXIT;
    ENDIF
    SetAO anout,10;
    WaitTime 0.2;
    IF AInput(anin)<9.8 THEN
      TPWrite errstring;
      WaitTime 2;
      EXIT;
    ENDIF
    SetAO anout,-10;
    WaitTime 0.2;
    IF AInput(anin)>-9.8 THEN
      TPWrite errstring;
      WaitTime 2;
      EXIT;
    ENDIF
  ENDPROC
ENDMODULE


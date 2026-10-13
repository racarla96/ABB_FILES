%%%
  VERSION:1
  LANGUAGE:ENGLISH
%%%

MODULE rio_test
  !
  ! DESCRIPTION
  !
  ! Test of RIO board
  ! 
  ! 
  !   
  ! $Revision: 1.1 $
  !
  ! String constant arl_version
  CONST string arl_version:="$Revision: 1.1 $";
  CONST dionum on:=1;
  CONST dionum off:=0;
  VAR num answer;
  VAR num i;

  PROC test_rio()
    TPWrite "***** RIO test *****";
    FOR i FROM 1 TO 5 DO
      digtest RIO_O_G0_0,RIO_I_G0_0,"Error RIO_O_G0_0-RIO_I_G0_0";
      digtest RIO_O_G0_1,RIO_I_G0_1,"Error RIO_O_G0_1-RIO_I_G0_1";
      digtest RIO_O_G0_2,RIO_I_G0_2,"Error RIO_O_G0_2-RIO_I_G0_2";
      digtest RIO_O_G0_3,RIO_I_G0_3,"Error RIO_O_G0_3-RIO_I_G0_3";
      digtest RIO_O_G0_4,RIO_I_G0_4,"Error RIO_O_G0_4-RIO_I_G0_4";
      digtest RIO_O_G0_5,RIO_I_G0_5,"Error RIO_O_G0_5-RIO_I_G0_5";
      digtest RIO_O_G0_6,RIO_I_G0_6,"Error RIO_O_G0_6-RIO_I_G0_6";
      digtest RIO_O_G0_7,RIO_I_G0_7,"Error RIO_O_G0_7-RIO_I_G0_7";
      digtest RIO_O_G0_10,RIO_I_G0_10,"Error RIO_O_G0_10-RIO_I_G0_10";
      digtest RIO_O_G0_11,RIO_I_G0_11,"Error RIO_O_G0_11-RIO_I_G0_11";
      digtest RIO_O_G0_12,RIO_I_G0_12,"Error RIO_O_G0_12-RIO_I_G0_12";
      digtest RIO_O_G0_13,RIO_I_G0_13,"Error RIO_O_G0_13-RIO_I_G0_13";
      digtest RIO_O_G0_14,RIO_I_G0_14,"Error RIO_O_G0_14-RIO_I_G0_14";
      digtest RIO_O_G0_15,RIO_I_G0_15,"Error RIO_O_G0_15-RIO_I_G0_15";
      digtest RIO_O_G0_16,RIO_I_G0_16,"Error RIO_O_G0_16-RIO_I_G0_16";
      digtest RIO_O_G0_17,RIO_I_G0_17,"Error RIO_O_G0_17-RIO_I_G0_17";
    ENDFOR
    TPWrite "***** Test OK *****";
    RETURN;
  ENDPROC

  PROC digtest(
    VAR signaldo digout,
    VAR signaldi digin,
    string errstring)

    SetDO digout,on;
    WaitTime 0.2;
    IF DInput(digin)<>on THEN
      TPWrite errstring;
      WaitTime 5;
      EXIT;
    ENDIF
    SetDO digout,off;
  ENDPROC

  PROC main()
    TPErase;
    TPReadFK answer,"Start the test.","START","END","","","";
    WHILE answer=1 DO
      test_rio;
      TPReadFK answer,"Start the test.","START","END","","","";
      IF answer=2 THEN
        TPErase;
        TPWrite "End of test.";
        WaitTime 1;
        EXIT;
      ENDIF
    ENDWHILE
  ENDPROC
ENDMODULE


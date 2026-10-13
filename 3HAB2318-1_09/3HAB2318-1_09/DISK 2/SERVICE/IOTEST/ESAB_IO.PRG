%%%
  VERSION: 1
  LANGUAGE: ENGLISH
%%%

MODULE esab_io
!
! DESCRIPTION
!
! Test of analog and digital signals with ESAB OPT.32X
!
! 
!   
! $Revision: 1.1 $
!
! String constant arl_version

  CONST string arl_version :=  "$Revision: 1.1 $";
  CONST dionum on := 1;
  CONST dionum off := 0;

  VAR num answer;
  VAR signalao anout;
!  VAR signalai anin;
  VAR num i;

  PROC esab_test()
   TPWrite "***** Digital test *****";
   FOR i FROM 1 TO 5 DO
      digtest do1,di1,"Error do1-di1";
      digtest do2,di2,"Error do2-di2";
      digtest do3,di3,"Error do3-di3";
      digtest do4,di4,"Error do4-di4";
      digtest do5,di5,"Error do5-di5";
      digtest do6,di6,"Error do6-di6";
      digtest do7,di7,"Error do7-di7";
      digtest do8,di8,"Error do8-di8";
      digtest do9,di9,"Error do9-di9";
      digtest do10,di10,"Error do10-di10";
      digtest do11,di11,"Error do11-di11";
      digtest do12,di12,"Error do12-di12";
      digtest do13,di13,"Error do13-di13";
      digtest do14,di14,"Error do14-di14";
      digtest do15,di15,"Error do15-di15";
      digtest do16,di16,"Error do16-di16";
      digtest do17,di17,"Error do17-di17";
      digtest do18,di18,"Error do18-di18";
      digtest do19,di19,"Error do19-di19";
      digtest do20,di20,"Error do20-di20";
      SetDO do21, on;
      WaitTime 0.1;
      IF DInput(di7) <> on THEN
	TPWrite "Error do21-di7";
        WaitTime 5;
	EXIT;
      ENDIF
      SetDO do21, off;
    ENDFOR
    TPWrite "***** Digital test OK *****";
 
    TPWrite "***** Analog test *****";
     TPWrite "Analog channel 1 testing ...";
     FOR anout FROM 0 TO 10 STEP 1 DO
       SetAO ao1, anout;
       WaitTime 0.2;
!      IF AInput(ai1) > (anout+0.2) OR AInput(ai1) < (anout-0.2) THEN
!	TPWrite "Error in analog channel 1";
!	EXIT;
!      ENDIF
     ENDFOR
   
     TPWrite "Analog channel 2 testing ...";
     FOR anout FROM 0 TO 10 STEP 1 DO
       SetAO ao2, anout;
       WaitTime 0.2;
!      IF AInput(ai2) > (anout+0.2) OR AInput(ai2) < (anout-0.2) THEN
!	TPWrite "Error in analog channel 2";
!	EXIT;
!      ENDIF
     ENDFOR
     TPWrite "***** Test OK *****";
    RETURN;
   ENDPROC  

   PROC digtest(
     VAR signaldo digout,
     VAR signaldi digin,
     string errstring)
   
     SetDO digout, on;
     WaitTime 0.1;
     IF DInput(digin) <> on THEN
       TpWrite errstring;
       WaitTime 5;
       EXIT;
     ENDIF
     SetDO digout, off;
   ENDPROC

  PROC main()
    TPErase;
    TPReadFK answer,"Start the test.","START","END","","","";
    WHILE answer = 1 DO
      esab_test; 
      TPReadFK answer,"Start the test.","START","END","","","";
      IF answer = 2 THEN
        TPErase;
        TPWrite "End of test.";
        WaitTime 5;
        EXIT;
      ENDIF
    ENDWHILE
  ENDPROC
  
ENDMODULE

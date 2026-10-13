%%%
  VERSION:1
  LANGUAGE:ENGLISH
%%%

MODULE CAL6400
  !COPYRIGHT 1995 ABB ROBOTICS PRODUCTS AB
  !1995-05-08 /SL

  !#########################################################################
  !     Revision notes:
  !     RW2.0 Required
  !     Change MoveJ to MoveAbsJ    95-11-26/SLT
  !     before_norm_pos added     95-11-01/SLT
  !     stand_del_pos change MoveJ to MoveAbsJ  2.4/150, 2.8/120 S2.9/120   95-11-03/SLT
  !     New Calibration Procedure     95-11-03/SLT
  !     IRB6400C added    96-03-11/SLT
  !     before_norm_pos changed         96-04-12/SLT
  !
  !#########################################################################

  VAR num answer;
  VAR bool flag;
  VAR string irbtype;
  VAR jointtarget before_norm_pos;
  VAR jointtarget stand_norm_pos;
  VAR jointtarget stand_left_pos;
  VAR jointtarget stand_right_pos;
  VAR jointtarget stand_del_pos;
  VAR jointtarget stand_oil_ax2;
  VAR jointtarget stand_oil_ax4;
  VAR jointtarget stand_oil_ax5a;
  VAR jointtarget stand_oil_ax5b;
  VAR jointtarget stand_oil_ax6a;
  VAR jointtarget stand_oil_ax6b;
  VAR jointtarget CAL3;
  VAR jointtarget CAL4A;
  VAR jointtarget CAL4B;

  PROC haupt()
    main;
  ENDPROC

  PROC main()
    TPErase;
    TPWrite "CALIBRATION POSITION PROGRAM";
    TPReadFK answer,"Select type of IRB 6400/...","2.4_1XX","2.8_120","3.0_75","2.2_P75","More";
    TEST answer
    CASE 1:
      irbtype:="IRB6400/2.4_120/150/175kg";
      before_norm_pos:=[[-4,-4,4,4,-4,4],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      stand_norm_pos:=[[0,0,0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      stand_right_pos:=[[-90,0,0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      stand_left_pos:=[[90,0,0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      stand_del_pos:=[[0,16,80,0,9,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      CAL3:=[[0,0,0,-90,0,90],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      CAL4A:=[[0,0,0,-90,-90,90],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      CAL4B:=[[0,0,0,90,-90,90],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      stand_oil_ax4:=[[0,-64,0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      stand_oil_ax5a:=[[0,53,35,46,-12,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      stand_oil_ax5b:=[[0,56,37,-67,-10,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CASE 2:
      irbtype:="IRB6400/2.8_120";
      before_norm_pos:=[[-4,-4,4,4,-4,4],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      stand_norm_pos:=[[0,0,0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      stand_right_pos:=[[-90,0,0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      stand_left_pos:=[[90,0,0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      stand_del_pos:=[[0,0,64,0,-64,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      CAL3:=[[0,0,0,-90,0,90],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      CAL4A:=[[0,0,0,-90,-90,90],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      CAL4B:=[[0,0,0,90,-90,90],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      stand_oil_ax4:=[[0,0,0,-63,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      stand_oil_ax5a:=[[0,55.66,17.48,53.51,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      stand_oil_ax5b:=[[0,55.66,17.48,-68.8,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CASE 3:
      irbtype:="IRB6400/3.0_75";
      before_norm_pos:=[[-4,-4,4,4,-4,4],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      stand_norm_pos:=[[0,0,0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      stand_right_pos:=[[-90,0,0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      stand_left_pos:=[[90,0,0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      stand_del_pos:=[[0,0.73,64.79,0,30,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      CAL3:=[[0,0,0,-90,0,90],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      CAL4A:=[[0,0,0,-90,-90,90],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      CAL4B:=[[0,0,0,90,-90,90],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      stand_oil_ax4:=[[0,0,0,-63,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      stand_oil_ax5a:=[[0,55.66,17.48,53.51,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      stand_oil_ax5b:=[[0,55.66,17.48,-68.8,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CASE 4:
      irbtype:="IRB6400/2.25_PE75";
      before_norm_pos:=[[-4,-4,4,4,-4,4],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      stand_norm_pos:=[[0,0,0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      stand_right_pos:=[[-90,0,0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      stand_left_pos:=[[90,0,0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      stand_del_pos:=[[0,15,80,0,-89,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      CAL3:=[[0,0,0,-90,0,90],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      CAL4A:=[[0,0,0,-90,-90,90],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      CAL4B:=[[0,0,0,90,-90,90],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      stand_oil_ax4:=[[0,0,0,-63,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      stand_oil_ax5a:=[[0,55.66,17.48,53.51,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      stand_oil_ax5b:=[[0,55.66,17.48,-68.8,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CASE 5:
      more_types;
    ENDTEST
    pos_routine;
  ENDPROC

  PROC more_types()
  TPReadFK answer,"Select type of IRB 6400/...","S2.9_120","C","","","Exit";
    TEST answer
    CASE 1:
      irbtype:="IRB6400/S2.9_120";
      before_norm_pos:=[[-5,55,65,5,-5,5],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      stand_norm_pos:=[[0,60,60,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      stand_right_pos:=[[-90,60,60,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      stand_left_pos:=[[90,60,60,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      stand_del_pos:=[[0,12,58,0,-60,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      CAL3:=[[0,60,60,-90,0,90],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      CAL4A:=[[0,60,60,-90,-90,90],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      CAL4B:=[[0,60,60,90,-90,90],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      stand_oil_ax4:=[[0,60,0,-63,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      stand_oil_ax5a:=[[0,115,17.48,53.51,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      stand_oil_ax5b:=[[0,115,17.48,-68.8,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CASE 2:
      compact;
    CASE 5:
      main;
    ENDTEST
    pos_routine;
  ENDPROC

  PROC pos_routine()
    flag:=TRUE;
    WHILE flag DO
      TPErase;
      TPWrite "Positioning routines for ";
      TPWrite irbtype;
      TPReadFK answer,"Calibration, delivery or oil plug check...","Cal.pos","Del.pos","Oil_pos","","Exit";
      TEST answer
      CASE 1:
        calibrate;
      CASE 2:
        home_del_pos;
      CASE 3:
        home_oil_pos;
      CASE 5:
        flag:=FALSE;
      ENDTEST
    ENDWHILE
  ENDPROC

  PROC compact()
    irbtype:="IRB6400/C";
      before_norm_pos:=[[-4,-4,4,4,-4,4],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      stand_norm_pos:=[[0,0,-9.331191,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      stand_del_pos:=[[0,0,80,0,90,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      CAL3:=[[0,0,-9.331191,-90,0,90],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      CAL4A:=[[0,0,-9.331191,-90,-90,90],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      CAL4B:=[[0,0,-9.331191,90,-90,90],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      stand_oil_ax2:=[[-49,0,0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      stand_oil_ax4:=[[61,0,67,0,-116,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      stand_oil_ax5a:=[[65,0,-4,-85,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      stand_oil_ax5b:=[[68,0,-17,90,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      stand_oil_ax6a:=[[68,0,-17,0,-45,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      stand_oil_ax6b:=[[68,0,-17,0,-118,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    flag:=TRUE;
    WHILE flag DO
      TPErase;
      TPWrite "Calibration routines for ";
      TPWrite irbtype;
      TP_Read_FK answer,"Select calibration position...","Cal_pos","Calib","Del.pos","Oil_pos","Exit";
      TEST answer
      CASE 1:
        c_home_stand;
      CASE 2:
        c_calib;
      CASE 3:
        home_del_pos;
      CASE 4:
        compact_oil_pos;
      CASE 5:
        flag:=FALSE;
      ENDTEST
    ENDWHILE
  ENDPROC

  PROC calibrate()
    flag:=TRUE;
    WHILE flag DO
      TPErase;
      TPWrite "Calibration routines for ";
      TPWrite irbtype;
      TPReadFK answer,"Select calibration position...","Normal","Left","Right","Calib","Exit";
      TEST answer
      CASE 1:
        home_stand_norm;
      CASE 2:
        home_stand_left;
      CASE 3:
        home_stand_right;
      CASE 4:
        calib;
      CASE 5:
        flag:=FALSE;
      ENDTEST
    ENDWHILE
  ENDPROC

 PROC calib()
    flag:=TRUE;
    WHILE flag DO
      TP_Read_FK answer,"Calibration position...","CAL3","CAL4A","CAL4B","CAL5","Exit";
      TEST answer
      CASE 1:
        MoveAbsJ CAL4A,v200,fine,tool0;
        MoveAbsJ CAL3,v200,fine,tool0;
      CASE 2:
        MoveAbsJ CAL4A,v200,fine,tool0;
      CASE 3:
        MoveAbsJ stand_norm_pos,v200,fine,tool0;
        MoveAbsJ CAL4B,v200,fine,tool0;
      CASE 4:
        MoveAbsJ stand_norm_pos,v200,fine,tool0;
      CASE 5:
        flag:=FALSE;
      ENDTEST
    ENDWHILE
  ENDPROC

 PROC c_calib()
    flag:=TRUE;
    WHILE flag DO
      TP_Read_FK answer,"Calibration position...","CAL3","CAL4A","CAL4B","CAL5","Exit";
      TEST answer
      CASE 1:
        MoveAbsJ CAL4A,v200,fine,tool0;
        MoveAbsJ CAL3,v200,fine,tool0;
      CASE 2:
        MoveAbsJ CAL4A,v200,fine,tool0;
      CASE 3:
        MoveAbsJ stand_norm_pos,v200,fine,tool0;
        MoveAbsJ CAL4B,v200,fine,tool0;
      CASE 4:
        MoveAbsJ stand_norm_pos,v200,fine,tool0;
      CASE 5:
        flag:=FALSE;
      ENDTEST
    ENDWHILE
   compact;
  ENDPROC

  PROC home_stand_norm()
    TPWrite "Moving to normal position (sync.pos 0)..";
    TPWrite "Axis 1      0 deg";
    TPWrite "     2      0 (shelf=+60)";
    TPWrite "     3      0 (shelf=+60)";
    MoveAbsJ before_norm_pos,v200,fine,tool0;
    MoveAbsJ stand_norm_pos,v200,fine,tool0;
  ENDPROC

  PROC c_home_stand()
    TPWrite "Moving to normal position (sync.pos 0)..";
    TPWrite "Axis 1      0 deg";
    TPWrite "     2      -9.3 deg";
    TPWrite "     3        0 deg";
    MoveAbsJ before_norm_pos,v200,fine,tool0;
    MoveAbsJ stand_norm_pos,v200,fine,tool0;
    compact;
  ENDPROC

  PROC home_stand_right()
    TPWrite "Moving to right position (sync.pos 1)...";
    TPWrite "Axis 1    -90 deg";
    TPWrite "     2      0 (shelf=+60)";
    TPWrite "     3      0 (shelf=+60)";
    MoveAbsJ stand_right_pos,v200,fine,tool0;
  ENDPROC

  PROC home_stand_left()
    TPWrite "Moving to left position (sync.pos 2)...";
    TPWrite "Axis 1    +90 deg";
    TPWrite "     2      0 (shelf=+60)";
    TPWrite "     3      0 (shelf=+60)";
    MoveAbsJ stand_left_pos,v200,fine,tool0;
  ENDPROC

  PROC home_oil_pos()
    TPWrite "Moving to check oil plug axis 4";
    MoveAbsJ stand_oil_ax4,v200,fine,tool0;
    TPReadFK answer,"Next, axis 5 pos 1","Next","","","","";
    MoveAbsJ stand_oil_ax5a,v200,fine,tool0;
    TPReadFK answer,"Next, axis 5 pos 2","Next","","","","";
    MoveAbsJ stand_oil_ax5b,v200,fine,tool0;
  ENDPROC

  PROC compact_oil_pos()
    TPWrite "Moving to check oil plug axis 2";
    MoveAbsJ stand_oil_ax2,v200,fine,tool0;
    TP_Read_FK answer,"Next, axis 4 ","Next","","","","";
    MoveAbsJ stand_oil_ax4,v200,fine,tool0;
    TP_Read_FK answer,"Next, axis 5 pos 1","Next","","","","";
    MoveAbsJ stand_oil_ax5a,v200,fine,tool0;
    TP_Read_FK answer,"Next, axis 5 pos 2","Next","","","","";
    MoveAbsJ stand_oil_ax5b,v200,fine,tool0;
    TP_Read_FK answer,"Next, axis 6 pos 1","Next","","","","";
    MoveAbsJ stand_oil_ax6a,v200,fine,tool0;
    TP_Read_FK answer,"Next, axis 6 pos 2","Next","","","","";
    MoveAbsJ stand_oil_ax6b,v200,fine,tool0;
  ENDPROC

  PROC home_del_pos()
    TPWrite "Moving to delivery position";
    MoveAbsJ stand_del_pos,v200,fine,tool0;
  ENDPROC
ENDMODULE


%%%
  VERSION:1
  LANGUAGE:ENGLISH
%%%

MODULE CAL2400
  !COPYRIGHT 1996 ABB ROBOTICS PRODUCTS AB
  !1996-03-12

  !#################################################################
  !     Revision notes:
  !     RW2.0 or better required
  !     NEW IRB240 calibration program  1996-03-12/SLT
  !     Hang, delpos L, 10, 16 added      1996-03-15/SLT
  !
  !
  !#################################################################

  ! Definition of global variables
  VAR num answer;
  VAR bool flag;
  VAR string irbtype;

  ! Definition of robtargets
  VAR jointtarget stand_norm_pos;
  VAR jointtarget stand_left_pos;
  VAR jointtarget stand_right_pos;
  VAR jointtarget back_norm_pos;
  VAR jointtarget back_left_pos;
  VAR jointtarget back_right_pos;
  VAR jointtarget del_pos_L;
  VAR jointtarget del_pos_10;
  VAR jointtarget del_pos_16;
  VAR jointtarget CAL3;
  VAR jointtarget CAL4A;
  VAR jointtarget CAL4B;
  VAR jointtarget CAL5;
  VAR jointtarget CAL31;
  VAR jointtarget CAL4A1;
  VAR jointtarget CAL4B1;
  VAR jointtarget CAL51;

  PROC haupt()
    main;
  ENDPROC

  PROC main()
    TPErase;
    TPWrite "CALIBRATION POSITION PROGRAM";
    TPReadFK answer,"Select type of IRB...","2400","","","","EXIT";
    TEST answer
    CASE 1:
      irbtype:="IRB2400";
      stand_norm_pos:=[[0,0,0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      stand_right_pos:=[[-90,0,0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      stand_left_pos:=[[90,0,0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      back_norm_pos:=[[0,-90,-90,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      back_right_pos:=[[-90,-90,-90,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      back_left_pos:=[[90,-90,-90,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      del_pos_L:=[[0,0,80,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      del_pos_10:=[[0,0,80,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      del_pos_16:=[[0,0,80,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      CAL3:=[[0,0,0,-90,0,90],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      CAL4A:=[[0,0,0,-90,-90,90],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      CAL4B:=[[0,0,0,90,-90,90],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      CAL5:=[[0,0,0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      CAL31:=[[0,0,0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      CAL4A1:=[[0,0,0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      CAL4B1:=[[0,0,0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      CAL51:=[[0,0,0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CASE 5:
      TPWrite "Exit program";
      EXIT;
    ENDTEST
    flag:=TRUE;
    WHILE flag DO
      TPErase;
      TPWrite "Calibration program for ";
      TPWrite irbtype;
      TPReadFK answer,"Select operation ...","Calib","Cal.pos","Del.pos","","Exit";
      TEST answer
      CASE 1:
        calib;
      CASE 2:
        cal_pos;
      CASE 3:
        del_pos;
      CASE 5:
        flag:=FALSE;
      ENDTEST
    ENDWHILE
  ENDPROC

  PROC calib()
    flag:=TRUE;
    WHILE flag DO
    TPReadFK answer,"Calibration position...","CAL3","CAL4A","CAL4B","CAL5","Exit";
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

  PROC cal_pos()
    flag:=TRUE;
    WHILE flag DO
      TPErase;
      TPWrite "Calibration routines for ";
      TPWrite irbtype;
      TPReadFK answer,"Select calibration position 0-3 ","Normal","Right","Left","Hang","Exit";
      TEST answer
      CASE 1:
        home_stand_norm;
      CASE 2:
        home_stand_right;
      CASE 3:
        home_stand_left;
      CASE 4:
       home_back_norm;
      CASE 5:
        flag:=FALSE;
      ENDTEST
    ENDWHILE
  ENDPROC

  PROC home_stand_norm()
    TPErase;
    TPWrite "Moving to normal position (sync.pos 0)";
    TPWrite "Axis 1      0 deg";
    TPWrite "     2      0";
    TPWrite "     3      0";
    MoveAbsJ stand_norm_pos,v200,fine,tool0;
  ENDPROC

  PROC home_stand_right()
    TPErase;
    TPWrite "Moving to right position (sync.pos 1)";
    TPWrite "Axis 1    -90 deg";
    TPWrite "     2      0";
    TPWrite "     3      0";
    MoveAbsJ stand_right_pos,v200,fine,tool0;
  ENDPROC

  PROC home_stand_left()
    TPErase;
    TPWrite "Moving to left position (sync.pos 2)";
    TPWrite "Axis 1    +90 deg";
    TPWrite "     2      0";
    TPWrite "     3      0";
    MoveAbsJ stand_left_pos,v200,fine,tool0;
  ENDPROC

  PROC home_back_norm()
    TPErase;
    TPWrite "Moving to normal position (sync.pos 3)";
    TPWrite "Axis 1      0 deg";
    TPWrite "     2    -90";
    TPWrite "     3    -90";
    MoveAbsJ back_norm_pos,v200,fine,tool0;
  ENDPROC

  PROC del_pos()
    flag:=TRUE;
    WHILE flag DO
      TPErase;
      TPReadFK answer,"Select type of IRB2400/...","L","10","16","","Exit";
      TEST answer
      CASE 1:
        TPWrite "Moving to delivery position";
        MoveAbsJ del_pos_L,v200,fine,tool0;
      CASE 2:
        TPWrite "Moving to delivery position";
        MoveAbsJ del_pos_10,v200,fine,tool0;
      CASE 3:
        TPWrite "Moving to delivery position";
        MoveAbsJ del_pos_16,v200,fine,tool0;
      CASE5:
        EXIT;
    ENDTEST
   ENDWHILE
  ENDPROC
ENDMODULE

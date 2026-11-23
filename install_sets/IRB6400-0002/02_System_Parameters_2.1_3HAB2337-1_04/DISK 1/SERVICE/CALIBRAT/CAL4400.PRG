%%%
  VERSION:1
  LANGUAGE:ENGLISH
%%%

MODULE CAL4400
  !COPYRIGHT 1995 ABB ROBOTICS PRODUCTS AB
  !1995-02-03

  !############################################
  !     Revision notes:
  !     RW2.0 Required
  !     Change MoveJ to MoveAbsJ    95-11-26/SLT
  !
  !############################################

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
  VAR robtarget stand_del_pos;
  VAR robtarget CAL3;
  VAR robtarget CAL4A;
  VAR robtarget CAL4B;
  VAR robtarget CAL5;
  VAR robtarget CAL31;
  VAR robtarget CAL4A1;
  VAR robtarget CAL4B1;
  VAR robtarget CAL51;

  PROC haupt()
    main;
  ENDPROC

  PROC main()
    TPErase;
    TPWrite "CALIBRATION POSITION PROGRAM";
    TPReadFK answer,"Select type of IRB...","4400","","","","EXIT";
    TEST answer
    CASE 1:
      irbtype:="IRB4400";
      stand_norm_pos:=[[0,0,0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      stand_right_pos:=[[-90,0,0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      stand_left_pos:=[[90,0,0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      back_norm_pos:=[[0,-90,-90,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      back_right_pos:=[[-90,-90,-90,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      back_left_pos:=[[90,-90,-90,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      stand_del_pos:=[[552.1,-0.1,894.8],[0.9991,0.00023,0.04246,6E-05],[-1,0,0,0],[0,0,0,0,0,0]];
      CAL3:=[[1220,0,1720],[0.707107,0,0.707107,0],[0,-2,1,0],[0,0,0,0,0,0]];
      CAL4A:=[[1080,140,1720],[0.5,-0.5,0.5,0.5],[0,-2,1,0],[0,0,0,0,0,0]];
      CAL4B:=[[1080,-140,1720],[0.5,0.5,-0.5,0.5],[0,0,1,0],[0,0,0,0,0,0]];
      CAL5:=[[1220,0,1720],[0.5,0.5,0.5,0.5],[0,1,0,0],[0,0,0,0,0,0]];
      CAL31:=[[1220,0,1720],[0.707107,0,0.707107,0],[0,1,-2,0],[0,0,0,0,0,0]];
      CAL4A1:=[[1080,140,1720],[0.5,-0.5,0.5,0.5],[0,1,-2,0],[0,0,0,0,0,0]];
      CAL4B1:=[[1080,-140,1720],[0.5,0.5,-0.5,0.5],[0,-2,-2,0],[0,0,0,0,0,0]];
      CAL51:=[[1220,0,1720],[0.5,-0.5,0.5,-0.5],[0,-2,0,0],[0,0,0,0,0,0]];
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
        TPWrite "Moving to delivery position";
        MoveJ stand_del_pos,v200,fine,tool0;
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
        MoveJ CAL4A,v200,fine,tool0;
        MoveJ CAL3,v200,fine,tool0;
      CASE 2:
        MoveJ CAL4A,v200,fine,tool0;
      CASE 3:
        MoveAbsJ stand_norm_pos,v200,fine,tool0;
        MoveJ CAL4B,v200,fine,tool0;
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
      TPReadFK answer,"Select calibration position 0-2 (N_R_L)","Normal","Right","Left","","Exit";
      TEST answer
      CASE 1:
        home_stand_norm;
      CASE 2:
        home_stand_right;
      CASE 3:
        home_stand_left;
      CASE 5:
        flag:=FALSE;
      ENDTEST
    ENDWHILE
  ENDPROC

  PROC home_stand_norm()
    TPWrite "Moving to normal position (sync.pos 0)";
    TPWrite "Axis 1      0 deg";
    TPWrite "     2      0";
    TPWrite "     3      0";
    MoveAbsJ stand_norm_pos,v200,fine,tool0;
  ENDPROC

  PROC home_stand_right()
    TPWrite "Moving to right position (sync.pos 1)";
    TPWrite "Axis 1    -90 deg";
    TPWrite "     2      0";
    TPWrite "     3      0";
    MoveAbsJ stand_right_pos,v200,fine,tool0;
  ENDPROC

  PROC home_stand_left()
    TPWrite "Moving to left position (sync.pos 2)";
    TPWrite "Axis 1    +90 deg";
    TPWrite "     2      0";
    TPWrite "     3      0";
    MoveAbsJ stand_left_pos,v200,fine,tool0;
  ENDPROC

!  PROC back_stand_norm()
!   TPWrite "Moving to normal position (sync.pos 3)";
!   TPWrite "Axis 1    0 deg";
!   TPWrite "     2      -90";
!   TPWrite "     3      0";
!   MoveAbsJ back_stand_pos,v200,fine,tool0;
! ENDPROC

!  PROC back_stand_right()
!   TPWrite "Moving to right position (sync.pos 4)";
!   TPWrite "Axis 1    -90 deg";
!   TPWrite "     2      -90";
!   TPWrite "     3      0";
!   MoveJ stand_left_pos,v200,fine,tool0;
! ENDPROC

!  PROC back_stand_left()
!   TPWrite "Moving to left position (sync.pos 5)";
!   TPWrite "Axis 1    +90 deg";
!   TPWrite "     2      -90";
!   TPWrite "     3      0";
!   MoveAbsJ back_left_pos,v200,fine,tool0;
! ENDPROC
ENDMODULE


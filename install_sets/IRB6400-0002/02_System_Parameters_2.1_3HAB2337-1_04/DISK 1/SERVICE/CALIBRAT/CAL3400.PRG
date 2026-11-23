%%%
  VERSION:1
  LANGUAGE:ENGLISH
%%%

MODULE CAL3400
  !COPYRIGHT 1995 ABB ROBOTICS PRODUCTS AB
  !1995-02-14

  !############################################
  !     Revision notes:
  !     RW2.0 Required
  !     Change MoveJ to MoveAbsJ    95-11-26/SLT
  !
  !############################################


  VAR num answer;
  VAR bool flag;
  VAR string irbtype;
  VAR jointtarget stand_norm_pos;
  VAR jointtarget stand_left_pos;
  VAR jointtarget stand_right_pos;
  VAR robtarget stand_del_pos;

  PROC haupt()
    main;
  ENDPROC

  PROC main()
    TPErase;
    TPWrite "CALIBRATION POSITION PROGRAM";
    TPReadFK answer,"Select type of IRB 3400/...","1.95_30","F1.95_30","2.5_10","","EXIT";
    TEST answer
    CASE 1:
      irbtype:="IRB3400/1.95_30";
      stand_norm_pos:=[[0,0,0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      stand_right_pos:=[[-90,0,0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      stand_left_pos:=[[90,0,0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      stand_del_pos:=[[716.58,0,1823.91],[5.5E-05,-2.2E-05,-1,-7.6E-05],[-1,0,0,0],[0,0,0,0,0,0]];
    CASE 2:
      irbtype:="IRB3400/F1.95_30";
      stand_norm_pos:=[[0,0,0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      stand_right_pos:=[[-90,0,0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      stand_left_pos:=[[90,0,0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      stand_del_pos:=[[716.58,-0.01,1823.91],[5.5E-05,-2.2E-05,-1,-6.6E-05],[-1,0,0,0],[0,0,0,0,0,0]];
    CASE 3:
      irbtype:="IRB3400/2.5_10";
      stand_norm_pos:=[[0,0,0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      stand_right_pos:=[[-90,0,0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      stand_left_pos:=[[90,0,0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      stand_del_pos:=[[1354.72,-0.04,1853.27],[8.3E-05,0.000115,1,3.8E-05],[-1,0,0,0],[0,0,0,0,0,0]];
    CASE 5:
      TPWrite "Exit program";
      EXIT;
    ENDTEST
    flag:=TRUE;
    WHILE flag DO
      TPErase;
      TPWrite "Calibration routines for ";
      TPWrite irbtype;
      TPReadFK answer,"Select calibration position...","Normal","Left","Right","Del.pos","Exit";
      TEST answer
      CASE 1:
        home_stand_norm;
      CASE 2:
        home_stand_left;
      CASE 3:
        home_stand_right;
      CASE 4:
        home_del_pos;
      CASE 5:
        flag:=FALSE;
      ENDTEST
    ENDWHILE
  ENDPROC

  PROC home_stand_norm()
    TPWrite "Moving to normal position...";
    TPWrite "Axis 1      0 deg";
    TPWrite "     2      0";
    TPWrite "     3      0";
    MoveAbsJ stand_norm_pos,v200,fine,tool0;
  ENDPROC

  PROC home_stand_left()
    TPWrite "Moving to left position...";
    TPWrite "Axis 1    +90 deg";
    TPWrite "     2      0";
    TPWrite "     3      0";
    MoveAbsJ stand_left_pos,v200,fine,tool0;
  ENDPROC

  PROC home_stand_right()
    TPWrite "Moving to right position...";
    TPWrite "Axis 1    -90 deg";
    TPWrite "     2      0";
    TPWrite "     3      0";
    MoveAbsJ stand_right_pos,v200,fine,tool0;
  ENDPROC

  PROC home_del_pos()
    TPWrite "Moving to delivery position";
    MoveJ stand_del_pos,v200,fine,tool0;
  ENDPROC
ENDMODULE


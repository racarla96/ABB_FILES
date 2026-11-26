%%%
  VERSION:1
  LANGUAGE:ENGLISH
%%%

MODULE CAL2400
  !COPYRIGHT 1994 ABB ROBOTICS PRODUCTS AB
  !1994-12-08

  !############################################
  !     Revision notes:
  !     RW2.0 Required
  !     Change MoveJ to MoveAbsJ    95-10-26/SLT
  !
  !############################################

  VAR num answer;
  VAR num robot_type;
  VAR robtarget stand_oil_out;
  VAR robtarget stand_oil_in;
  VAR robtarget stand_del_pos;
  VAR jointtarget stand_norm_pos;
  VAR jointtarget stand_left_pos;
  VAR jointtarget stand_right_pos;
  VAR jointtarget hang_norm_pos;
  VAR jointtarget hang_left_pos;
  VAR jointtarget hang_right_pos;

  PROC haupt()
    main;
  ENDPROC

  PROC main()
    robot_type:=2400;
    TPErase;
    TPWrite "CALIBRATION POSITION PROGRAM";
    TPReadFK answer,"Select robot type...","IRB2400","","","","EXIT";
    TEST answer
    CASE 1:
      robot_type:=2400;
      stand_norm_pos:=[[0,0,0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      stand_right_pos:=[[-90,0,0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      stand_left_pos:=[[90,0,0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      hang_norm_pos:=[[0,-90,-90,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      hang_right_pos:=[[-90,-90,-90,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      hang_left_pos:=[[90,-90,-90,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      stand_del_pos:=[[418.6,0,901.4],[0.35593,0,-0.93451,0],[-1,0,0,0],[0,0,0,0,0,0]];
      stand_oil_out:=[[343.2,1512,577.1],[0.50146,-0.84535,-0.0806,0.16563],[0,-2,-1,0],[0,0,0,0,0,0]];
      stand_oil_in:=[[410.84,1523.26,1170.19],[0.156467,0.070568,0.718871,0.673619],[0,0,-1,0],[0,0,0,0,0,0]];
    CASE 5:
      TPWrite "Exit program";
      EXIT;
    ENDTEST
    TPWrite "Calibration routines for IRB"\Num:=robot_type;
    WHILE TRUE DO
      TPReadFK answer,"Select mounting position...","Normal","Hanging","Del.pos","Oil.ch.","EXIT";
      TEST answer
      CASE 1:
        stand_rob_menu;
      CASE 2:
        hang_robot_menu;
      CASE 3:
        home_del_pos;
      CASE 4:
        home_oil_pos;
      CASE 5:
        TPWrite "Exit program";
        EXIT;
      ENDTEST
    ENDWHILE
  ENDPROC

  PROC stand_rob_menu()
    VAR bool flag;

    flag:=TRUE;
    WHILE flag DO
      TPWrite "Menu for standing robot.";
      TPReadFK answer,"Select calibration position...","Normal","Left","Right","","Exit";
      TEST answer
      CASE 1:
        home_stand_norm;
      CASE 2:
        home_stand_left;
      CASE 3:
        home_stand_right;
      CASE 5:
        flag:=FALSE;
      ENDTEST
    ENDWHILE
  ENDPROC

  PROC hang_robot_menu()
    VAR bool flag;

    flag:=TRUE;
    WHILE flag DO
      TPWrite "Menu for hanging robot.";
      TPReadFK answer,"Select calibration position...","Normal","Left","Right","","Exit";
      TEST answer
      CASE 1:
        home_hang_norm;
      CASE 2:
        home_hang_left;
      CASE 3:
        home_hang_right;
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

  PROC home_del_pos()
    TPWrite "Moving to delivery position";
    MoveJ stand_del_pos,v200,fine,tool0;
  ENDPROC

  PROC home_oil_pos()
    TPWrite "Moving to oil change position";
    MoveJ stand_oil_out,v200,fine,tool0;
    TPReadFK answer,"Next, filling-up pos","Next","","","","";
    TPWrite "Moving to filling-up position";
    MoveJ stand_oil_in,v200,fine,tool0;
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

  PROC home_hang_norm()
    TPWrite "Moving to normal position...";
    TPWrite "Axis 1      0 deg";
    TPWrite "     2    -90";
    TPWrite "     3   (-90)";
    MoveAbsJ hang_norm_pos,v200,fine,tool0;
  ENDPROC

  PROC home_hang_left()
    TPWrite "Moving to left position...";
    TPWrite "Axis 1    +90 deg";
    TPWrite "     2    -90";
    TPWrite "     3   (-90)";
    MoveAbsJ hang_left_pos,v200,fine,tool0;
  ENDPROC

  PROC home_hang_right()
    TPWrite "Moving to right position...";
    TPWrite "Axis 1    -90 deg";
    TPWrite "     2    -90";
    TPWrite "     3   (-90)";
    MoveAbsJ hang_right_pos,v200,fine,tool0;
  ENDPROC
ENDMODULE


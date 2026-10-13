%%%
  VERSION:1
  LANGUAGE:ENGLISH
%%%

MODULE CAL6400
  !COPYRIGHT 1995 ABB ROBOTICS PRODUCTS AB
  !1995-05-08 /SL
  VAR num answer;
  VAR bool flag;
  VAR string irbtype;
  VAR robtarget pos_before_norm;
  VAR robtarget stand_norm_pos46;
  VAR robtarget stand_norm_pos;
  VAR robtarget stand_left_pos;
  VAR robtarget stand_right_pos;
  VAR robtarget stand_del_pos;
  VAR robtarget stand_oil_ax4;
  VAR robtarget stand_oil_ax5a;
  VAR robtarget stand_oil_ax5b;

  PROC haupt()
    main;
  ENDPROC

  PROC main()
    TPErase;
    TPWrite "CALIBRATION POSITION PROGRAM";
    TPReadFK answer,"Select type of IRB 6400/...","2.4_120","2.4_150","2.8_120","3.0_75","More";
    TEST answer
    CASE 1:
      irbtype:="IRB6400/2.4_120";
      pos_before_norm:=[[1600,0,2000],[0.793354,0,0.608762,0],[0,0,0,0],[0,0,0,0,0,0]];
      stand_norm_pos46:=[[1600,0,2000],[0.793354,0,0.608762,0],[0,0,0,0],[0,0,0,0,0,0]];
      stand_norm_pos:=[[1688,0,2075],[0.707107,0,0.707107,0],[0,0,0,0],[0,0,0,0,0,0]];
      stand_right_pos:=[[0,-1688,2075],[0.5,0.5,0.5,-0.5],[-2,0,0,0],[0,0,0,0,0,0]];
      stand_left_pos:=[[0,1688,2075],[0.5,-0.5,0.5,0.5],[1,0,0,0],[0,0,0,0,0,0]];
      stand_del_pos:=[[1078.3,0.6,603.4],[0.75762,-0.00021,0.6527,0.00021],[0,0,-1,0],[0,0,0,0,0,0]];
      stand_oil_ax4:=[[852.2,0.3,1499.5],[0.69195,-0.0112,0.72178,-0.01049],[0,0,-1,0],[0,0,0,0,0,0]];
      stand_oil_ax5a:=[[2516.43,2.08,742.09],[0.496874,0.253821,0.81518,0.155477],[0,0,-1,0],[0,0,0,0,0,0]];
      stand_oil_ax5b:=[[2516.5,1.78,742.23],[0.349129,-0.6334,0.572182,-0.38668],[0,-2,-1,0],[0,0,0,0,0,0]];
    CASE 2:
      irbtype:="IRB6400/2.4_150";
      pos_before_norm:=[[1600,0,2000],[0.793354,0,0.608762,0],[0,0,0,0],[0,0,0,0,0,0]];
      stand_norm_pos46:=[[1600,0,2000],[0.793354,0,0.608762,0],[0,0,0,0],[0,0,0,0,0,0]];
      stand_norm_pos:=[[1688.25,0,2075],[0.707107,0,0.707107,0],[0,0,0,0],[0,0,0,0,0,0]];
      stand_right_pos:=[[0,-1688.25,2075],[0.5,0.5,0.5,-0.5],[-2,0,0,0],[0,0,0,0,0,0]];
      stand_left_pos:=[[0,1688.25,2075],[0.5,-0.5,0.5,0.5],[1,0,0,0],[0,0,0,0,0,0]];
      stand_del_pos:=[[1078.3,0.6,603.4],[0.75762,-0.00021,0.6527,0.00021],[0,0,-1,0],[0,0,0,0,0,0]];
      stand_oil_ax4:=[[852.2,0.3,1499.5],[0.69195,-0.0112,0.72178,-0.01049],[0,0,-1,0],[0,0,0,0,0,0]];
      stand_oil_ax5a:=[[2516.43,2.09,742.09],[0.496875,0.253819,0.81518,0.155478],[0,0,-1,0],[0,0,0,0,0,0]];
      stand_oil_ax5b:=[[2516.5,1.78,742.23],[0.349126,-0.633404,0.572179,-0.386681],[0,-2,-1,0],[0,0,0,0,0,0]];
    CASE 3:
      irbtype:="IRB6400/2.8_120";
      pos_before_norm:=[[2004.5,0,2000],[0.793354,0,0.608762,0],[0,0,0,0],[0,0,0,0,0,0]];
      stand_norm_pos46:=[[2004.5,0,2000],[0.793354,0,0.608762,0],[0,0,0,0],[0,0,0,0,0,0]];
      stand_norm_pos:=[[2092.5,0,2075],[0.707107,0,0.707107,0],[0,0,0,0],[0,0,0,0,0,0]];
      stand_right_pos:=[[0,-2092.5,2075],[0.5,0.5,0.5,-0.5],[-2,0,0,0],[0,0,0,0,0,0]];
      stand_left_pos:=[[0,2092.5,2075],[0.5,-0.5,0.5,0.5],[1,0,0,0],[0,0,0,0,0,0]];
      stand_del_pos:=[[1349.35,0.85,426.01],[0.709393,-0.000231,0.704814,0.000201],[0,0,-1,0],[0,0,0,0,0,0]];
      stand_oil_ax4:=[[1246.83,1.76,1557.12],[0.706286,-0.001175,0.707926,-0.000176],[0,0,-1,0],[0,0,0,0,0,0]];
      stand_oil_ax5a:=[[2361.38,1.6,582.47],[0.3351,0.557266,0.716622,0.252222],[0,0,0,0],[0,0,0,0,0,0]];
      stand_oil_ax5b:=[[2360.61,41.9,582.01],[0.317107,-0.615576,0.668082,-0.272353],[0,-1,0,0],[0,0,0,0,0,0]];
    CASE 4:
      irbtype:="IRB6400/3.0_75";
      pos_before_norm:=[[2206,0,2000],[0.793354,0,0.608762,0],[0,0,0,0],[0,0,0,0,0,0]];
      stand_norm_pos46:=[[2206,0,2000],[0.793354,0,0.608762,0],[0,0,0,0],[0,0,0,0,0,0]];
      stand_norm_pos:=[[2294,0,2075],[0.707107,0,0.707107,0],[0,0,0,0],[0,0,0,0,0,0]];
      stand_right_pos:=[[0,-2294,2075],[0.5,0.5,0.5,-0.5],[-2,0,0,0],[0,0,0,0,0,0]];
      stand_left_pos:=[[0,2294,2075],[0.5,-0.5,0.5,0.5],[1,0,0,0],[0,0,0,0,0,0]];
      stand_del_pos:=[[1506.83,6.19,268.92],[0.703372,-0.007638,0.71078,0.000776],[0,-1,-1,0],[0,0,0,0,0,0]];
      stand_oil_ax4:=[[1470.97,3.92,1614.32],[0.860928,0.00362,0.508702,0.003448],[0,0,-1,0],[0,0,0,0,0,0]];
      stand_oil_ax5a:=[[3073.71,-97.48,847.99],[0.557602,0.660715,0.446054,0.231456],[0,0,-1,0],[0,0,0,0,0,0]];
      stand_oil_ax5b:=[[3072.02,115.55,845],[0.549674,-0.672656,0.436599,-0.234039],[0,-2,-1,0],[0,0,0,0,0,0]];
    CASE 5:
      more_types;
    ENDTEST
    pos_routine;
  ENDPROC

  PROC more_types()
    TPReadFK answer,"Select type of IRB 6400/...","2.2_P75","S2.9_120","C","","Exit";
    TEST answer
    CASE 1:
      irbtype:="IRB6400/2.25_PE75";
      pos_before_norm:=[[1450,0,2000],[0.793354,0,0.608762,0],[0,0,0,0],[0,0,0,0,0,0]];
      stand_norm_pos46:=[[1450,0,2000],[0.793354,0,0.608762,0],[0,0,0,0],[0,0,0,0,0,0]];
      stand_norm_pos:=[[1538,0,2075],[0.707107,0,0.707107,0],[0,0,0,0],[0,0,0,0,0,0]];
      stand_right_pos:=[[0,-1538,2075],[0.5,0.5,0.5,-0.5],[-2,0,0,0],[0,0,0,0,0,0]];
      stand_left_pos:=[[0,1538,2075],[0.5,-0.5,0.5,0.5],[1,0,0,0],[0,0,0,0,0,0]];
      stand_del_pos:=[[1078.3,0.6,603.4],[0.75762,-0.00021,0.6527,0.00021],[0,0,-1,0],[0,0,0,0,0,0]];
      stand_oil_ax4:=[[852.2,0.3,1499.5],[0.69195,-0.0112,0.72178,-0.01049],[0,0,-1,0],[0,0,0,0,0,0]];
      stand_oil_ax5a:=[[2594.99,1.98,1163.84],[0.589304,0.289651,0.715117,0.23965],[0,0,-1,0],[0,0,0,0,0,0]];
      stand_oil_ax5b:=[[2594.99,1.63,1163.84],[0.630877,-0.098992,0.765233,-0.081325],[0,-1,-1,0],[0,0,0,0,0,0]];
    CASE 2:
      irbtype:="IRB6400/S2.9_120";
      pos_before_norm:=[[2637.56,0,-380.77],[0.50218,-2E-06,0.864764,-1.4E-05],[0,0,0,0],[0,0,0,0,0,0]];
      stand_norm_pos46:=[[2637.56,0,-380.77],[0.50218,-2E-06,0.864764,-1.4E-05],[0,0,0,0],[0,0,0,0,0,0]];
      stand_norm_pos:=[[2563.83,0,-454.845],[0.258819,0,0.965926,0],[0,0,0,0],[0,0,0,0,0,0]];
      stand_right_pos:=[[0,-2563.83,-454.845],[0.183013,0.683013,0.683013,-0.183013],[-2,0,0,0],[0,0,0,0,0,0]];
      stand_left_pos:=[[0,2563.83,-454.845],[0.183013,-0.683013,0.683013,0.183013],[1,0,0,0],[0,0,0,0,0,0]];
      stand_del_pos:=[[2637.56,0,-380.77],[0.50218,-2E-06,0.864764,-1.4E-05],[0,0,0,0],[0,0,0,0,0,0]];
      stand_oil_ax4:=[[2637.56,0,-380.77],[0.50218,-2E-06,0.864764,-1.4E-05],[0,0,0,0],[0,0,0,0,0,0]];
      stand_oil_ax5a:=[[2637.56,0,-380.77],[0.50218,-2E-06,0.864764,-1.4E-05],[0,0,0,0],[0,0,0,0,0,0]];
      stand_oil_ax5b:=[[2637.56,0,-380.77],[0.50218,-2E-06,0.864764,-1.4E-05],[0,0,0,0],[0,0,0,0,0,0]];
    CASE 3:
      irbtype:="IRB6400/C";
      pos_before_norm:=[[1597.17,-128.78,1728.14],[0.639466,0.094977,0.762358,0.029538],[0,0,0,0],[0,0,0,0,0,0]];
      stand_norm_pos46:=[[1541.31,0,1853.01],[0.632981,0,0.774167,0],[0,0,0,0],[0,0,0,0,0,0]];
      stand_norm_pos:=[[1545.3,0,1892.74],[0.707107,0,0.707107,0],[0,0,0,0],[0,0,0,0,0,0]];
      stand_right_pos:=[[1541.31,0,1853.01],[0.632981,0,0.774167,0],[0,0,0,0],[0,0,0,0,0,0]];
      stand_left_pos:=[[1541.31,0,1853.01],[0.632981,0,0.774167,0],[0,0,0,0],[0,0,0,0,0,0]];
      stand_del_pos:=[[1394.79,0,1909.16],[0.996687,0,0.08134,0],[0,0,0,0],[0,0,0,0,0,0]];
      stand_oil_ax4:=[[1541.31,0,1853.01],[0.632981,0,0.774167,0],[0,0,0,0],[0,0,0,0,0,0]];
      stand_oil_ax5a:=[[1541.31,0,1853.01],[0.632981,0,0.774167,0],[0,0,0,0],[0,0,0,0,0,0]];
      stand_oil_ax5b:=[[1541.31,0,1853.01],[0.632981,0,0.774167,0],[0,0,0,0],[0,0,0,0,0,0]];
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

  PROC calibrate()
    flag:=TRUE;
    WHILE flag DO
      TPErase;
      TPWrite "Calibration routines for ";
      TPWrite irbtype;
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

  PROC home_stand_norm()
    TPWrite "Moving to normal position (sync.pos 0)..";
    TPWrite "Axis 1      0 deg";
    TPWrite "     2      0 (shelf=+60)";
    TPWrite "     3      0 (shelf=+60)";
    MoveJ pos_before_norm,v200,fine,tool0;
    MoveJ stand_norm_pos46,v200,fine,tool0;
    MoveJ stand_norm_pos,v200,fine,tool0;
  ENDPROC

  PROC home_stand_right()
    TPWrite "Moving to right position (sync.pos 1)...";
    TPWrite "Axis 1    -90 deg";
    TPWrite "     2      0 (shelf=+60)";
    TPWrite "     3      0 (shelf=+60)";
    MoveJ stand_right_pos,v200,fine,tool0;
  ENDPROC

  PROC home_stand_left()
    TPWrite "Moving to left position (sync.pos 2)...";
    TPWrite "Axis 1    +90 deg";
    TPWrite "     2      0 (shelf=+60)";
    TPWrite "     3      0 (shelf=+60)";
    MoveJ stand_left_pos,v200,fine,tool0;
  ENDPROC

  PROC home_oil_pos()
    TPWrite "Moving to check oil plug axis 4";
    MoveJ [[703.58,0.24,1570.93],[0.75695,-0.010134,0.653293,-0.011488],[0,0,-1,0],[0,0,0,0,0,0]],v200,fine,tool0;
    TPReadFK answer,"Next, axis 5 pos 1","Next","","","","";
    MoveJ [[2317.8,-29.49,831.06],[0.489767,0.451668,0.717554,0.203079],[0,0,-1,0],[0,0,0,0,0,0]],v200,fine,tool0;
    TPReadFK answer,"Next, axis 5 pos 2","Next","","","","";
    MoveJ [[2309.4,35.11,712.56],[0.388013,-0.646364,0.594175,-0.280384],[0,-1,-1,0],[0,0,0,0,0,0]],v200,fine,tool0;
  ENDPROC

  PROC home_del_pos()
    TPWrite "Moving to delivery position";
    MoveJ stand_del_pos,v200,fine,tool0;
  ENDPROC
ENDMODULE


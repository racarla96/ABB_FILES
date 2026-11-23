%%%
  VERSION:1
  LANGUAGE:ENGLISH
%%%

MODULE VIB1400
  !Copyright 1994 ABB Robotics Products AB
  !94-12-08
  !Definition of global variables
  VAR num answer;
  VAR bool flag;
  !Definition of speeddata
  CONST speeddata v104:=[104,90,1000,90];
  CONST speeddata v130:=[130,90,1000,90];
  CONST speeddata v156:=[156,90,1000,90];
  CONST speeddata v80hand:=[80,12,1000,90];
  CONST speeddata v100s3:=[100,90,1000,90];
  CONST speeddata v100s3hand:=[100,15,1000,90];
  CONST speeddata v120:=[120,90,1000,90];
  CONST speeddata v120hand:=[120,18,1000,90];
  CONST speeddata v250:=[250,90,1000,90];
  CONST speeddata v125:=[125,90,1000,90];
  CONST speeddata v1250:=[1250,90,1000,90];
  CONST speeddata v1875:=[1875,90,1000,90];
  !Definition of zonedata
  CONST zonedata path:=[FALSE,25,25,25,25,25,25];
  CONST zonedata corner1:=[FALSE,15,15,15,15,15,15];
  CONST zonedata corner2:=[FALSE,100,100,100,100,100,100];
  CONST zonedata fines3:=[TRUE,0,0,0,0,0,0];
  !Definition of tooldata
  PERS tooldata testload:=[TRUE,[[0,0,0],[1,0,0,0]],[5,[67,0,75],[1,0,0,0],0,0,0]];
  PERS tooldata currload:=[TRUE,[[0,0,0],[1,0,0,0]],[0,[0,0,0],[1,0,0,0],0,0,0]];
  !Definition of robtargets
  VAR string irbtype;
  VAR robtarget ax1_p1;
  VAR robtarget ax1_p2;
  VAR robtarget ax2_p1;
  VAR robtarget ax2_p2;
  VAR robtarget ax3_p1;
  VAR robtarget ax3_p2;
  VAR robtarget ax4_p1;
  VAR robtarget ax4_p2;
  VAR robtarget ax5_p1;
  VAR robtarget ax5_p2;
  VAR robtarget ax6_p1;
  VAR robtarget ax6_p2;
  VAR robtarget ax1_lash1;
  VAR robtarget ax5_lash1;
  VAR robtarget ax5_lash2;
  VAR robtarget ax5_lash3;
  VAR robtarget ax6_lash1;
  VAR robtarget ax6_lash2;
  VAR robtarget ax6_lash3;
  VAR robtarget ax6_lash4;
  VAR robtarget ax6_lash5;

  PROC haupt()
    main;
  ENDPROC

  PROC main()
    TPErase;
    TPWrite "Vibration and back lash test program";
    TPReadFK answer,"Select type of IRB","1400","1400H","","","EXIT";
    TEST answer
    CASE 1:
      irbtype:="IRB1400";
      currload:=testload;
      ax1_p1:=[[-1196.2,-777.4,950.3],[0.19972,0.67074,0.20365,-0.68465],[-2,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax1_p2:=[[-1231.7,719.8,950.3],[0.18935,-0.67783,0.17874,0.68757],[1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax2_p1:=[[1508.8,-0.3,814.2],[0.715,-0.00515,0.69909,-0.00434],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax2_p2:=[[422,0,845.1],[0.71497,-0.00515,0.69912,-0.00434],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax3_p1:=[[503.6,0,1830.2],[0.97165,-0.00232,0.23635,-0.00647],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax3_p2:=[[532.5,0,326.9],[0.1555,-0.00657,0.98781,-0.00028],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax4_p1:=[[1229.3,2.9,1114.4],[0.18641,-0.65967,0.20382,-0.69896],[0,-2,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax4_p2:=[[1229.3,10.3,1114.4],[0.16691,0.66315,0.19192,0.70395],[0,1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax5_p1:=[[1120.5,6.2,1028.9],[0.14257,0.00345,-0.98978,-0.00064],[0,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax5_p2:=[[1130.4,5.9,1194.2],[0.9965,0.00121,-0.08356,0.00188],[0,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax6_p1:=[[1229.2,6.6,1103.4],[0.5851,0.36685,0.63795,0.34073],[0,0,-4,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax6_p2:=[[1229.2,6.5,1103.3],[0.58579,-0.37235,0.6348,-0.33945],[0,-1,3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax1_lash1:=[[955.4,0.6,1195.7],[0.70761,-4E-05,0.7066,0.00038],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax5_lash1:=[[870.6,-84.5,1195.2],[0.00118,0.00015,0.70893,-0.70527],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax5_lash2:=[[955.5,-0.3,1195.7],[0.49957,-0.49633,0.50322,-0.50086],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax5_lash3:=[[870.6,85.4,1196.1],[0.70898,-0.70523,0.00014,-0.00073],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax6_lash1:=[[954.9,0.2,1198.7],[0.55309,0.44472,0.52949,0.46472],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax6_lash2:=[[954.9,0.1,1198.8],[0.12546,0.68081,0.12006,0.71157],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax6_lash3:=[[955,0,1198.8],[0.72261,0.00037,0.69125,0.00012],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax6_lash4:=[[955,0,1198.9],[0.55367,-0.44417,0.52961,-0.46441],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax6_lash5:=[[955,-0.1,1198.9],[0.12548,-0.68074,0.12012,-0.71163],[-1,0,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CASE 2:
      irbtype:="IRB1400H";
      currload:=testload;
       ax1_p1:=[[-763.32,-251.2,1004.98],[0.106427,0.717566,0.117322,-0.678239],[-2,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
       ax1_p2:=[[-785.8,168.09,1004.98],[0.074469,-0.723291,0.074225,0.682493],[1,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
       ax2_p1:=[[241.42,-0.25,753.51],[0.686516,-0.002047,0.727107,-0.002759],[-1,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
       ax2_p2:=[[803.61,-0.78,1004.99],[0.686517,-0.001996,0.727107,-0.002687],[-1,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
       ax3_p1:=[[547.48,-0.59,507.96],[0.410434,-0.002724,0.911885,-0.001794],[-1,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
       ax3_p2:=[[207.81,-0.21,1655.92],[0.949138,-0.000915,0.314834,-0.003989],[-1,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
       ax4_p1:=[[654.51,1.77,1047.29],[0.222285,0.655135,0.231864,0.683833],[-1,1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
       ax4_p2:=[[654.51,-2.69,1047.32],[0.205338,-0.66038,0.215397,-0.689449],[-1,-2,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
       ax5_p1:=[[555.88,-0.01,960.79],[0.082285,0.001656,-0.996607,-0.001412],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
       ax5_p2:=[[560.42,-0.44,1129.11],[0.998467,0.001376,-0.0553,-0.002002],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
       ax6_p1:=[[654.8,-0.15,1041.06],[0.00627,-0.722412,0.006656,-0.691403],[-1,0,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
       ax6_p2:=[[654.82,-0.14,1041.07],[0.075003,0.718198,0.07827,0.687343],[-1,0,-3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
       ax1_lash1:=[[808.96,-0.48,969.06],[0.670541,-0.001727,0.741868,-0.002113],[-1,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
       ax5_lash1:=[[570.6,-84.5,1045.2],[0.00118,0.00015,0.70893,-0.70527],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
       ax5_lash2:=[[655.5,-0.3,1045.7],[0.49957,-0.49633,0.50322,-0.50086],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
       ax5_lash3:=[[570.6,85.4,1046.1],[0.70898,-0.70523,0.00014,-0.00073],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
       ax6_lash1:=[[654.9,0.2,1048.7],[0.55309,0.44472,0.52949,0.46472],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
       ax6_lash2:=[[654.9,0.1,1048.8],[0.12546,0.68081,0.12006,0.71157],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
       ax6_lash3:=[[655,0,1048.8],[0.72261,0.00037,0.69125,0.00012],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
       ax6_lash4:=[[655,0,1048.9],[0.55367,-0.44417,0.52961,-0.46441],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
       ax6_lash5:=[[655,-0.1,1048.9],[0.12548,-0.68074,0.12012,-0.71163],[-1,0,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      CASE 5:
      TPWrite "Exit program";
      EXIT;
    ENDTEST
    flag:=TRUE;
    WHILE flag DO
      TPErase;
      TPWrite "Test routines for ";
      TPWrite irbtype;
      TPReadFK answer,"Select operation...","Vib","Lash","","","Exit";
      TEST answer
      CASE 1:
        vibrate;
      CASE 2:
        lash;
      CASE 5:
        flag:=FALSE;
      ENDTEST
    ENDWHILE
  ENDPROC

  PROC vibrate()
    TPErase;
    TPWrite "Vibration test";
    TPReadNum answer,"Select robot axis 1 to 6...";
    TEST answer
    CASE 1:
      TPWrite "Test vibrations on axis 1";
    MoveJ ax1_p1,v400,fines3,currload;
    MoveJ ax1_p2,v104,fines3,currload;
    MoveJ ax1_p1,v130,fines3,currload;
    MoveJ ax1_p2,v156,fines3,currload;
    CASE 2:
      TPWrite "Test vibrations on axis 2";
    MoveJ ax2_p1,v400,fines3,currload;
    MoveJ ax2_p2,v80,fines3,currload;
    MoveJ ax2_p1,v80,fines3,currload;
    MoveJ ax2_p2,v100s3,fines3,currload;
    MoveJ ax2_p1,v120,fines3,currload;
     CASE 3:
      TPWrite "Test vibrations on axis 3";
    MoveJ ax3_p1,v400,fines3,currload;
    MoveJ ax3_p2,v400,fines3,currload;
    MoveJ ax3_p1,v80,fines3,currload;
    MoveJ ax3_p2,v400,fines3,currload;
    MoveJ ax3_p1,v100s3,fines3,currload;
    MoveJ ax3_p2,v400,fines3,currload;
    MoveJ ax3_p1,v120,fines3,currload;
    CASE 4:
      TPWrite "Test vibrations on axis 4";
    MoveJ ax4_p1,v120hand,fines3,currload;
    MoveJ ax4_p2,v80hand,fines3,currload;
    MoveJ ax4_p1,v100s3hand,fines3,currload;
    MoveJ ax4_p2,v120hand,fines3,currload;
    CASE 5:
      TPWrite "Test vibrations on axis 5";
    MoveJ ax5_p1,v120hand,fines3,currload;
    MoveJ ax5_p2,v80hand,fines3,currload;
    MoveJ ax5_p1,v100s3hand,fines3,currload;
    MoveJ ax5_p2,v120hand,fines3,currload;
     CASE 6:
      TPWrite "Test vibrations on axis 6";
    MoveJ ax6_p1,v120hand,fines3,currload;
    MoveJ ax6_p2,v80hand,fines3,currload;
    MoveJ ax6_p1,v100s3hand,fines3,currload;
    MoveJ ax6_p2,v120hand,fines3,currload;
     DEFAULT:
      RETURN;
    ENDTEST
  ENDPROC

  PROC lash()
    TPErase;
    TPReadFK answer,"Test lash on axis 1, 5 or 6...","Ax1","Ax5","Ax6","","Exit";
    TEST answer
    CASE 1:
    TPReadFK answer,"Test lash on axis 1..","TEST","","","","";
    MoveJ ax1_lash1,v250,fines3,tool0;
    CASE 2:
    TPReadFK answer,"Test lash on +90 deg. axis 5...","TEST","","","","";
    MoveJ ax5_lash1,v250,fines3,tool0;
    TPReadFK answer,"Test lash on 0 deg. axis 5...","TEST","","","","";
    MoveJ ax5_lash2,v250,fines3,tool0;
    TPReadFK answer,"Test lash on -90 deg. axis 5...","TEST","","","","";
    MoveJ ax5_lash3,v250,fines3,tool0;
    CASE 3:
    TPReadFK answer,"Test lash on +80 deg. axis 6...","TEST","","","","";
    MoveJ ax6_lash1,v250,fines3,tool0;
    TPReadFK answer,"Test lash on +160 deg. axis 6...","TEST","","","","";
    MoveJ ax6_lash2,v250,fines3,tool0;
    TPReadFK answer,"Test lash on 0 deg. axis 6...","TEST","","","","";
    MoveJ ax6_lash3,v250,fines3,tool0;
    TPReadFK answer,"Test lash on -80 deg. axis 6...","TEST","","","","";
    MoveJ ax6_lash4,v250,fines3,tool0;
    TPReadFK answer,"Test lash on -160 deg. axis 6...","TEST","","","","";
    MoveJ ax6_lash5,v250,fines3,tool0;
    CASE 5:
      RETURN;
    ENDTEST
  ENDPROC
ENDMODULE

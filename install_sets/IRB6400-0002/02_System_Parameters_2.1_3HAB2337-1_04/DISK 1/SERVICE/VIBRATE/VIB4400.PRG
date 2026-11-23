%%%
  VERSION:1
  LANGUAGE:ENGLISH
%%%

MODULE VIB4400
  !COPYRIGHT 1995 ABB ROBOTICS PRODUCTS AB
  !1995-10-04      SLT    SEROP/PU
!#######################################################
! Revision Notes:
! RW1.0 or better
! Testload added   95-11-01/SLT
!
!#######################################################
  !Definitions
  VAR bool flag;
  VAR num answer;
  PERS tooldata loadtool1:=[TRUE,[[0,0,0],[1,0,0,0]],[46,[129,0,176],[1,0,0,0],0,0,0]];
  PERS tooldata loadtool2:=[TRUE,[[0,0,0],[1,0,0,0]],[62,[129,0,176],[1,0,0,0],0,0,0]];
  PERS tooldata currload:=[TRUE,[[0,0,0],[1,0,0,0]],[0,[0,0,0],[1,0,0,0],0,0,0]];
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
  CONST zonedata fines3:=[TRUE,0,0,0,0,0,0];
  VAR robtarget axis_pos46;
  VAR robtarget lash5_1;
  VAR robtarget lash5_2;
  VAR robtarget lash5_3;
  VAR robtarget axis1_p1;
  VAR robtarget axis1_p2;
  VAR robtarget axis2_p1;
  VAR robtarget axis2_p2;
  VAR robtarget axis3_p1;
  VAR robtarget axis3_p2;
  VAR robtarget axis4_p1;
  VAR robtarget axis4_p2;
  VAR robtarget axis5_p1;
  VAR robtarget axis5_p2;
  VAR robtarget axis6_p1;
  VAR robtarget axis6_p2;
  VAR robtarget ax1_lash1;
  VAR robtarget ax5_lash1;
  VAR robtarget ax5_lash2;
  VAR robtarget ax5_lash3;
  VAR robtarget ax5_lash4;
  VAR robtarget ax5_lash5;
  VAR robtarget ax6_lash1;
  VAR robtarget ax6_lash2;
  VAR robtarget ax6_lash3;
  VAR robtarget ax6_lash4;
  VAR robtarget ax6_lash5;
  VAR robtarget ax6_lash6;
  VAR string irbtype;

  PROC haupt()
    main;
  ENDPROC

  PROC main()
    VAR num answer;

    TPErase;
    TPWrite "Vibration and Backlash testprogram";
    TPReadFK answer,"Select type of IRB/...","4400","","","","EXIT";
    TEST answer
    CASE 1:
      irbtype:="IRB4400";
      axis1_p1:=[[-1151.48,374.44,1734.91],[0.108634,-0.685724,0.112391,0.71088],[1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis1_p2:=[[-1151.95,-372.93,1734.92],[0.116064,0.686928,0.104723,-0.709714],[-2,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis2_p1:=[[416.97,-0.83,1232.67],[0.719193,0.004284,0.69479,0.003173],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis2_p2:=[[1962.22,-4.07,1333.28],[0.719174,0.004289,0.69481,0.003173],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis3_p1:=[[1023.07,-2.17,2185.43],[0.86341,0.003028,0.504481,0.003651],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis3_p2:=[[783.32,-1.63,722.53],[0.237855,0.006077,0.971281,0.001153],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis4_p1:=[[1827.65,39.68,1451.81],[0.699574,-0.11734,0.106086,0.696832],[-1,-3,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis4_p2:=[[1827.46,-47.06,1452],[0.698419,0.104125,-0.115929,0.698519],[-1,2,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis5_p1:=[[1772.56,-5.55,1416.33],[0.973834,0.005605,-0.227191,5.9E-05],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis5_p2:=[[1770.76,-2.19,1166.17],[0.234161,-0.002349,-0.972176,-0.006135],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis6_p1:=[[1974.48,-4.37,1288.54],[0.667228,0.221189,0.677613,0.216159],[-1,0,4,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis6_p2:=[[1974.49,-4.33,1288.52],[0.671148,-0.205465,0.682548,-0.203649],[-1,0,-5,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax5_lash2:=[[1243.18,1414.19,1340.89],[0.091852,0.092388,-0.70116,-0.701002],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax5_lash1:=[[1144.05,1315.36,1340.83],[0.430071,0.430482,-0.56136,-0.560892],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
ax5_lash3:=[[1378.36,1377.92,1341.02],[0.270818,0.27032,0.653182,0.653405],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
ax5_lash4:=[[1414.63,1242.54,1341.07],[0.561357,0.560938,0.429978,0.43052],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax5_lash5:=[[1315.91,1143.54,1340.95],[0.701051,0.701026,0.092238,0.092644],[0,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax6_lash1:=[[1377.67,1378.64,1339.9],[0.652469,-0.271153,0.653999,0.270272],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax6_lash2:=[[1377.62,1378.68,1339.87],[0.700212,-0.561642,0.431082,-0.091816],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax6_lash3:=[[1377.58,1378.71,1339.84],[0.560427,-0.701979,0.092425,-0.429657],[0,-1,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax6_lash4:=[[1377.54,1378.74,1339.83],[0.270178,-0.654013,-0.271304,-0.652431],[0,-1,-3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax6_lash5:=[[1377.29,1378.66,1341.26],[0.09188,0.430761,0.561371,0.700618],[0,-1,-3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax6_lash6:=[[1377.33,1378.63,1341.26],[0.429909,0.092356,0.701525,0.560814],[0,-1,-4,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CASE 5:
      TPWrite "Exit program";
      EXIT;
    ENDTEST
    TPErase;
    TPWrite irbtype;
    TPReadFK answer,"TEST LOAD?","45kg","60kg","No","","";
    TEST answer
    CASE 1:
      currload:=loadtool1;
    CASE 2:
      currload:=loadtool2;
    CASE 3:
      currload:=tool0;
    ENDTEST
    flag:=TRUE;
    WHILE flag DO
      TPErase;
      TPReadFK answer,"Select operation...","Vib","Lash","Tstload","","Exit";
      TEST answer
      CASE 1:
        vibrate;
      CASE 2:
        lash;
      CASE3:
        testload;	
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
      MoveJ axis1_p1,v400,fines3,currload;
      MoveJ axis1_p2,v104,fines3,currload;
      MoveJ axis1_p1,v130,fines3,currload;
      MoveJ axis1_p2,v156,fines3,currload;
    CASE 2:
      TPWrite "Test vibrations on axis 2";
      MoveJ axis2_p1,v400,fines3,currload;
      MoveJ axis2_p2,v80,fines3,currload;
      MoveJ axis2_p1,v80,fines3,currload;
      MoveJ axis2_p2,v100s3,fines3,currload;
      MoveJ axis2_p1,v120,fines3,currload;
    CASE 3:
      TPWrite "Test vibrations on axis 3";
      MoveJ axis3_p1,v400,fines3,currload;
      MoveJ axis3_p2,v400,fines3,currload;
      MoveJ axis3_p1,v80,fines3,currload;
      MoveJ axis3_p2,v400,fines3,currload;
      MoveJ axis3_p1,v100s3,fines3,currload;
      MoveJ axis3_p2,v400,fines3,currload;
      MoveJ axis3_p1,v120,fines3,currload;
    CASE 4:
      TPWrite "Test vibrations on axis 4";
      MoveJ axis4_p1,v120hand,fines3,currload;
      MoveJ axis4_p2,v80hand,fines3,currload;
      MoveJ axis4_p1,v100s3hand,fines3,currload;
      MoveJ axis4_p2,v120hand,fines3,currload;
    CASE 5:
      TPWrite "Test vibrations on axis 5";
      MoveJ axis5_p1,v120hand,fines3,currload;
      MoveJ axis5_p2,v80hand,fines3,currload;
      MoveJ axis5_p1,v100s3hand,fines3,currload;
      MoveJ axis5_p2,v120hand,fines3,currload;
    CASE 6:
      TPWrite "Test vibrations on axis 6";
      MoveJ axis6_p1,v120hand,fines3,currload;
      MoveJ axis6_p2,v80hand,fines3,currload;
      MoveJ axis6_p1,v100s3hand,fines3,currload;
      MoveJ axis6_p2,v120hand,fines3,currload;
    DEFAULT:
      RETURN;
    ENDTEST
  ENDPROC

  PROC lash()
    TPErase;
    TPReadFK answer,"Test lash on axis  5 or 6...","","Ax5","Ax6","","Exit";
    TEST answer
    CASE 2:
      TPReadFK answer,"Test lash on pos 1 axis 5...","TEST","","","","";
      MoveJ ax5_lash1,v250,fines3,tool0;
      TPReadFK answer,"Test lash on pos 2 axis 5...","TEST","","","","";
      MoveJ ax5_lash2,v250,fines3,tool0;
      TPReadFK answer,"Test lash on pos 3 axis 5...","TEST","","","","";
      MoveJ ax5_lash3,v250,fines3,tool0;
      TPReadFK answer,"Test lash on pos 4 axis 5...","TEST","","","","";
      MoveJ ax5_lash4,v250,fines3,tool0;
      TPReadFK answer,"Test lash on pos 5 axis 5...","TEST","","","","";
      MoveJ ax5_lash5,v250,fines3,tool0;
    CASE 3:
      TPReadFK answer,"Test lash on pos1 axis 6...","TEST","","","","";
      MoveJ ax6_lash1,v250,fines3,tool0;
      TPReadFK answer,"Test lash on pos2 axis 6...","TEST","","","","";
      MoveJ ax6_lash2,v250,fines3,tool0;
      TPReadFK answer,"Test lash on pos3 axis 6...","TEST","","","","";
      MoveJ ax6_lash3,v250,fines3,tool0;
      TPReadFK answer,"Test lash on pos4 axis 6...","TEST","","","","";
      MoveJ ax6_lash4,v250,fines3,tool0;
      TPReadFK answer,"Test lash on pos5 axis 6...","TEST","","","","";
      MoveJ ax6_lash5,v250,fines3,tool0;
      TPReadFK answer,"Test lash on pos6 axis 6...","TEST","","","","";
      MoveJ ax6_lash6,v250,fines3,tool0;
    CASE 5:
      RETURN;
    ENDTEST
  ENDPROC

  PROC testload()
    TPErase;
    TP_Read_FK answer,"Move to testload mounting pos.","Yes","","","","Exit";
    TEST answer
   CASE 1:
      TP_Read_FK answer,"Move to testload...","Start","","","","";
    MoveJ [[1219.65,-0.25,1720.79],[0.70753,0.000105,0.706684,-3.9E-05],[-1,0,-         1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],v300,fine,tool0;
    MoveJ [[1571.49,-0.07,686.9],[0.707152,-0.000107,0.707062,-9.9E-05],[-1,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],v300,fine,tool0;
    CASE 5:
      RETURN;
    ENDTEST
  ENDPROC
ENDMODULE


%%%
  VERSION:1
  LANGUAGE:ENGLISH
%%%

MODULE VIB2400
  !COPYRIGHT 1994 ABB ROBOTICS PRODUCTS AB
  !1994-12-08
  !Definition of robtargets
  CONST robtarget p1:=[[-1186.5,-37.6,1557.1],[0.01609,0.64902,0.00677,-0.76063],[-2,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p2:=[[-1187.1,20.6,1556],[0.00216,0.64997,-0.01338,-0.75985],[1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p3:=[[-1186.6,-37.5,1556.9],[0.01627,0.64906,0.0066,-0.76059],[-2,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p4:=[[-1187.3,20.8,1555.8],[0.00224,0.65001,-0.01356,-0.75981],[1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p5:=[[-1538.6,124.4,1181.8],[0.01648,-0.87875,0.03953,0.47539],[1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p6:=[[-449.1,36.3,1337.8],[0.01657,-0.87883,0.03936,0.4753],[1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p7:=[[-1538.6,124.4,1181.8],[0.01648,-0.87875,0.03953,0.47539],[1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p8:=[[-449.1,36.3,1337.8],[0.01657,-0.87883,0.03936,0.4753],[1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p9:=[[-1538.6,124.4,1181.8],[0.01648,-0.87875,0.03953,0.47539],[1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p10:=[[-802,27.4,500.3],[0.00199,0.9948,-0.02382,0.09918],[1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p11:=[[-1288.6,43.9,1609],[0.00531,-0.82307,0.01894,0.56767],[1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p12:=[[-802,27.4,500.3],[0.00199,0.9948,-0.02391,0.09918],[1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p13:=[[-1327.9,45.9,1328.9],[0.00358,-0.89924,0.02162,0.43694],[1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p14:=[[-1425.9,119.8,1431],[0.87491,-0.03275,-0.47992,-0.05667],[1,1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p15:=[[-1426.8,106.8,1430.8],[0.87253,0.04873,-0.48117,-0.06928],[1,-2,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p16:=[[-1425.9,119.8,1431],[0.87488,-0.0328,-0.47991,-0.05663],[1,2,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p17:=[[-1426.8,106.8,1430.8],[0.87253,0.0487,-0.48117,-0.06925],[1,-3,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p18:=[[-1336.3,108.5,1277.4],[0.00091,-0.99855,0.04467,-0.03043],[1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p19:=[[-1312.3,105.5,1472],[0.0328,0.15459,-0.01114,0.98738],[1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p20:=[[-1336.3,108.5,1277.4],[0.00091,-0.99855,0.04467,-0.03043],[1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p21:=[[-1350.8,108.9,1476.9],[0.03608,-0.04216,-8E-05,0.99847],[1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p22:=[[-1424.6,115.3,1320],[0.46404,-0.02905,-0.88509,-0.02343],[1,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p23:=[[-1424.6,115.3,1320],[0.4643,-0.03906,-0.88466,-0.01817],[1,0,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p24:=[[-1424.6,115.3,1320],[0.46404,-0.02905,-0.88509,-0.02343],[1,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p25:=[[-1424.6,115.3,1320],[0.4643,-0.03906,-0.88466,-0.01817],[1,0,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p26:=[[-1384.1,444.1,1137.4],[0.00121,0.98791,-0.15487,0.00696],[1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p27:=[[-1480.6,475.1,1236],[0.1084,-0.70337,0.11027,0.6938],[1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p28:=[[-1386.8,445,1337.3],[0.15455,-0.00688,0.00115,0.98796],[1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p29:=[[-1480.5,475.1,1240.5],[0.11102,-0.68765,0.10767,0.70938],[1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p30:=[[-1480.5,475.2,1240.4],[0.71784,-0.22562,-0.65848,0.01399],[1,0,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p31:=[[-1480.5,475.3,1240.4],[0.67921,0.01341,-0.69599,-0.23258],[1,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p32:=[[-2.9,479.2,152.1],[0.08935,0.99592,0.01253,0.00136],[1,0,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p33:=[[-1486,492.1,1221.8],[0.68881,-0.15451,-0.70469,-0.07199],[1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p34:=[[-1388.5,457.5,936.1],[0.00484,-0.9882,0.14846,-0.03802],[1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p35:=[[-1482.5,486,994.1],[0.0918,-0.83274,0.12236,0.53219],[1,1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p36:=[[-929.5,287.3,-52.4],[0.81198,-0.0303,-0.57867,-0.07035],[1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
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
  CONST zonedata path:=[FALSE,25,25,25,25,25,25];
  CONST zonedata corner1:=[FALSE,15,15,15,15,15,15];
  CONST zonedata corner2:=[FALSE,100,100,100,100,100,100];
  CONST zonedata fines3:=[TRUE,0,0,0,0,0,0];
  VAR num answer;

  PROC haupt()
    main;
  ENDPROC

  PROC main()
    TPErase;
    TPWrite "VIBRATION AND LASH PROGRAM";
    TPReadFK answer,"Start or exit program","VIBR","LASH","","","EXIT";
    TEST answer
    CASE 1:
      program8;
    CASE 2:
      program9;
    CASE 5:
      TPWrite "Exit program";
      EXIT;
    ENDTEST
  ENDPROC

  PROC program1()
    MoveJ p1,v400,fines3,TOOL0;
    MoveJ p2,v104,fines3,TOOL0;
    MoveJ p3,v130,fines3,TOOL0;
    MoveJ p4,v156,fines3,TOOL0;
    RETURN;
  ENDPROC

  PROC program2()
    MoveJ p5,v400,fines3,TOOL0;
    MoveJ p6,v80,fines3,TOOL0;
    MoveJ p7,v80,fines3,TOOL0;
    MoveJ p8,v100s3,fines3,TOOL0;
    MoveJ p9,v120,fines3,TOOL0;
    RETURN;
  ENDPROC

  PROC program3()
    MoveJ p10,v400,fines3,TOOL0;
    MoveJ p11,v80,fines3,TOOL0;
    MoveJ p12,v100s3,fines3,TOOL0;
    MoveJ p13,v120,fines3,TOOL0;
    RETURN;
  ENDPROC

  PROC program4()
    MoveJ p14,v400,fines3,TOOL0;
    MoveJ p15,v80hand,fines3,TOOL0;
    MoveJ p16,v100s3hand,fines3,TOOL0;
    MoveJ p17,v120hand,fines3,TOOL0;
    RETURN;
  ENDPROC

  PROC program5()
    MoveJ p18,v400,fines3,TOOL0;
    MoveJ p19,v80hand,fines3,TOOL0;
    MoveJ p20,v100s3hand,fines3,TOOL0;
    MoveJ p21,v120hand,fines3,TOOL0;
    RETURN;
  ENDPROC

  PROC program6()
    MoveJ p22,v400,fines3,TOOL0;
    MoveJ p23,v80hand,fines3,TOOL0;
    MoveJ p24,v100s3hand,fines3,TOOL0;
    MoveJ p25,v120hand,fines3,TOOL0;
    RETURN;
  ENDPROC

  PROC program8()
    VAR num answer;

    TPErase;
    TPWrite "Vibration test";
    TPReadNum answer,"Select robot axis 1 to 6...";
    TEST answer
    CASE 1:
      TPWrite "Test vibrations on axis 1";
      program1;
    CASE 2:
      TPWrite "Test vibrations on axis 2";
      program2;
    CASE 3:
      TPWrite "Test vibrations on axis 3";
      program3;
    CASE 4:
      TPWrite "Test vibrations on axis 4";
      program4;
    CASE 5:
      TPWrite "Test vibrations on axis 5";
      program5;
    CASE 6:
      TPWrite "Test vibrations on axis 6";
      program6;
    DEFAULT:
      RETURN;
    ENDTEST
  ENDPROC

  PROC program9()
    TPErase;
    TPReadFK answer,"Test lash on axis 5, 6 or elbow joint..","Ax5","Ax6","Elbow","","Exit";
    TEST answer
    CASE 1:
      program10;
    CASE 2:
      program11;
    CASE 3:
      program12;
    CASE 5:
      RETURN;
    ENDTEST
  ENDPROC

  PROC program10()
  TPReadFK answer,"Test lash 1 axis 5...","TEST","","","","";
    MoveJ p26,v250,fines3,TOOL0;
    TPReadFK answer,"Test lash 2 axis 5...","TEST","","","","";
    MoveJ p27,v250,fines3,TOOL0;
    TPReadFK answer,"Test lash 3 axis 5...","TEST","","","","";
    MoveJ p28,v250,fines3,TOOL0;
    RETURN;
  ENDPROC

  PROC program11()
  TPReadFK answer,"Test lash 1 axis 6...","TEST","","","","";
    MoveJ p29,v250,fines3,TOOL0;
    TPReadFK answer,"Test lash 2 axis 6...","TEST","","","","";
    MoveJ p30,v250,fines3,TOOL0;
    TPReadFK answer,"Test lash 3 axis 6...","TEST","","","","";
    MoveJ p31,v250,fines3,TOOL0;
    RETURN;
  ENDPROC

  PROC program12()
  TPReadFK answer,"Test lash elbow joint..","TEST","","","","";
    MoveJ p32,v250,fines3,TOOL0;
    RETURN;
  ENDPROC
ENDMODULE


%%%
  VERSION:1
  LANGUAGE:ENGLISH
%%%

MODULE MOVE2400
  ! Copyright 1994 ABB Robotics Products AB
  ! 95-01-10 
  ! Definition of robtargets
  CONST robtarget p1:=[[852.63,0,1485],[0.01286,0,0.99998,8E-05],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p2:=[[950,0,1585],[0.70711,0,0.70711,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p3:=[[950.13,0,1112],[0.70706,0,0.70715,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p4:=[[949.9,-1208.8,1111.9],[0.70723,0.0004,0.70698,0.00015],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p5:=[[950.13,-9.75,1111.88],[0.70694,-0.00013,0.70728,-4E-05],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p6:=[[1324.63,-907.88,539.63],[0.70694,-0.00013,0.70728,-4E-05],[-1,-2,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p7:=[[950.13,-9.75,1111.88],[0.70694,-0.00013,0.70728,-4E-05],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p8:=[[950.1,1162.3,1111.8],[0.70698,-9E-05,0.70723,0.00033],[0,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p9:=[[950.1,1162.2,295.7],[0.70693,-5E-05,0.70728,0.00029],[0,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p10:=[[950.13,175.63,281.88],[0.70698,-0.00017,0.70723,0],[0,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p11:=[[950.1,175.5,1948.2],[0.7069,0.00065,0.70732,0.00016],[0,1,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p12:=[[-818.88,-16.63,1224.5],[0.00125,-0.67262,-0.02845,0.73943],[-2,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p13:=[[-1330.5,-559.4,449.1],[0.03136,0.65477,0.06045,-0.75276],[-2,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p14:=[[-1242.75,9.13,209.88],[0.0208,-0.7728,-0.00371,-0.63435],[1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p15:=[[-567.75,4,686.25],[0.12002,0.69096,-0.70189,-0.1249],[1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p16:=[[-513,3.63,2270.75],[0.64651,0.28191,-0.29097,-0.64651],[1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p17:=[[76.63,1155.25,226],[0.44043,0.58799,-0.54928,0.39826],[0,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p18:=[[-15,1422.75,1113.63],[0.02271,-0.01528,-0.33802,0.94077],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p19:=[[11.5,-1585.63,362.5],[0.02111,0.04376,-0.8784,0.47544],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p20:=[[1365.38,78.13,1448],[0.69506,-0.0076,0.71829,0.03133],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p21:=[[1396.9,-34.3,1401.2],[0.00904,0.72795,-0.00825,0.68552],[-1,-2,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p22:=[[1396.9,-34,1401.2],[0.65096,-0.21385,0.69581,-0.21534],[-1,2,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p23:=[[1397,-34.5,1408.1],[0.24855,0.66529,0.22937,0.66559],[-1,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p24:=[[1396.8,-34.3,1401.1],[0.09718,-0.71813,0.11889,-0.67876],[-1,2,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p25:=[[1216.88,69.88,1536.5],[0.95795,0.04795,-0.2517,-0.12944],[0,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p26:=[[745.25,-26,1430.13],[0.0016,-0.60663,0.03155,0.79437],[1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p27:=[[744.63,39,1430.13],[0.03311,0.60741,-0.00513,-0.79368],[-2,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p28:=[[-22.7,1026.4,911.1],[0.14018,0.66197,-0.72043,0.15207],[1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p29:=[[-0.8,483,421.7],[0.26551,0.61779,-0.70012,0.24015],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p30:=[[-461.4,33.6,376.5],[0.01147,0.0088,-0.99989,0.00448],[1,-1,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p31:=[[-462.2,-8.5,376.6],[0.01084,0.02472,-0.99962,0.00529],[-2,-1,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p32:=[[-8,-508.5,405.3],[0.05809,0.82288,-0.56398,0.0377],[-2,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p33:=[[-3.6,118.8,1194.6],[0.01899,-0.77169,0.63571,-0.00128],[1,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p34:=[[-79.4,-1581.1,1069.4],[0.37463,0.58673,0.58377,-0.41787],[-2,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p35:=[[-2.6,45.4,2359],[0.70444,0.20891,0.23081,-0.63784],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p36:=[[121.25,-21.13,2376.63],[0.63046,0.08325,0.04091,0.77068],[1,1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p37:=[[-1123.9,262.6,1061],[0.01673,-0.97957,0.11121,-0.1667],[1,1,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p38:=[[-966.38,1074.63,1003],[0.26284,-0.73343,0.29486,0.55329],[1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p39:=[[868.13,471.38,2000.75],[0.87232,-0.12973,0.42968,0.19421],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p40:=[[-250.5,-1374.5,804.25],[0.33072,0.63097,0.56602,-0.41492],[-2,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p41:=[[-978.75,-925.88,715.88],[0.16983,0.80068,0.35205,-0.45411],[-2,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p42:=[[-1218,-374.5,613.5],[0.05537,0.88928,0.16551,-0.42283],[-2,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p43:=[[1127.6,-769.5,1223.7],[0.97318,-0.07878,-0.07887,-0.20123],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p44:=[[978.9,1199.2,1012.4],[0.79858,-0.53314,-0.19424,0.20078],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p45:=[[383.7,1336,1354.9],[0.72219,-0.01433,-0.2587,0.64133],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p46:=[[435.9,1319.9,1355.4],[0.76858,0.23475,-0.09498,0.58751],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p47:=[[-1033.1,50.8,1641.7],[0.01247,-0.01758,0.02494,-0.99946],[1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p48:=[[377.5,1415.88,1308.38],[0.99834,0.01368,-0.02727,-0.04856],[0,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p49:=[[-420.75,-1403.63,1308.5],[0.98962,-0.01942,-0.00026,-0.14233],[-2,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p50:=[[-1126.38,-931.25,1108.63],[0.02145,-0.39947,-0.91483,-0.0561],[-2,-2,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p51:=[[-993.25,-820.13,1302],[0.01139,0.40016,0.90831,0.12136],[-2,-2,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p52:=[[-379,-10.2,1234.1],[0.58941,-0.11868,-0.79132,0.11099],[-2,-2,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p53:=[[852.63,0,1485],[0.01286,0,0.99998,8E-05],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p54:=[[802,0,1672.63],[0.40263,0.2258,-0.1032,-0.88112],[0,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p55:=[[802.38,0.25,1497],[0.13276,-0.81807,-0.51997,0.20703],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p56:=[[802.38,1.63,1672.75],[0.81936,0.12446,-0.21204,-0.5179],[0,1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p57:=[[801.63,-1.75,1497.25],[0.22304,-0.40413,-0.88017,0.11109],[-1,1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p58:=[[802,0,1672.63],[0.40263,0.2258,-0.1032,-0.88112],[0,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p59:=[[802.38,0.25,1497],[0.13276,-0.81807,-0.51997,0.20703],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p60:=[[802.38,1.38,1672.75],[0.81923,0.12559,-0.2113,-0.51816],[0,-2,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p61:=[[801,-1.38,1497.63],[0.22809,-0.39908,-0.88116,0.11078],[-1,-2,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p62:=[[949.7,0.1,1575.9],[0.10941,-0.72786,0.11782,-0.66661],[-1,0,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p63:=[[949.7,0.1,1575.9],[0.10943,-0.72788,0.11786,-0.66658],[-1,0,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p64:=[[949.7,0.1,1575.9],[0.10635,0.72788,0.11768,0.6671],[-1,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p65:=[[949.7,0.1,1575.9],[0.10637,0.72787,0.11771,0.66711],[-1,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p66:=[[-395.13,-9,2313.88],[0.19983,0.16154,0.04678,0.96532],[-2,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p67:=[[851.3,-0.5,1684.7],[0.65623,0.00617,0.00241,0.75453],[-1,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p68:=[[1596.25,-22.13,462.38],[0.07773,0.90399,0.19736,0.37133],[1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p69:=[[-633,11.25,777],[0.15805,-0.71997,-0.14837,0.65929],[1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p70:=[[-1524.25,25,197.88],[0.18291,-0.59572,-0.1205,0.77275],[1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p71:=[[-1519.75,48.75,985.5],[0.16676,0.26193,-0.93265,-0.18381],[1,-2,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p72:=[[-1520.75,-2.5,986],[0.23306,0.14799,-0.95604,0.09879],[-2,1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p73:=[[-1443.38,50.38,1162.5],[0.93373,-0.1848,0.1366,-0.27466],[1,1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p74:=[[-1444.75,21.5,1166.75],[0.22132,0.17224,0.02978,0.95945],[1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p75:=[[-1578.75,25.63,1066],[0.67262,-0.13392,-0.71915,0.112],[1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p76:=[[-1578.88,25.88,1065.75],[0.67215,0.10798,-0.72368,-0.11368],[1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p77:=[[850.3,99.9,1580.4],[0.69194,-0.72151,-0.01761,-0.01833],[-1,-2,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p78:=[[849.9,-100,1588.8],[0.01931,0.01721,-0.69198,0.72145],[-1,-2,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p79:=[[800,-86.63,1586.38],[0.36503,0.61185,0.34216,-0.61263],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p80:=[[802.13,87.75,1583],[0.34949,-0.6081,0.37246,0.60776],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  ! Definition of speeddata
  CONST speeddata v125:=[125,400,1000,90];
  CONST speeddata v250:=[250,400,1000,90];
  CONST speeddata v1250:=[1250,400,1000,90];
  CONST speeddata v1875:=[1875,400,1000,90];
  ! Definition of zonedata
  CONST zonedata path:=[FALSE,25,25,25,25,25,25];
  CONST zonedata corner1:=[FALSE,15,15,15,15,15,15];
  CONST zonedata corner2:=[FALSE,100,100,100,100,100,100];
  ! Definition of tooldata
  PERS tooldata loadtool:=[TRUE,[[0,0,0],[1,0,0,0]],[10,[67,0,75],[1,0,0,0],0,0,0]];
  ! Definition of global variables  
  PERS tooldata notool:=[TRUE,[[0,0,0],[1,0,0,0]],[0,[0,0,0],[1,0,0,0],0,0,0]];
  ! Definition of global variables
  VAR num counter1;
  VAR num counter2;
  VAR num ANSWER;

  PROC haupt()
    main;
  ENDPROC

  PROC main()
    program10;
    program15;
    TPWrite "Main program";
    program20;
    TPWrite "Wrist program";
    FOR counter1 FROM 1 TO 50 DO
      program200;
    ENDFOR
    reg1:=0;
    TPWrite "Main program";
    FOR counter1 FROM 1 TO 700 DO
      program20;
    ENDFOR
    TPWrite "Program end";
    TPWrite "Exit program";
    EXIT;
  ENDPROC

  PROC program10()
    TPErase;
    TPReadFK ANSWER,"Testload?","Yes","No","","","";
    TEST ANSWER
    CASE 1:
    CASE 2:
      loadtool:=notool;
    ENDTEST
  ENDPROC

  PROC program15()
    TPErase;
    TPReadFK ANSWER,"Wrist program before main, main direct?","Wrist","Main","","","Exit";
    TEST ANSWER
    CASE 1:
    CASE 2:
      program16;
    CASE 5:
      TPWrite "Exit program";
      EXIT;
    ENDTEST
  ENDPROC

  PROC program16()
    reg1:=0;
    TPWrite "Main program";
    FOR counter1 FROM 1 TO 700 DO
      program20;
    ENDFOR
    TPWrite "Program end";
    TPWrite "Exit program";
    EXIT;
  ENDPROC

  PROC program20()
    MoveJ p1,v500,FINE,loadtool;
    SingArea\Wrist;
    MoveL p2,v125,FINE,loadtool;
    SingArea\Off;
    WaitTime 1;
    reg1:=reg1+1;
    IF reg1=35 THEN
      TPWrite "Waiting for brake";
      WaitTime 182;
      TPErase;
      reg1:=0;
    ENDIF
    MoveJ p3,v500,FINE,loadtool;
    MoveL p4,v500,FINE,loadtool;
    MoveL p5,v500,FINE,loadtool;
    MoveL p6,v500,path,loadtool;
    MoveL p7,v500,FINE,loadtool;
    MoveL p8,v500,FINE,loadtool;
    MoveL p9,v500,FINE,loadtool;
    MoveL p10,v500,FINE,loadtool;
    MoveL p11,v500,FINE,loadtool;
    MoveJ p12,v2500,path,loadtool;
    MoveJ p13,v2500,path,loadtool;
    MoveJ p14,v2500,path,loadtool;
    MoveJ p15,v2500,FINE,loadtool;
    MoveJ p16,v2500,path,loadtool;
    MoveJ p17,v2500,path,loadtool;
    MoveJ p18,v2500,path,loadtool;
    MoveJ p19,v2500,path,loadtool;
    MoveJ p20,v2500,path,loadtool;
    MoveJ p21,v2500,FINE,loadtool;
    MoveJ p22,v2500,FINE,loadtool;
    MoveJ p23,v2500,path,loadtool;
    MoveJ p24,v2500,FINE,loadtool;
    MoveJ p25,v2500,FINE,loadtool;
    MoveJ p26,v2500,path,loadtool;
    MoveJ p27,v2500,path,loadtool;
    MoveJ p28,v2500,path,loadtool;
    MoveJ p29,v2500,path,loadtool;
    MoveJ p30,v2500,path,loadtool;
    MoveJ p31,v2500,path,loadtool;
    MoveJ p32,v2500,FINE,loadtool;
    MoveJ p33,v2500,path,loadtool;
    MoveJ p34,v2500,path,loadtool;
    MoveJ p35,v2500,path,loadtool;
    MoveJ p36,v2500,path,loadtool;
    MoveJ p37,v2500,path,loadtool;
    MoveJ p38,v500,path,loadtool;
    MoveJ p39,v2500,path,loadtool;
    MoveJ p40,v2500,path,loadtool;
    MoveJ p41,v1250,path,loadtool;
    MoveJ p42,v250,path,loadtool;
    MoveJ p43,v2500,path,loadtool;
    MoveJ p44,v2500,path,loadtool;
    MoveJ p45,v2500,FINE,loadtool;
    MoveJ p46,v2500,FINE,loadtool;
    MoveJ p47,v2500,path,loadtool;
    MoveJ p48,v2500,path,loadtool;
    MoveJ p49,v2500,path,loadtool;
    MoveJ p50,v2500,path,loadtool;
    MoveJ p51,v2500,path,loadtool;
    MoveJ p52,v2500,path,loadtool;
    MoveJ p53,v2500,fine,loadtool;
  ENDPROC

  PROC program200()
    MoveJ p67,v1500,path,loadtool;
    AccSet 50,100;
    FOR counter2 FROM 1 TO 5 DO
      program205;
    ENDFOR
    FOR counter2 FROM 1 TO 5 DO
      program206;
    ENDFOR
    FOR counter2 FROM 1 TO 5 DO
      program215;
    ENDFOR
    FOR counter2 FROM 1 TO 5 DO
      program225;
    ENDFOR
    AccSet 100,100;
  ENDPROC

  PROC program205()
    MoveJ p54,v2500,FINE,loadtool;
    MoveJ p55,v2500,FINE,loadtool;
    MoveJ p56,v2500,FINE,loadtool;
    MoveJ p57,v2500,FINE,loadtool;
    MoveJ p58,v2500,FINE,loadtool;
    MoveJ p59,v2500,FINE,loadtool;
    MoveJ p60,v2500,FINE,loadtool;
    MoveJ p61,v2500,FINE,loadtool;
  ENDPROC

  PROC program206()
    MoveJ p62,v1875,FINE,loadtool;
    MoveJ p63,v1875,path,loadtool;
    MoveJ p64,v1875,FINE,loadtool;
    MoveJ p65,v1875,path,loadtool;
  ENDPROC

  PROC program215()
    MoveJ p77,v1875,FINE,loadtool;
    WaitTime 1;
    MoveJ p78,v1875,FINE,loadtool;
    WaitTime 1;
  ENDPROC

  PROC program225()
    MoveJ p79,v1875,FINE,loadtool;
    WaitTime 1;
    MoveJ p80,v1875,FINE,loadtool;
    WaitTime 1;
  ENDPROC
ENDMODULE


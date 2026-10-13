%%%
  VERSION:1
  LANGUAGE:ENGLISH
%%%

MODULE AXIS1400
  !COPYRIGHT 1994 ABB ROBOTICS PRODUCTS AB
  !1994-12-08  
  PERS tooldata loadtool:=[TRUE,[[0,0,0],[1,0,0,0]],[5,[67,0,75],[1,0,0,0],0,0,0]];
  PERS tooldata currload:=[TRUE,[[0,0,0],[1,0,0,0]],[5,[67,0,75],[1,0,0,0],0,0,0]];
  VAR robtarget homepos;
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
  VAR string irbtype;
  VAR num X;

  PROC haupt()
    main;
  ENDPROC

  PROC main()
    VAR num answer;

    TPErase;
    TPWrite "AXIS TEST PROGRAM";
    TPReadFK answer,"Select type of IRB...","1400","1400H","","","EXIT";
    TEST answer
    CASE 1:
      irbtype:="IRB1400";
      homepos:=[[1082.9,0,1101],[0.4649,-0.00038,0.88536,-4E-05],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis1_p1:=[[-262.3,-152.5,1809.4],[0.23379,0.4229,0.11474,-0.86795],[-2,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis1_p2:=[[-260.7,155.3,1809.4],[0.23864,-0.4227,0.11556,0.86661],[1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis2_p1:=[[374.7,0,820.9],[0.56252,0.00135,0.82678,-0.00111],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis2_p2:=[[1510.6,1.2,599.1],[0.4426,0.00113,0.89672,-0.00138],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis3_p1:=[[866,0,1649.3],[0.78027,-0.00029,0.62545,-5E-05],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis3_p2:=[[434.6,0,246.6],[0.27579,0,-0.96122,-0.00024],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis4_p1:=[[1086.4,-22.9,1185.5],[0.1206,-0.48355,0.23029,-0.83582],[-1,-2,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis4_p2:=[[1086.4,22.7,1185.5],[0.12119,0.48348,0.23017,0.83581],[-1,1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis5_p1:=[[1019.2,-0.3,1245.3],[0.9759,-0.00405,-0.21816,0.0033],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis5_p2:=[[1036.2,-1.4,1085.6],[0.11384,-0.00396,-0.99348,0.00362],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis6_p1:=[[1139.6,-1,1156.8],[0.51832,0.46439,0.59371,0.40397],[-1,-1,-4,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis6_p2:=[[1139.6,-1,1156.8],[0.499,-0.48946,0.57323,-0.42759],[-1,-1,3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CASE 2:
      irbtype:="IRB1400H";
      homepos:=[[654.99,0.01,1048.84],[0.722648,0.000395,0.691217,0.000151],[0,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis1_p1:=[[-757.74,-261.82,1005.29],[0.116597,0.718293,0.117407,-0.675778],[-2,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis1_p2:=[[-786.37,156.03,1005.29],[0.063951,-0.724017,0.074314,0.68278],[1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis2_p1:=[[808.65,-0.71,1001.96],[0.683852,0.003536,0.729607,0.002891],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis2_p2:=[[241.02,-0.2,751.08],[0.683877,0.003567,0.729583,0.002899],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis3_p1:=[[146.95,-0.1,1682.91],[0.960543,0.001043,0.278113,0.003171],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis3_p2:=[[547.54,-0.41,503.25],[0.40446,0.003789,0.914547,0.001467],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis4_p1:=[[568.56,-46.61,970.03],[0.285313,0.958357,-0.006021,-0.010608],[-1,1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis4_p2:=[[568.52,43.19,968.06],[0.264239,-0.964368,0.002329,0.012966],[-1,-2,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis5_p1:=[[552.51,0.78,958.15],[0.107087,-0.003469,-0.994232,-0.004825],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis5_p2:=[[569.43,-1.02,1126.16],[0.999955,0.005279,-0.0069,0.003825],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis6_p1:=[[655.59,-0.04,1044.74],[0.009461,0.692958,0.008792,0.720863],[-1,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis6_p2:=[[655.58,-0.05,1044.74],[0.051838,0.691232,0.049516,0.719068],[-1,0,-3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CASE 5:
      TPWrite "Exit program";
      EXIT;
    ENDTEST
    TPErase;
    TPWrite "Axis program for ";
    TPWrite irbtype;
    TPReadFK answer,"TEST LOAD?","Yes","No","","","";
    TEST answer
    CASE 1:
      currload:=loadtool;
    CASE 2:
      currload:=tool0;
    ENDTEST
    WHILE TRUE DO
    TPReadNum X,"Number of movements";
    TPReadNum answer,"Select robot axis 1 to 6 ";
      TEST answer
      CASE 1:
        AX_DIALOG 1;
      CASE 2:
        AX_DIALOG 2;
      CASE 3:
        AX_DIALOG 3;
      CASE 4:
        AX_DIALOG 4;
      CASE 5:
        AX_DIALOG 5;
      CASE 6:
        AX_DIALOG 6;
      DEFAULT:
        TPWrite "Exit program";
        EXIT;
      ENDTEST
    ENDWHILE
  ENDPROC

  PROC AX_DIALOG(
    num axis)

    VAR bool flag;
    VAR num answer;

    TPWrite "JOGGING AXIS PROGRAM";
    MoveJ homepos,v400,fine,currload;
    flag:=TRUE;
    WHILE flag DO
      AX_MOVE axis;
      TPReadFK answer,"Select action...","Repeat","Change","","","Exit";
      TEST answer
      CASE 1:
      CASE 2:
        flag:=FALSE;
      CASE 5:
        TPWrite "Exit program";
        EXIT;
      ENDTEST
    ENDWHILE
  ENDPROC

  PROC AX_MOVE(
    num axis)

    TEST axis
    CASE 1:
      FOR I FROM 1 TO X DO
        MoveJ axis1_p1,v2500,fine,currload;
        MoveJ axis1_p2,v2500,fine,currload;
      ENDFOR
    CASE 2:
      FOR I FROM 1 TO X DO
        MoveJ axis2_p1,v2500,fine,currload;
        MoveJ axis2_p2,v2500,fine,currload;
      ENDFOR
    CASE 3:
      FOR I FROM 1 TO X DO
        MoveJ axis3_p1,v2500,fine,currload;
        MoveJ axis3_p2,v2500,fine,currload;
      ENDFOR
    CASE 4:
      FOR I FROM 1 TO X DO
        MoveJ axis4_p1,v2500,fine,currload;
        MoveJ axis4_p2,v2500,fine,currload;
      ENDFOR
    CASE 5:
      FOR I FROM 1 TO X DO
        MoveJ axis5_p1,v2500,fine,currload;
        MoveJ axis5_p2,v2500,fine,currload;
      ENDFOR
    CASE 6:
      FOR I FROM 1 TO X DO
        MoveJ axis6_p1,v2500,fine,currload;
        MoveJ axis6_p2,v2500,fine,currload;
      ENDFOR
    ENDTEST
  ENDPROC
ENDMODULE


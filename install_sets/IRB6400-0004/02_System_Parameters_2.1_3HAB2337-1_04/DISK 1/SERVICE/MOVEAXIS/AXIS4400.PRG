%%%
  VERSION:1
  LANGUAGE:ENGLISH
%%%

MODULE AXIS4400
  !COPYRIGHT 1995 ABB ROBOTICS PRODUCTS AB
  !1995-02-21  
  PERS tooldata loadtool1:=[TRUE,[[0,0,0],[1,0,0,0]],[46,[129,0,176],[1,0,0,0],0,0,0]];
  PERS tooldata loadtool2:=[TRUE,[[0,0,0],[1,0,0,0]],[62,[129,0,176],[1,0,0,0],0,0,0]];
  PERS tooldata currload:=[TRUE,[[0,0,0],[1,0,0,0]],[0,[0,0,0],[1,0,0,0],0,0,0]];
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
    TPReadFK answer,"Select type of IRB/...","4400","","","","EXIT";
    TEST answer
    CASE 1:
      irbtype:="IRB4400";
      homepos:=[[1210.81,3.01,1734.9],[0.719101,0.002816,0.694883,0.004919],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
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
    CASE 5:
      TPWrite "Exit program";
      EXIT;
    ENDTEST
    TPErase;
    TPWrite "Axis program for ";
    TPWrite irbtype;
    TPReadFK answer,"TEST LOAD?","45kg","60kg","","","No";
    TEST answer
    CASE 1:
      currload:=loadtool1;
    CASE 2:
      currload:=loadtool2;
    CASE 5:
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


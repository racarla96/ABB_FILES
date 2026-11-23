%%%
  VERSION:1
  LANGUAGE:ENGLISH
%%%

MODULE AXIS2400
  !COPYRIGHT 1994 ABB ROBOTICS PRODUCTS AB
  !1994-12-08  
  PERS tooldata loadtool:=[TRUE,[[0,0,0],[1,0,0,0]],[10,[67,0,75],[1,0,0,0],0,0,0]];
  PERS tooldata currload:=[TRUE,[[0,0,0],[1,0,0,0]],[10,[67,0,75],[1,0,0,0],0,0,0]];
  VAR num X;

  PROC haupt()
    main;
  ENDPROC

  PROC main()
    VAR num answer;

    TPErase;
    TPReadFK answer,"TEST LOAD?","Yes","No","","","";
    TEST answer
    CASE 1:
      currload:=loadtool;
    CASE 2:
      currload:=tool0;
    ENDTEST
    WHILE TRUE DO
    TPReadNum X,"Number of movements";
    TPReadNum answer,"Select robot axis 1 to 6 :";
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
    MoveJ [[1527.6,-0.14,1266.21],[0.636894,0.006957,0.770902,0.005283],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],v200,fine,currload;
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
        MoveJ [[-31.9,-1.3,2267.4],[0.019,-0.521,-0.0107,-0.8533],[-2,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],v2500,fine,currload;
        MoveJ [[-31.9,0.9,2267.4],[0.0181,0.5209,-0.0121,0.8533],[1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],v2500,fine,currload;
      ENDFOR
    CASE 2:
      FOR I FROM 1 TO X DO
        MoveJ [[410.6,4.39,1171.76],[0.655639,-0.003063,0.755055,0.004558],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],v2500,fine,currload;
        MoveJ [[1622.69,17.22,968.86],[0.655622,-0.003028,0.755069,0.004582],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],v2500,fine,currload;
      ENDFOR
    CASE 3:
      FOR I FROM 1 TO X DO
        MoveJ [[411,0,2325.5],[0.95904,0.00012,0.28327,0.00037],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],v2500,fine,currload;
        MoveJ [[616.3,0,726.4],[0.28001,0.00063,0.96,0.00014],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],v2500,fine,currload;
      ENDFOR
    CASE 4:
      FOR I FROM 1 TO X DO
        MoveJ [[1529.2,0,1291],[0.13906,-0.67131,0.14178,-0.71407],[0,2,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],v2500,fine,currload;
        MoveJ [[1529.2,0,1291],[0.03746,0.68456,0.04585,0.72655],[0,-3,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],v2500,fine,currload;
      ENDFOR
    CASE 5:
      FOR I FROM 1 TO X DO
        MoveJ [[1379.61,0.3,1371.82],[0.96393,-0.019449,-0.256914,0.066752],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],v2500,fine,currload;
        MoveJ [[1389.53,-0.41,1193.4],[0.202925,-0.067637,-0.976729,0.01575],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],v2500,fine,currload;
      ENDFOR
    CASE 6:
      FOR I FROM 1 TO X DO
        MoveJ [[1527.93,-0.21,1267.96],[0.427878,0.572114,0.50799,0.481199],[-1,-1,-3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],v2500,fine,currload;
        MoveJ [[1527.92,-0.24,1267.96],[0.486108,-0.501324,0.577996,-0.42225],[-1,-1,3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],v2500,fine,currload;
      ENDFOR
    ENDTEST
  ENDPROC
ENDMODULE


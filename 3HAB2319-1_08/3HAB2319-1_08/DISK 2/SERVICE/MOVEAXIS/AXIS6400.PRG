%%%
  VERSION:1
  LANGUAGE:ENGLISH
%%%

MODULE AXI6400C
  !COPYRIGHT 1994 ABB ROBOTICS PRODUCTS AB
  !1995-05-08
!#####################################################
!Revision Notes:
!RW2.0 Required
!SPICE Update 95-10-26/SLT
!2.8_120 degrees added to all models 95-11-15/SLT
!New tooldata 120/175kg 95-11-30/SLT 
!IRB6400C added     96-03-13/SLT
!
!#####################################################
 
  PERS tooldata load_75:=[TRUE,[[0,0,0],[1,0,0,0]],[75,[150,0,250],[1,0,0,0],0,0,0]];
  PERS tooldata load_120:=[TRUE,[[0,0,0],[1,0,0,0]],[120,[150,0,357],[1,0,0,0],0,0,0]];
  PERS tooldata load_150:=[TRUE,[[0,0,0],[1,0,0,0]],[150,[150,0,250],[1,0,0,0],0,0,0]];
  PERS tooldata load_175:=[TRUE,[[0,0,0],[1,0,0,0]],[175,[150,0,301],[1,0,0,0],0,0,0]];
  PERS tooldata currload:=[TRUE,[[0,0,0],[1,0,0,0]],[75,[150,0,250],[1,0,0,0],0,0,0]];
  VAR jointtarget homepos;
  VAR jointtarget axis1_p1;
  VAR jointtarget axis1_p2;
  VAR jointtarget axis2_p1;
  VAR jointtarget axis2_p2;
  VAR jointtarget axis3_p1;
  VAR jointtarget axis3_p2;
  VAR jointtarget axis4_p1;
  VAR jointtarget axis4_p2;
  VAR jointtarget axis5_p1;
  VAR jointtarget axis5_p2;
  VAR jointtarget axis6_p1;
  VAR jointtarget axis6_p2;
  VAR string irbtype;
  VAR num X;

  PROC haupt()
    main;
  ENDPROC

  PROC main()
    VAR num answer;

    TPErase;
    TPWrite "AXIS TEST PROGRAM";
    TPReadFK answer,"Select type of IRB 6400/...","2.4_1XX","2.8_120","3.0_75","2,2_P75","More";
    TEST answer
    CASE 1:
      irbtype:="IRB6400/2.4_120/150/175";
      homepos:=[[0,50,15,0,15,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis1_p1:=[[170,65,15,0,15,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis1_p2:=[[-170,65,15,0,15,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis2_p1:=[[0,60,0,0,15,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis2_p2:=[[0,-63,0,0,15,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis3_p1:=[[0,-18,43,0,15,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis3_p2:=[[0,-18,-26,0,15,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis4_p1:=[[0,50,15,298,47,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis4_p2:=[[0,50,15,-298,47,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis5_p1:=[[0,50,15,0,-118,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis5_p2:=[[0,50,15,0,118,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis6_p1:=[[0,50,15,0,-16,200],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis6_p2:=[[0,50,15,0,-16,-200],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CASE 2:
      irbtype:="IRB6400/2.8_120";
      homepos:=[[0,50,15,0,15,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis1_p1:=[[170,65,15,0,15,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis1_p2:=[[-170,65,15,0,15,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis2_p1:=[[0,60,0,0,15,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis2_p2:=[[0,-63,0,0,15,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis3_p1:=[[0,-18,43,0,15,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis3_p2:=[[0,-18,-26,0,15,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis4_p1:=[[0,50,15,298,47,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis4_p2:=[[0,50,15,-298,47,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis5_p1:=[[0,50,15,0,-118,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis5_p2:=[[0,50,15,0,118,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis6_p1:=[[0,50,15,0,-16,200],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis6_p2:=[[0,50,15,0,-16,-200],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CASE 3:
      irbtype:="IRB6400/3.0_75";
      homepos:=[[0,50,15,0,15,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis1_p1:=[[170,65,15,0,15,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis1_p2:=[[-170,65,15,0,15,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis2_p1:=[[0,60,0,0,15,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis2_p2:=[[0,-63,0,0,15,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis3_p1:=[[0,-18,43,0,15,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis3_p2:=[[0,-18,-26,0,15,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis4_p1:=[[0,50,15,298,47,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis4_p2:=[[0,50,15,-298,47,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis5_p1:=[[0,50,15,0,-118,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis5_p2:=[[0,50,15,0,118,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis6_p1:=[[0,50,15,0,-16,200],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis6_p2:=[[0,50,15,0,-16,-200],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CASE 4:
      irbtype:="IRB6400/2.25_PE75";
      homepos:=[[0,50,15,0,15,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis1_p1:=[[170,65,15,0,15,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis1_p2:=[[-170,65,15,0,15,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis2_p1:=[[0,60,0,0,15,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis2_p2:=[[0,-63,0,0,15,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis3_p1:=[[0,-18,43,0,15,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis3_p2:=[[0,-18,-26,0,15,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis4_p1:=[[0,50,15,298,47,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis4_p2:=[[0,50,15,-298,47,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis5_p1:=[[0,50,15,0,-118,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis5_p2:=[[0,50,15,0,118,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis6_p1:=[[0,50,15,0,-16,200],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis6_p2:=[[0,50,15,0,-16,-200],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CASE 5:
      more_types;
   ENDTEST
    TPErase;
    TPWrite "Axis program for ";
    TPWrite irbtype;
    TPReadFK answer,"TEST LOAD?","75kg","120kg","150kg","175kg","No";
    TEST answer
    CASE 1:
      currload:=load_75;
    CASE 2:
      currload:=load_120;
    CASE 3:
      currload:=load_150;
    CASE 4:
      currload:=load_175;
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

  PROC more_types()
    VAR num answer;
  TPReadFK answer,"Select type of IRB 6400/...","S2.9_120","C","","","Exit";
    TEST answer
    CASE 1:
      irbtype:="IRB6400/S2.9_120";
      homepos:=[[0,60,60,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis1_p1:=[[0,0,0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis1_p2:=[[0,0,0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis2_p1:=[[0,0,0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis2_p2:=[[0,0,0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis3_p1:=[[0,0,0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis3_p2:=[[0,0,0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis4_p1:=[[0,0,0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis4_p2:=[[0,0,0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis5_p1:=[[0,0,0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis5_p2:=[[0,0,0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis6_p1:=[[0,0,0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis6_p2:=[[0,0,0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CASE 2:
      irbtype:="IRB6400C";
      homepos:=[[0,0,0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis1_p1:=[[65,0,0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis1_p2:=[[-64,0,0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis2_p1:=[[0,85,0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis2_p2:=[[0,-85,0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis3_p1:=[[0,0,60,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis3_p2:=[[0,0,-175,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis4_p1:=[[0,0,0,295,90,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis4_p2:=[[0,0,0,-295,90,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis5_p1:=[[0,0,0,0,115,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis5_p2:=[[0,0,0,0,-115,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis6_p1:=[[0,0,0,0,0,295],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis6_p2:=[[0,0,0,0,0,-295],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CASE 5:
      main;
    ENDTEST
  ENDPROC

  PROC AX_DIALOG(
    num axis)

    VAR bool flag;
    VAR num answer;

    TPWrite "JOGGING AXIS PROGRAM";
    MoveAbsJ homepos,v400,fine,currload;
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
        MoveAbsJ axis1_p1,v2500,fine,currload;
        MoveAbsJ axis1_p2,v2500,fine,currload;
      ENDFOR
    CASE 2:
      FOR I FROM 1 TO X DO
        MoveAbsJ axis2_p1,v2500,fine,currload;
        MoveAbsJ axis2_p2,v2500,fine,currload;
      ENDFOR
    CASE 3:
      FOR I FROM 1 TO X DO
        MoveAbsJ axis3_p1,v1500,fine,currload;
        MoveAbsJ axis3_p2,v1500,fine,currload;
      ENDFOR
    CASE 4:
      FOR I FROM 1 TO X DO
        MoveAbsJ axis4_p1,v2500,fine,currload;
        MoveAbsJ axis4_p2,v2500,fine,currload;
      ENDFOR
    CASE 5:
      FOR I FROM 1 TO X DO
        MoveAbsJ axis5_p1,v2500,fine,currload;
        MoveAbsJ axis5_p2,v2500,fine,currload;
      ENDFOR
    CASE 6:
      FOR I FROM 1 TO X DO
        MoveAbsJ axis6_p1,v2500,fine,currload;
        MoveAbsJ axis6_p2,v2500,fine,currload;
      ENDFOR
    ENDTEST
  ENDPROC
ENDMODULE


%%%
  VERSION:1
  LANGUAGE:ENGLISH
%%%

MODULE AXIS2400
  !COPYRIGHT 1996 ABB ROBOTICS PRODUCTS AB
  !1996-03-15    SLT/SEROP/PU

!##########################################################################
!   Revision Notes:
!   RW2.0 or better required
!   New IRB2400/L, 10, 16  Axisprg  96-03-15/SLT
!   axis1_p1 changed pos ax2 and 3    96-04-22/SLT
!##########################################################################
  
  PERS tooldata loadtool2:=[TRUE,[[0,0,0],[1,0,0,0]],[10,[100,0,100],[1,0,0,0],0,0,0]];
  PERS tooldata loadtool1:=[TRUE,[[0,0,0],[1,0,0,0]],[5,[67,0,75],[1,0,0,0],0,0,0]];
  PERS tooldata loadtool3:=[TRUE,[[0,0,0],[1,0,0,0]],[16,[100,0,100],[1,0,0,0],0,0,0]];
  PERS tooldata currload:=[TRUE,[[0,0,0],[1,0,0,0]],[0,[0,0,0],[1,0,0,0],0,0,0]];
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
    TPReadFK answer,"Select type of IRB2400/...","L","10","16","","EXIT";
    TEST answer
    CASE 1:
      irbtype:="IRB2400/L";
   CASE 2:
      irbtype:="IRB2400/10";
    CASE 3:
      irbtype:="IRB2400/16";
    CASE 5:
      TPWrite "Exit program";
      EXIT;
    ENDTEST
      homepos:=[[0,0,0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis1_p1:=[[170,-19,-65,0,-42,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis1_p2:=[[-170,-19,-65,0,-42,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis2_p1:=[[0,60,0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis2_p2:=[[0,-60,0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis3_p1:=[[0,0,60,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis3_p2:=[[0,0,-55,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis4_p1:=[[0,0,0,180,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis4_p2:=[[0,0,0,-180,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis5_p1:=[[0,0,0,0,100,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis5_p2:=[[0,0,0,0,-100,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis6_p1:=[[0,0,0,0,0,290],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      axis6_p2:=[[0,0,0,0,0,-290],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    TPErase;
    TPWrite "Axis program for ";
    TPWrite irbtype;
    TPReadFK answer,"TEST LOAD?","5kg","10kg","16kg","","No";
    TEST answer
    CASE 1:
      currload:=loadtool1;
    CASE 2:
      currload:=loadtool2;
    CASE 3:
      currload:=loadtool3;
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
        MoveAbsJ axis3_p1,v2500,fine,currload;
        MoveAbsJ axis3_p2,v2500,fine,currload;
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


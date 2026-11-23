%%%
  VERSION:1
  LANGUAGE:ENGLISH
%%%

MODULE VIB2400
  !Copyright 1996 ABB Robotics Products AB
  !1996-03-15    SLT/SEROP/PU

!##########################################################################
!  Revision Notes:
!  RW2.0 or better required
!  New Vibprogram          96-03-15/SLT
!  ax4_lash1-3 added  10/16kg   96-03-23/SLT
!  PROC vibrate deleted   96-04-04/SLT
!  Changed positons lash 10/16kg    96-04-22/SLT
!  v250 changed to v200    96-04-22/SLT
!  testloadposition added    96-04-22/SLT
!  weight deleted    96-04-22/SLT
!##########################################################################

  !Definition of global variables
  VAR string irbtype;
  VAR num answer;
  VAR bool flag;
  PERS bool type:=TRUE;

  !Definition of jointtargets
  VAR jointtarget ax1_lash1;
  VAR jointtarget ax3_lash1;
  VAR jointtarget ax4_lash1;
  VAR jointtarget ax4_lash2;
  VAR jointtarget ax4_lash3;
  VAR jointtarget ax5_lash1;
  VAR jointtarget ax5_lash2;
  VAR jointtarget ax5_lash3;
  VAR jointtarget ax6_lash1;
  VAR jointtarget ax6_lash2;
  VAR jointtarget ax6_lash3;
  VAR jointtarget ax6_lash4;
  VAR jointtarget ax6_lash5;
  VAR jointtarget testload_pos;
 
 PROC haupt()
    main;
  ENDPROC

  PROC main()
    TPErase;
    TPWrite "Lash test program";
    TPReadFK answer,"Select type of IRB2400/...","L","10","16","","EXIT";
    TEST answer
    CASE 1:
      irbtype:="IRB2400/M96 5kg";
      type:=FALSE;
      ax1_lash1:=[[171.19,59.5,1.45,-2.6,0.96,321.72],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax5_lash1:=[[168.95,59.22,1.04,90,0,-90],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax5_lash2:=[[168.95,59.22,1.04,90,-90,-90],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax5_lash3:=[[168.95,59.22,1.04,90,90,-90],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax6_lash1:=[[168.37,59.24,1.61,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax6_lash2:=[[168.37,59.24,1.61,0,-1,-120],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax6_lash3:=[[168.37,59.24,1.61,0,-1,120],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    ax3_lash1:=[[171.19,30,89.78,4.4,0.95,65.85],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    testload_pos:=[[170,58.63,31.89,0,-102.79,183.7],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CASE 2:
      irbtype:="IRB2400/M96 10kg";
      ax1_lash1:=[[178.95,59.5,1.45,-2.6,-6.67,292.55],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    ax3_lash1:=[[178.95,30,89.78,4.4,0.95,65.85],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
       ax4_lash1:=[[168.95,59.23,1.05,0,-90.84,-209.56],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
       ax4_lash2:=[[168.95,59.23,1.05,90,-90.84,-209.56],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
       ax4_lash3:=[[168.95,59.23,1.05,180,-90.84,-209.56],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax5_lash1:=[[168.95,59.22,1.04,90,0,-90],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax5_lash2:=[[168.95,59.22,1.04,90,-90,-90],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax5_lash3:=[[168.95,59.22,1.04,90,90,-90],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax6_lash1:=[[168.37,59.24,1.61,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax6_lash2:=[[168.37,59.24,1.61,0,-1,-120],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax6_lash3:=[[168.37,59.24,1.61,0,-1,120],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    testload_pos:=[[170,58.63,31.89,0,-102.79,183.7],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
   CASE 3:
      irbtype:="IRB2400/M96 16kg";
      ax1_lash1:=[[172.93,59.5,1.45,-2.6,-6.67,292.55],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    ax3_lash1:=[[171.19,30,89.78,4.4,0.95,65.85],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
       ax4_lash1:=[[168.95,59.23,1.05,0,-90.84,-209.56],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
       ax4_lash2:=[[168.95,59.23,1.05,90,-90.84,-209.56],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
       ax4_lash3:=[[168.95,59.23,1.05,180,-90.84,-209.56],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax5_lash1:=[[168.95,59.22,1.04,90,0,-90],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax5_lash2:=[[168.95,59.22,1.04,90,-90,-90],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax5_lash3:=[[168.95,59.22,1.04,90,90,-90],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax6_lash1:=[[168.37,59.24,1.61,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax6_lash2:=[[168.37,59.24,1.61,0,-1,-120],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax6_lash3:=[[168.37,59.24,1.61,0,-1,120],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    testload_pos:=[[170,58.63,31.89,0,-102.79,183.7],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CASE 5:
      TPWrite "Exit program";
      EXIT;
    ENDTEST

    flag:=TRUE;
    WHILE flag DO
      TPErase;
      TPWrite "Test routines for ";
      TPWrite irbtype;
      TPReadFK answer,"Select operation...","Lash","","TstLoad","","Exit";
      TEST answer
    CASE 1:
        IF type=TRUE THEN 
            lash_10_16;
        ELSE
            lash_L;
        ENDIF
    CASE 3:
         testload;
    CASE 5:
         flag:=FALSE;
         type:=TRUE;
         EXIT;
      ENDTEST
    ENDWHILE
  ENDPROC

  PROC testload()
    TPErase;
    TP_Read_FK answer,"Move to testload mounting pos.","Yes","","","","Exit";
    TEST answer
   CASE 1:
      TP_Read_FK answer,"Move to testload...","Start","","","","";
      MoveAbsJ testload_pos,v200,fine,tool0;
    CASE 5:
      flag:=FALSE;
    ENDTEST
  ENDPROC

  PROC lash_L()
    flag:=TRUE;
     WHILE flag DO
    TPErase;
    TPReadFK answer,"Test lash on axis 1, 3, 5 or 6...","Ax1","Ax3","Ax5","AX6","Exit";
    TEST answer
  CASE 1:
    TPReadFK answer,"Test lash on axis 1..","TEST","","","","";
    MoveAbsJ ax1_lash1,v200,fine,tool0;
  CASE 2:
    TPReadFK answer,"Test lash on axis 3...","TEST","","","","";
    MoveAbsJ ax3_lash1,v200,fine,tool0;
  CASE 3:
    TPReadFK answer,"Test lash on 0 deg. axis 5...","TEST","","","","";
    MoveAbsJ ax5_lash1,v200,fine,tool0;
    TPReadFK answer,"Test lash on -90 deg. axis 5...","TEST","","","","";
    MoveAbsJ ax5_lash2,v200,fine,tool0;
    TPReadFK answer,"Test lash on 90 deg. axis 5...","TEST","","","","";
    MoveAbsJ ax5_lash3,v200,fine,tool0;
  CASE 4:
    TPReadFK answer,"Test lash on 0 deg. axis 6...","TEST","","","","";
    MoveAbsJ ax6_lash1,v200,fine,tool0;
    TPReadFK answer,"Test lash on -120 deg. axis 6...","TEST","","","","";
    MoveAbsJ ax6_lash2,v200,fine,tool0;
    TPReadFK answer,"Test lash on 120 deg. axis 6...","TEST","","","","";
    MoveAbsJ ax6_lash3,v200,fine,tool0;
   CASE 5:
       flag:=FALSE;
       type:=TRUE;
     ENDTEST
   ENDWHILE
  ENDPROC

  PROC lash_10_16()
    flag:=TRUE;
     WHILE flag DO
    TPErase;
    TPReadFK answer,"Test lash on axis 1, 3, 4, 5 or 6...","Ax1","Ax3","Ax4","Ax5 & 6","Exit";
    TEST answer
  CASE 1:
    TPReadFK answer,"Test lash on axis 1..","TEST","","","","";
    MoveAbsJ ax1_lash1,v200,fine,tool0;
  CASE 2:
    TPReadFK answer,"Test lash on axis 3...","TEST","","","","";
    MoveAbsJ ax3_lash1,v200,fine,tool0;
  CASE 3:
    TPReadFK answer,"Test lash at 0 deg. axis 4","TEST","","","","";
    MoveAbsJ ax4_lash1,v200,fine,tool0;
    TPReadFK answer,"Test lash at 90 deg. axis 4","TEST","","","","";
    MoveAbsJ ax4_lash2,v200,fine,tool0;
    TPReadFK answer,"Test lash at 180 deg. axis 4","TEST","","","","";
    MoveAbsJ ax4_lash3,v200,fine,tool0;
  CASE 4:
    TPReadFK answer,"Test lash at 0 deg. axis 5...","TEST","","","","";
    MoveAbsJ ax5_lash1,v200,fine,tool0;
    TPReadFK answer,"Test lash at -90 deg. axis 5...","TEST","","","","";
    MoveAbsJ ax5_lash2,v200,fine,tool0;
    TPReadFK answer,"Test lash at 90 deg. axis 5...","TEST","","","","";
    MoveAbsJ ax5_lash3,v200,fine,tool0;

    TPReadFK answer,"Test lash at 0 deg. axis 6...","TEST","","","","";
    MoveAbsJ ax6_lash1,v200,fine,tool0;
    TPReadFK answer,"Test lash at -120 deg. axis 6...","TEST","","","","";
    MoveAbsJ ax6_lash2,v200,fine,tool0;
    TPReadFK answer,"Test lash at 120 deg. axis 6...","TEST","","","","";
    MoveAbsJ ax6_lash3,v200,fine,tool0;
   CASE 5:
     flag:=FALSE;
     type:=TRUE;
     EXIT;
    ENDTEST
   ENDWHILE
  ENDPROC
ENDMODULE

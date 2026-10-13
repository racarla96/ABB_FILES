%%%
  VERSION:1
  LANGUAGE:ENGLISH
%%%

MODULE BRAKE_64
  !COPYRIGHT 1996 ABB ROBOTICS PRODUCTS AB
  !1996-02-12 SLT/PU

!#####################################################
! Revision Notes:
! RW2.0 rev06 or better required
! New Program  
! New TCP 120kg 96-02-13/SLT
! PERS init, answer1 and 2 added   96-01-19/SLT
! positions shelf added    96-09-09/SLT
! load_200 added    1996-09-25/SLT
! PROC Principale added    1996-09-25/SLT
!#####################################################

! Variables:
 
  PERS tooldata load_75:=[TRUE,[[150,0,250],[1,0,0,0]],[75,[150,0,250],[1,0,0,0],0,0,0]];
  PERS tooldata load_120:=[TRUE,[[150,0,357],[1,0,0,0]],[120,[150,0,357],[1,0,0,0],0,0,0]];
  PERS tooldata load_150:=[TRUE,[[150,0,250],[1,0,0,0]],[150,[150,0,250],[1,0,0,0],0,0,0]];
  PERS tooldata load_175:=[TRUE,[[150,0,301],[1,0,0,0]],[175,[150,0,301],[1,0,0,0],0,0,0]];
  PERS tooldata load_200:=[TRUE,[[150,0,301],[1,0,0,0]],[200,[150,0,301],[1,0,0,0],0,0,0]];
  PERS tooldata currload:=[TRUE,[[150,0,250],[1,0,0,0]],[75,[150,0,250],[1,0,0,0],0,0,0]];
  PERS jointtarget targ1:=[[-0.0100733,4.55999,1.77575,-3.020404,-67.5116,-102.506],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  PERS jointtarget targ2:=[[-30.4337,-2.039505,-0.898373,-3.016023,-67.5067,-102.498],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  PERS jointtarget targdiff:=[[-16.6993,20.7,17.8,58.2,38.1,36.6],[0,9E+09,9E+09,9E+09,9E+09,9E+09]];
  
  VAR jointtarget homepos;
  VAR jointtarget ax1_pos1;
  VAR jointtarget ax2_pos1;
  VAR jointtarget ax3_pos1;
  VAR jointtarget ax4_pos1;
  VAR jointtarget ax5_pos1;
  VAR jointtarget ax6_pos1;
  VAR jointtarget ax1_pos2;
  VAR jointtarget ax2_pos2;
  VAR jointtarget ax3_pos2;
  VAR jointtarget ax4_pos2;
  VAR jointtarget ax5_pos2;
  VAR jointtarget ax6_pos2;

  PERS num axisno:=0;
  PERS num answer1:=0;
  PERS num answer2:=0;
  PERS bool init:=TRUE;
  VAR string irbtype;
  VAR num X;

  PROC haupt()
    main;
  ENDPROC
  
  PROC Principale()
    main;
  ENDPROC

  PROC main()

    TPErase;
     IF init=TRUE THEN
    TPWrite "BRAKE TEST PROGRAM";
    TPReadFK answer1,"Select type of IRB 6400/...","2.4_1XX","2.8_120","3.0_75","2,2_P75","S2.9_120";
  ENDIF
   TEST answer1
    CASE 1:
      irbtype:="IRB6400/2.4_120/150/175/200";
      homepos:=[[0,0,0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax1_pos1:=[[-130,69,10,0,-10,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax1_pos2:=[[140,69,10,0,-10,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax2_pos1:=[[0,64,0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax2_pos2:=[[0,-64,0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax3_pos1:=[[0,0,64,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax3_pos2:=[[0,0,-27,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax4_pos1:=[[0,0,0,140,-90,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax4_pos2:=[[0,0,0,-140,-90,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax5_pos1:=[[0,0,0,0,60,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax5_pos2:=[[0,0,0,0,-90,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax6_pos1:=[[0,0,20,0,-21,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax6_pos2:=[[0,0,20,0,-21,299],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CASE 2:
      irbtype:="IRB6400/2.8_120";
      homepos:=[[0,0,0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax1_pos1:=[[-130,69,10,0,-10,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax1_pos2:=[[140,69,10,0,-10,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax2_pos1:=[[0,64,0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax2_pos2:=[[0,-64,0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax3_pos1:=[[0,0,64,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax3_pos2:=[[0,0,-27,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax4_pos1:=[[0,0,0,140,-90,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax4_pos2:=[[0,0,0,-140,-90,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax5_pos1:=[[0,0,0,0,60,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax5_pos2:=[[0,0,0,0,-90,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax6_pos1:=[[0,0,20,0,-21,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax6_pos2:=[[0,0,20,0,-21,299],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CASE 3:
      irbtype:="IRB6400/3.0_75";
      homepos:=[[0,0,0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax1_pos1:=[[-130,69,10,0,-10,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax1_pos2:=[[140,69,10,0,-10,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax2_pos1:=[[0,64,0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax2_pos2:=[[0,-64,0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax3_pos1:=[[0,0,64,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax3_pos2:=[[0,0,-27,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax4_pos1:=[[0,0,0,140,-90,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax4_pos2:=[[0,0,0,-140,-90,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax5_pos1:=[[0,0,0,0,60,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax5_pos2:=[[0,0,0,0,-90,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax6_pos1:=[[0,0,20,0,-21,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax6_pos2:=[[0,0,20,0,-21,299],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CASE 4:
      irbtype:="IRB6400/2.25_PE75";
      homepos:=[[0,0,0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax1_pos1:=[[-130,69,10,0,-10,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax1_pos2:=[[140,69,10,0,-10,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax2_pos1:=[[0,64,0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax2_pos2:=[[0,-64,0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax3_pos1:=[[0,0,64,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax3_pos2:=[[0,0,-27,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax4_pos1:=[[0,0,0,140,-90,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax4_pos2:=[[0,0,0,-140,-90,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax5_pos1:=[[0,0,0,0,60,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax5_pos2:=[[0,0,0,0,-90,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax6_pos1:=[[0,0,20,0,-21,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax6_pos2:=[[0,0,20,0,-21,299],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CASE 5:
      irbtype:="IRB6400/S2.9_120";
      homepos:=[[0,60,60,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax1_pos1:=[[-130,60.84,54.34,0,-56.21,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax1_pos2:=[[140,60.84,54.34,0,-56.21,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax2_pos1:=[[0,117.55,87.45,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax2_pos2:=[[0,39.38,87.45,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax3_pos1:=[[0,117.55,123.07,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax3_pos2:=[[0,117.55,60,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax4_pos1:=[[0,117.55,87.45,140,-90,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax4_pos2:=[[0,117.55,87.45,-140,-90,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax5_pos1:=[[0,117.55,87.45,0,60,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax5_pos2:=[[0,117.55,87.45,0,-90,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax6_pos1:=[[0,117.55,87.45,0,90,295],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax6_pos2:=[[0,117.55,87.45,0,90,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    ENDTEST
    TPErase;
  IF init=TRUE THEN
    TPWrite "Braketest program for";
    TPWrite irbtype;
    TPWrite " ";
    TPWrite "Choose the load mounted on the arm";
    TPWrite "NOT the load of the Config List";
    TPReadFK answer2,"TEST LOAD?","75kg","120kg","150kg","175kg","More";
    init:=FALSE;
   ENDIF
    TEST answer2
    CASE 1:
      currload:=load_75;
    CASE 2:
      currload:=load_120;
    CASE 3:
      currload:=load_150;
    CASE 4:
      currload:=load_175;
    CASE 5:
      TPErase;
      TPWrite "Choose the load mounted on the arm";
      TPWrite "NOT the load of the Config List";
      TPReadFK answer2,"TEST LOAD?","200kg","","","","No";
      TEST answer2
      CASE 1:
        currload:=load_200;
      CASE 5:
        currload:=tool0;
      ENDTEST
    ENDTEST
     Routine_diff;
     Incr axisno;
     MoveAbsJ homepos,v1000,fine,currload;
       TEST axisno
      CASE 1:
        routine_ax1;
      CASE 2:
        routine_ax2;
      CASE 3:
        routine_ax3;
      CASE 4:
        routine_ax4;
      CASE 5:
        routine_ax5;
      CASE 6:
        routine_ax6;
      DEFAULT:
        Clear axisno;
        Write_diff;
         WaitTime 60;
         Stop;
      ENDTEST
  ENDPROC

   PROC routine_ax1()
    MoveAbsJ ax1_pos2,v1000,z5,currload;
     MoveAbsJ ax1_pos1,v5000,z5,currload;
       TPWrite "qstop/ax1";
        targ1:=CJointT_PreQS();
         QStopExit;
    ENDPROC     

   PROC routine_ax2()
    MoveAbsJ ax2_pos2,v1000,z5,currload;
     MoveAbsJ ax2_pos1,v5000,z5,currload;
       TPWrite "qstop/ax2";
        targ1:=CJointT_PreQS();
         QStopExit;
    ENDPROC     

   PROC routine_ax3()
    MoveAbsJ ax3_pos2,v1000,z5,currload;
     MoveAbsJ ax3_pos1,v5000,z5,currload;
       TPWrite "qstop/ax3";
        targ1:=CJointT_PreQS();
         QStopExit;
    ENDPROC     

   PROC routine_ax4()
    MoveAbsJ ax4_pos2,v1500,z5,currload;
     MoveAbsJ ax4_pos1,v5000,z5,currload;
       TPWrite "qstop/ax4";
        targ1:=CJointT_PreQS();
         QStopExit;
    ENDPROC     

   PROC routine_ax5()
    MoveAbsJ ax5_pos2,v1000,z5,currload;
     MoveAbsJ ax5_pos1,v5000,z5,currload;
       TPWrite "qstop/ax5";
        targ1:=CJointT_PreQS();
         QStopExit;
    ENDPROC     

   PROC routine_ax6()
    MoveAbsJ ax6_pos2,v1000,z5,currload;
     MoveAbsJ ax6_pos1,v5000,z5,currload;
       TPWrite "qstop/ax6";
        targ1:=CJointT_PreQS();
         QStopExit;
    ENDPROC     

  PROC routine_diff()
    targ2:=CJointT_PreQS();
    TEST axisno
    CASE 1:
      targdiff.robax.rax_1:=targ2.robax.rax_1-targ1.robax.rax_1;
    CASE 2:
      targdiff.robax.rax_2:=targ2.robax.rax_2-targ1.robax.rax_2;
    CASE 3:
      targdiff.robax.rax_3:=targ2.robax.rax_3-targ1.robax.rax_3;
    CASE 4:
      targdiff.robax.rax_4:=targ2.robax.rax_4-targ1.robax.rax_4;
    CASE 5:
      targdiff.robax.rax_5:=targ2.robax.rax_5-targ1.robax.rax_5;
    CASE 6:
      targdiff.robax.rax_6:=targ2.robax.rax_6-targ1.robax.rax_6;
    ENDTEST
  ENDPROC

  PROC write_diff()
    targdiff.robax.rax_1:=Abs(targdiff.robax.rax_1);
    targdiff.robax.rax_1:=Round(targdiff.robax.rax_1\Dec:=1);
    targdiff.robax.rax_2:=Abs(targdiff.robax.rax_2);
    targdiff.robax.rax_2:=Round(targdiff.robax.rax_2\Dec:=1);
    targdiff.robax.rax_3:=Abs(targdiff.robax.rax_3);
    targdiff.robax.rax_3:=Round(targdiff.robax.rax_3\Dec:=1);
    targdiff.robax.rax_4:=Abs(targdiff.robax.rax_4);
    targdiff.robax.rax_4:=Round(targdiff.robax.rax_4\Dec:=1);
    targdiff.robax.rax_5:=Abs(targdiff.robax.rax_5);
    targdiff.robax.rax_5:=Round(targdiff.robax.rax_5\Dec:=1);
    targdiff.robax.rax_6:=Abs(targdiff.robax.rax_6);
    targdiff.robax.rax_6:=Round(targdiff.robax.rax_6\Dec:=1);
    TPErase;
    TPWrite " ";
    TPWrite "This list will be Viewed for 1 Minute";
    TPWrite "============================";
    TPWrite "Axis 1 = "\Num:=targdiff.robax.rax_1;
    TPWrite "Axis 2 = "\Num:=targdiff.robax.rax_2;
    TPWrite "Axis 3 = "\Num:=targdiff.robax.rax_3;
    TPWrite "Axis 4 = "\Num:=targdiff.robax.rax_4;
    TPWrite "Axis 5 = "\Num:=targdiff.robax.rax_5;
    TPWrite "Axis 6 = "\Num:=targdiff.robax.rax_6;
    TPWrite "=============================";
    TPWrite "Viewed also in Operator Output & Input";
  ENDPROC
ENDMODULE

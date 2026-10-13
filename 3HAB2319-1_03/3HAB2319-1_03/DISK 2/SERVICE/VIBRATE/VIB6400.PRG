%%%
  VERSION:1
  LANGUAGE:ENGLISH
%%%

MODULE SPICEVIB
  !COPYRIGHT 1994 ABB ROBOTICS PRODUCTS AB
  !1995-05-08
!#####################################################
!Revision Notes:
!RW2.0 Required
!MoveJ changed to MoveAbsJ
!SPICE Update     95-10-25/SLT
!2.8_120 dip degrees added to all models 95-11-15/SLT
!lash1-4 changed from rob to jointtarget 95-11-25/SLT
!Proc std_lash shelf_lash added    95-12-01/SLT
!#####################################################

  VAR num answer;
  VAR bool flag;
  VAR string irbtype;
  PERS tooldata load_75:=[TRUE,[[0,0,0],[1,0,0,0]],[75,[150,0,250],[1,0,0,0],0,0,0]];
  PERS tooldata load_120:=[TRUE,[[0,0,0],[1,0,0,0]],[120,[150,0,250],[1,0,0,0],0,0,0]];
  PERS tooldata load_150:=[TRUE,[[0,0,0],[1,0,0,0]],[150,[150,0,250],[1,0,0,0],0,0,0]];
  PERS tooldata currload:=[TRUE,[[0,0,0],[1,0,0,0]],[75,[150,0,250],[1,0,0,0],0,0,0]];
  VAR jointtarget ax4_dip1;
  VAR jointtarget ax4_dip2;
  VAR jointtarget ax5_dip1;
  VAR jointtarget ax5_dip2;
  VAR jointtarget ax6_dip1;
  VAR jointtarget ax6_dip2;
  VAR jointtarget lash1;
  VAR jointtarget lash2;
  VAR jointtarget lash3;
  VAR jointtarget lash4;
  VAR robtarget shelf_lash1;
  VAR robtarget shelf_lash2;
  VAR robtarget shelf_lash3;
  VAR robtarget shelf_lash4;
  VAR robtarget loadpos1;

  PROC haupt()
    main;
  ENDPROC

  PROC main()
    TPErase;
    TPWrite "Dip and back lash test program";
    TPReadFK answer,"Select type of IRB 6400/...","2.4_120","2.4_150","","2.8_120","More";
    TEST answer
    CASE 1:
      irbtype:="IRB6400/2.4_120";
      currload:=load_120;
      ax4_dip1:=[[0,50,25,-90,-90,65],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax4_dip2:=[[0,50,25,-89,-90,65],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax5_dip1:=[[0,50,25,0,-27,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax5_dip2:=[[0,50,25,0,-26,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax6_dip1:=[[0,50,25,-90,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax6_dip2:=[[0,50,25,-90,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      lash1:=[[0,65,32,0,-116,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      lash2:=[[0,65,32,-90,-90,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      lash3:=[[0,65,32,90,90,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      lash4:=[[0,65,23,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      loadpos1:=[[2462.22,24.64,704.56],[0.712408,-0.013443,0.701636,-0.001385],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CASE 2:
      irbtype:="IRB6400/2.4_150";
      currload:=load_150;
      ax4_dip1:=[[0,50,25,-90,-90,65],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax4_dip2:=[[0,50,25,-89,-90,65],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax5_dip1:=[[0,50,25,0,-27,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax5_dip2:=[[0,50,25,0,-26,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax6_dip1:=[[0,50,25,-90,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax6_dip2:=[[0,50,25,-90,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      lash1:=[[0,65,32,0,-116,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      lash2:=[[0,65,32,-90,-90,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      lash3:=[[0,65,32,90,90,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      lash4:=[[0,65,23,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      loadpos1:=[[2462.22,24.64,704.56],[0.712408,-0.013443,0.701636,-0.001385],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
   ! CASE 3:
     ! irbtype:="IRB6400/2.4_175";
     ! currload:=load_175;
     ! ax4_dip1:=[[0,50,25,-90,-90,65],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
     ! ax4_dip2:=[[0,50,25,-89,-90,65],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
     ! ax5_dip1:=[[0,50,25,0,-27,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
     ! ax5_dip2:=[[0,50,25,0,-26,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
     ! ax6_dip1:=[[0,50,25,-90,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
     ! ax6_dip2:=[[0,50,25,-90,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
     ! lash1:=[[0,65,32,0,-116,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
     ! lash2:=[[0,65,32,-90,-90,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
     ! lash3:=[[0,65,32,90,90,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
     ! lash4:=[[0,65,23,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
     ! loadpos1:=[[2462.22,24.64,704.56],[0.712408,-0.013443,0.701636,-0.001385],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CASE 4:
      irbtype:="IRB6400/2.8_120";
      currload:=load_120;
      ax4_dip1:=[[0,50,25,-90,-90,65],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax4_dip2:=[[0,50,25,-89,-90,65],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax5_dip1:=[[0,50,25,0,-27,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax5_dip2:=[[0,50,25,0,-26,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax6_dip1:=[[0,50,25,-90,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax6_dip2:=[[0,50,25,-90,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      lash1:=[[0,65,32,0,-116,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      lash2:=[[0,65,32,-90,-90,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      lash3:=[[0,65,32,90,90,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      lash4:=[[0,65,23,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      loadpos1:=[[2817.95,8.86,685.91],[0.708797,-0.005071,0.705363,-0.006707],[0,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CASE 5:
      more_types;
    ENDTEST
    test_routine;
  ENDPROC

  PROC more_types()
    TPErase;
    TPReadFK answer,"Select type of IRB 6400/...","2.2_P75","S2.9_120","3.0_75","","Exit";
    TEST answer
    CASE 1:
      irbtype:="IRB6400/2.25_PE75";
      currload:=load_75;
      ax4_dip1:=[[0,50,25,-90,-90,65],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax4_dip2:=[[0,50,25,-89,-90,65],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax5_dip1:=[[0,50,25,0,-27,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax5_dip2:=[[0,50,25,0,-26,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax6_dip1:=[[0,50,25,-90,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax6_dip2:=[[0,50,25,-90,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      lash1:=[[0,65,32,0,-116,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      lash2:=[[0,65,32,-90,-90,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      lash3:=[[0,65,32,90,90,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      lash4:=[[0,65,23,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      loadpos1:=[[2154.84,-1.84,964.13],[0.997342,-0.001932,0.07269,0.004638],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CASE 2:
      irbtype:="IRB6400/S2.9_120";
      currload:=load_120;
      ax4_dip1:=[[0,50,25,-90,-90,65],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax4_dip2:=[[0,50,25,-89,-90,65],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax5_dip1:=[[0,50,25,0,-27,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax5_dip2:=[[0,50,25,0,-26,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax6_dip1:=[[0,50,25,-90,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax6_dip2:=[[0,50,25,-90,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
       shelf_lash1:=[[-40.28,2293.14,-1130.32],[0.635214,-
0.297205,0.294845,0.64903],[1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
       shelf_lash2:=[[-236.37,2107.04,-1332.01],[0.05089,-0.721915,-0.123663,0.678938],[1,-
2,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
       shelf_lash3:=[[2398.7,201.53,1202.39],[0.067567,-0.066953,-0.703695,-0.704107],[0,1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
       shelf_lash4:=[[-39.57,2225.9,-1259.98],[0.077617,-
0.705998,0.699419,0.079725],[1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      loadpos1:=[[2398.54,202.56,1202.25],[0.06781,-0.066874,-0.703705,-0.70408],[0,1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CASE 3:
      irbtype:="IRB6400/3.0_75";
      currload:=load_75;
      ax4_dip1:=[[0,50,25,-90,-90,65],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax4_dip2:=[[0,50,25,-89,-90,65],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax5_dip1:=[[0,50,25,0,-27,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax5_dip2:=[[0,50,25,0,-26,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax6_dip1:=[[0,50,25,-90,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      ax6_dip2:=[[0,50,25,-90,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      lash1:=[[0,65,32,0,-116,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      lash2:=[[0,65,32,-90,-90,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      lash3:=[[0,65,32,90,90,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      lash4:=[[0,65,23,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
      loadpos1:=[[2817.97,8.76,681.85],[0.701491,0.003605,0.712667,0.002025],[0,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CASE 5:
      main;
    ENDTEST
    test_routine;
  ENDPROC

  PROC test_routine()
    flag:=TRUE;
    WHILE flag DO
      TPErase;
      TPWrite "Test routines for ";
      TPWrite irbtype;
      TPReadFK answer,"Select operation...","Dip","Lash","Tstload","","Exit";
      TEST answer
      CASE 1:
        dip_test;
      CASE 2:
        lash;
      CASE 3:
        testload;
      CASE 5:
        flag:=FALSE;
      ENDTEST
    ENDWHILE
  ENDPROC

  PROC dip_test()
    TPErase;
    TPReadFK answer,"Dip test on axis 4, 5 or 6..","Ax4","Ax5","Ax6","","Exit";
    TEST answer
    CASE 1:
      MoveAbsJ ax4_dip1,v300,fine,tool0;
      MoveAbsJ ax4_dip2,v500,fine,tool0;
    CASE 2:
      MoveAbsJ ax5_dip1,v300,fine,tool0;
      MoveAbsJ ax5_dip2,v500,fine,tool0;
    CASE 3:
      MoveAbsJ ax6_dip1,v300,fine,tool0;
      MoveAbsJ ax6_dip2,v500,fine,tool0;
    CASE 5:
      RETURN;
    ENDTEST
  ENDPROC

  PROC lash()
    TPErase;
    TPReadFK answer,"Lash test on IRB/6400","Std.","Shelf","","","Exit";
    TEST answer
    CASE 1:
      std_lash; 
    CASE 2:
      shelf_lash;
    CASE 5:
      RETURN;
    ENDTEST
  ENDPROC

  PROC std_lash()
    TPErase;
    TPReadFK answer,"Test lash on axis 1 to 5..","Yes","","","","Exit";
    TEST answer
    CASE 1:
    TPReadFK answer,"Pos.1 (tool pos.)","Start","","","","";
      MoveAbsJ lash1,v300,fine,tool0;
      TPReadFK answer,"Pos. 2 (Axes 4 and 5)","Start","","","","";
      MoveAbsJ lash2,v300,fine,tool0;
      TPReadFK answer,"Pos. 3 (Axes 4 and 5)","Start","","","","";
      MoveAbsJ lash3,v300,fine,tool0;
      TPReadFK answer,"Pos. 4 (Axes 1, 3 and 5)","Start","","","","";
      MoveAbsJ lash4,v300,fine,tool0;
      TPReadFK answer,"Pos. 1 (tool pos.)","Start","","","","";
      MoveAbsJ lash1,v300,fine,tool0;
    CASE 5:
      RETURN;
    ENDTEST
  ENDPROC

 PROC shelf_lash()
    TPErase;
    TPReadFK answer,"Test lash on axis 1 to 5..","Yes","","","","Exit";
    TEST answer
    CASE 1:
      TPReadFK answer,"Pos.1 (tool pos.)","Start","","","","";
      MoveJ shelf_lash1,v300,fine,tool0;
      TPReadFK answer,"Pos. 2 (Axes 4 and 5)","Start","","","","";
      MoveJ shelf_lash2,v300,fine,tool0;
      TPReadFK answer,"Pos. 3 (Axes 4 and 5)","Start","","","","";
      MoveJ shelf_lash3,v300,fine,tool0;
      TPReadFK answer,"Pos. 4 (Axes 1, 3 and 5)","Start","","","","";
      MoveJ shelf_lash4,v300,fine,tool0;
      TPReadFK answer,"Back to pos. 1 (tool pos.)","Start","","","","";
      MoveJ shelf_lash1,v300,fine,tool0;
    CASE 5:
      RETURN;
    ENDTEST
  ENDPROC

  PROC testload()
    TPErase;
    TPReadFK answer,"Move to testload mounting pos.","Yes","","","","Exit";
    TEST answer
    CASE 1:
    TPReadFK answer,"Move to testload...","Start","","","","";
      MoveJ [[1995.28,-2.39,673.39],[0.715588,-0.000634,0.698521,-0.00152],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],v500,fine,tool0;
    CASE 5:
      RETURN;
    ENDTEST
  ENDPROC
ENDMODULE


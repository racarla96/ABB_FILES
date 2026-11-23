%%%
  VERSION:1
  LANGUAGE:ENGLISH
%%%

MODULE motor
  !
  !COPYRIGHT 1994 ABB ROBOTICS PRODUCTS AB
  !1994-12-08
  LOCAL PROC step_man_auto(
    string mecunt,
    num axis)

    VAR num freq:=0;
    VAR num loop:=0;
    VAR num next:=0;

    WHILE (freq<>1) AND (freq<>2) DO
    TPReadFK freq,"Mode:","Manual","Auto","","","Quit";
      IF freq=5 THEN
        RETURN;
      ENDIF
    ENDWHILE
    IF freq=1 THEN
      loop:=1;
    ELSE
    TPReadNum loop,"Number of loops (-1 forever):";
    ENDIF
    WHILE loop<>0 DO
      FOR tstep FROM 1 TO 6 DO
        SetCurrRef\MechUnit:=mecunt,axis,tstep;
        IF freq=1 THEN
          next:=0;
          WHILE next<>1 DO
	  TPReadFK next,"Loop.","Next","","","","Quit";
            IF next=5 THEN
              ResetCurrRef;
              RETURN;
            ENDIF
          ENDWHILE
        ELSE
          WaitTime 1;
        ENDIF
      ENDFOR
      IF loop>0 THEN
        loop:=loop-1;
      ENDIF
    ENDWHILE
    ResetCurrRef;
  ERROR
    TEST ERRNO
    CASE ERR_AXIS_PAR:
    TPReadNum axis,"Chose axis number (0 to QUIT):";
    CASE ERR_STEP_PAR:
      TPWrite ("Step not valid");
      RETURN;
    DEFAULT:
      ResetCurrRef;
      RETURN;
    ENDTEST
    RETRY;
  ENDPROC

  PROC drvutst()
    VAR num i;
    VAR num fkchoise:=4;
    VAR bool result:=TRUE;
    VAR num axis:=1;
    VAR num listno:=0;
    VAR string fktxt{5}:=["","","","MORE","QUIT"];
    VAR string mec_unt:="";

    TPErase;
    WHILE (fkchoise=4) AND (fktxt{4}="MORE") DO
      IF mec_unt="" THEN
        i:=1;
      ELSE
        fktxt{1}:=mec_unt;
        i:=2;
      ENDIF
      fktxt{4}:="";
      result:=GetNextMechUnit(listno,fktxt{i});
      WHILE result AND (i<4) DO
        i:=i+1;
        result:=GetNextMechUnit(listno,fktxt{i});
      ENDWHILE
      IF result THEN
        mec_unt:=fktxt{4};
        fktxt{4}:="MORE";
      ELSE
        IF NOT (mec_unt="") THEN
          listno:=0;
          fktxt{4}:="MORE";
        ENDIF
        mec_unt:="";
      ENDIF
      TPReadFK fkchoise,"Chose mechanical unit.",fktxt{1},fktxt{2},fktxt{3},fktxt{4},"QUIT";
      IF fkchoise>=5 THEN
        RETURN;
      ENDIF
    ENDWHILE
    TPReadNum axis,"Chose axis number (0 to QUIT):";
    WHILE (axis>=1) DO
      step_man_auto fktxt{fkchoise},axis;
      TPReadNum axis,"Chose axis number (0 to QUIT):";
    ENDWHILE
  ERROR
    TEST ERRNO
    CASE ERR_AXIS_PAR:
    TPReadNum axis,"Chose axis number (0 to QUIT):";
    DEFAULT:
      RETURN;
    ENDTEST
    RETRY;
  ENDPROC

  PROC commutationtst()
    VAR num i;
    VAR num fkchoise:=4;
    VAR bool result:=TRUE;
    VAR num axis:=1;
    VAR num listno:=0;
    VAR string fktxt{5}:=["","","","MORE","QUIT"];
    VAR string mec_unt:="";

    TPErase;
    WHILE (fkchoise=4) AND (fktxt{4}="MORE") DO
      IF mec_unt="" THEN
        i:=1;
      ELSE
        fktxt{1}:=mec_unt;
        i:=2;
      ENDIF
      fktxt{4}:="";
      result:=GetNextMechUnit(listno,fktxt{i});
      WHILE result AND (i<4) DO
        i:=i+1;
        result:=GetNextMechUnit(listno,fktxt{i});
      ENDWHILE
      IF result THEN
        mec_unt:=fktxt{4};
        fktxt{4}:="MORE";
      ELSE
        IF NOT (mec_unt="") THEN
          listno:=0;
          fktxt{4}:="MORE";
        ENDIF
        mec_unt:="";
      ENDIF
      TPReadFK fkchoise,"Chose mechanical unit.",fktxt{1},fktxt{2},fktxt{3},fktxt{4},"QUIT";
      IF fkchoise>=5 THEN
        RETURN;
      ENDIF
    ENDWHILE
    TPReadNum axis,"Chose axis number (0 to QUIT):";
    WHILE (axis>=1) DO
      SetCurrRef\MechUnit:=fktxt{fkchoise},axis,3;
      TPReadNum axis,"Chose axis number (0 to QUIT):";
      ResetCurrRef;
    ENDWHILE
    ResetCurrRef;
  ERROR
    TEST ERRNO
    CASE ERR_AXIS_PAR:
    TPReadNum axis,"Chose axis number (0 to QUIT):";
    DEFAULT:
      RETURN;
    ENDTEST
    RETRY;
  ENDPROC

  PROC haupt()
    main;
  ENDPROC

  PROC main()
    VAR num fkchoise:=1;

    WHILE fkchoise<5 DO
    TPReadFK fkchoise,"Test method.","drives","com.off","","","QUIT";
      TEST fkchoise
      CASE 1:
        drvutst;
      CASE 2:
        commutationtst;
      DEFAULT:
      ENDTEST
    ENDWHILE
    EXIT;
  ENDPROC
ENDMODULE


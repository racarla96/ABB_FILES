%%%
  VERSION:1
  LANGUAGE:ENGLISH
%%%

MODULE digio1
  CONST dionum on:=1;
  CONST dionum off:=0;
  VAR num i;

  PROC main()
    FOR i FROM 1 TO 8 DO
      digtest do1,di1,"Fel do1-di1";
      digtest do2,di2,"Fel do2-di2";
      digtest do3,di3,"Fel do3-di3";
      digtest do4,di4,"Fel do4-di4";
      digtest do5,di5,"Fel do5-di5";
      digtest do6,di6,"Fel do6-di6";
      digtest do7,di7,"Fel do7-di7";
      digtest do8,di8,"Fel do8-di8";
      digtest do9,di9,"Fel do9-di9";
      digtest do10,di10,"Fel do10-di10";
      digtest do11,di11,"Fel do11-di11";
      digtest do12,di12,"Fel do12-di12";
      digtest do13,di13,"Fel do13-di13";
      digtest do14,di14,"Fel do14-di14";
      digtest do15,di15,"Fel do15-di15";
      digtest do16,di16,"Fel do16-di16";
      TPWrite "Test DIGIO1 cykel "\Num:=i;
    ENDFOR
    TPWrite "********Test OK********";
    WaitTime 3;
    EXIT;
  ENDPROC

  PROC digtest(
    VAR signaldo digout,
    VAR signaldi digin,
    string errstring)

    SetDO digout,on;
    WaitTime 0.1;
    IF DInput(digin)<>on THEN
      TPWrite errstring;
      WaitTime 3;
      EXIT;
    ENDIF
    SetDO digout,off;
  ENDPROC
ENDMODULE


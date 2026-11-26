%%%
  VERSION:1
  LANGUAGE:ENGLISH
%%%

MODULE digio6
  CONST dionum on:=1;
  CONST dionum off:=0;
  VAR num i;

  PROC main()
    FOR i FROM 1 TO 8 DO
      digtest do81,di81,"Fel do1-di1";
      digtest do82,di82,"Fel do2-di2";
      digtest do83,di83,"Fel do3-di3";
      digtest do84,di84,"Fel do4-di4";
      digtest do85,di85,"Fel do5-di5";
      digtest do86,di86,"Fel do6-di6";
      digtest do87,di87,"Fel do7-di7";
      digtest do88,di88,"Fel do8-di8";
      digtest do89,di89,"Fel do9-di9";
      digtest do90,di90,"Fel do10-di10";
      digtest do91,di91,"Fel do11-di11";
      digtest do92,di92,"Fel do12-di12";
      digtest do93,di93,"Fel do13-di13";
      digtest do94,di94,"Fel do14-di14";
      digtest do95,di95,"Fel do15-di15";
      digtest do96,di96,"Fel do16-di16";
      TPWrite "Test DIGIO6 cykel "\Num:=i;
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


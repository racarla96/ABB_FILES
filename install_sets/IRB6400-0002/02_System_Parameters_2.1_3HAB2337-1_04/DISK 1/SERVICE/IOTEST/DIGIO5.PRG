%%%
  VERSION:1
  LANGUAGE:ENGLISH
%%%

MODULE digio5
  CONST dionum on:=1;
  CONST dionum off:=0;
  VAR num i;

  PROC main()
    FOR i FROM 1 TO 8 DO
      digtest do65,di65,"Fel do1-di1";
      digtest do66,di66,"Fel do2-di2";
      digtest do67,di67,"Fel do3-di3";
      digtest do68,di68,"Fel do4-di4";
      digtest do69,di69,"Fel do5-di5";
      digtest do70,di70,"Fel do6-di6";
      digtest do71,di71,"Fel do7-di7";
      digtest do72,di72,"Fel do8-di8";
      digtest do73,di73,"Fel do9-di9";
      digtest do74,di74,"Fel do10-di10";
      digtest do75,di75,"Fel do11-di11";
      digtest do76,di76,"Fel do12-di12";
      digtest do77,di77,"Fel do13-di13";
      digtest do78,di78,"Fel do14-di14";
      digtest do79,di79,"Fel do15-di15";
      digtest do80,di80,"Fel do16-di16";
      TPWrite "Test DIGIO5 cykel "\Num:=i;
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


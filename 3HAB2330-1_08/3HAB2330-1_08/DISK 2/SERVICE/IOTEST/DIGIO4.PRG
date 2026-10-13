%%%
  VERSION:1
  LANGUAGE:ENGLISH
%%%

MODULE digio4
  CONST dionum on:=1;
  CONST dionum off:=0;
  VAR num i;

  PROC main()
    FOR i FROM 1 TO 8 DO
      digtest do49,di49,"Fel do1-di1";
      digtest do50,di50,"Fel do2-di2";
      digtest do51,di51,"Fel do3-di3";
      digtest do52,di52,"Fel do4-di4";
      digtest do53,di53,"Fel do5-di5";
      digtest do54,di54,"Fel do6-di6";
      digtest do55,di55,"Fel do7-di7";
      digtest do56,di56,"Fel do8-di8";
      digtest do57,di57,"Fel do9-di9";
      digtest do58,di58,"Fel do10-di10";
      digtest do59,di59,"Fel do11-di11";
      digtest do60,di60,"Fel do12-di12";
      digtest do61,di61,"Fel do13-di13";
      digtest do62,di62,"Fel do14-di14";
      digtest do63,di63,"Fel do15-di15";
      digtest do64,di64,"Fel do16-di16";
      TPWrite "Test DIGIO4 cykel "\Num:=i;
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


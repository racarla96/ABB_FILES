%%%
  VERSION:1
  LANGUAGE:ENGLISH
%%%

MODULE digio3
  CONST dionum on:=1;
  CONST dionum off:=0;
  VAR num i;

  PROC main()
    FOR i FROM 1 TO 8 DO
      digtest do33,di33,"Fel do1-di1";
      digtest do34,di34,"Fel do2-di2";
      digtest do35,di35,"Fel do3-di3";
      digtest do36,di36,"Fel do4-di4";
      digtest do37,di37,"Fel do5-di5";
      digtest do38,di38,"Fel do6-di6";
      digtest do39,di39,"Fel do7-di7";
      digtest do40,di40,"Fel do8-di8";
      digtest do41,di41,"Fel do9-di9";
      digtest do42,di42,"Fel do10-di10";
      digtest do43,di43,"Fel do11-di11";
      digtest do44,di44,"Fel do12-di12";
      digtest do45,di45,"Fel do13-di13";
      digtest do46,di46,"Fel do14-di14";
      digtest do47,di47,"Fel do15-di15";
      digtest do48,di48,"Fel do16-di16";
      TPWrite "Test DIGIO3 cykel "\Num:=i;
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


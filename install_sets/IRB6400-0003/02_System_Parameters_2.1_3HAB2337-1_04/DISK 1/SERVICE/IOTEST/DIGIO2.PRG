%%%
  VERSION:1
  LANGUAGE:ENGLISH
%%%

MODULE digio2
  CONST dionum on:=1;
  CONST dionum off:=0;
  VAR num i;

  PROC main()
    FOR i FROM 1 TO 8 DO
      digtest do17,di17,"Fel do1-di1";
      digtest do18,di18,"Fel do2-di2";
      digtest do19,di19,"Fel do3-di3";
      digtest do20,di20,"Fel do4-di4";
      digtest do21,di21,"Fel do5-di5";
      digtest do22,di22,"Fel do6-di6";
      digtest do23,di23,"Fel do7-di7";
      digtest do24,di24,"Fel do8-di8";
      digtest do25,di25,"Fel do9-di9";
      digtest do26,di26,"Fel do10-di10";
      digtest do27,di27,"Fel do11-di11";
      digtest do28,di28,"Fel do12-di12";
      digtest do29,di29,"Fel do13-di13";
      digtest do30,di30,"Fel do14-di14";
      digtest do31,di31,"Fel do15-di15";
      digtest do32,di32,"Fel do16-di16";
      TPWrite "Test DIGIO2 cykel "\Num:=i;
    ENDFOR
    TPWrite "*******Test OK*******";
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


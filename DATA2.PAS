unit data2;

{ ============================================================================
  GIEŁDA — prognozy / prognosis screens.  Original: DATA2.PAS,
  1999-02-11 18:29.  Reconstructed from GIELDA.EXE debug info + disassembly.
  ============================================================================ }

interface

uses Crt;

procedure progmenu;
procedure agros_prog(czujnik : longint; var progn : longint);
procedure big_prog(czujnik : longint; var progn : longint);
procedure bph_prog(czujnik : longint; var progn : longint);
procedure bsk_prog(czujnik : longint; var progn : longint);
procedure kety_prog(czujnik : longint; var progn : longint);
procedure optimus_prog(czujnik : longint; var progn : longint);
procedure wedel_prog(czujnik : longint; var progn : longint);
procedure zywiec_prog(czujnik : longint; var progn : longint);

implementation

{ ------------------------------------------------------------------ line 17 }
procedure progmenu;
begin
  TextColor(3);
  TextBackground(0);
  ClrScr;
  WriteLn('╔═════════════════════════════════════════════════════════════════════════════╗');
  WriteLn('║                      **********************************                     ║');
  WriteLn('║                          █▓▒░░░░░░░░░░░░░░░░░░░░▒▓█                         ║');
  WriteLn('║  P  R  O  G  N  O  Z  Y  █▓▒░ » GIELDA V.1.0 « ░▒▓█  P  R  O  G  N  O  Z  Y ║');
  WriteLn('║                          █▓▒░ T.J.Softland (R) ░▒▓█                         ║');
  WriteLn('║                          █▓▒░░░░░░░░░░░░░░░░░░░░▒▓█                         ║');
  WriteLn('║                      **********************************                     ║');
  WriteLn('╠════════════╦════════════════════════════════════════════════════════════════╣');
  WriteLn('║   AGROS    ║                                                                ║');
  WriteLn('╠════════════╬════════════════════════════════════════════════════════════════╣');
  WriteLn('║    BIG     ║                                                                ║');
  WriteLn('╠════════════╬════════════════════════════════════════════════════════════════╣');
  WriteLn('║    BPH     ║                                                                ║');
  WriteLn('╠════════════╬════════════════════════════════════════════════════════════════╣');
  WriteLn('║    BSK     ║                                                                ║');
  WriteLn('╠════════════╬════════════════════════════════════════════════════════════════╣');
  WriteLn('║    KĘTY    ║                                                                ║');
  WriteLn('╠════════════╬════════════════════════════════════════════════════════════════╣');
  WriteLn('║   OPTIMUS  ║                                                                ║');
  WriteLn('╠════════════╬════════════════════════════════════════════════════════════════╣');
  WriteLn('║   WEDEL    ║                                                                ║');
  WriteLn('╠════════════╬════════════════════════════════════════════════════════════════╣');
  WriteLn('║   ŻYWIEC   ║                                                                ║');
  WriteLn('╚════════════╩════════════════════════════════════════════════════════════════╝');
end;

{ ------------------------------------------------------------------ AGROS }
procedure agros_prog(czujnik : longint; var progn : longint);
label ponow;
var risk : integer;
    juz  : boolean;
begin
  juz := false;
  if progn <> 0 then
  begin
    if progn = 1 then
    begin
      GotoXY(18,9);
      TextColor(15);
      Write('Spodziewany wzrost cen !!!');
    end;
    if progn = 2 then
    begin
      GotoXY(18,9);
      TextColor(15);
      Write('Spodziewany wzrost cen !!!');
    end;
    if progn = 3 then
    begin
      GotoXY(18,9);
      TextColor(15);
      Write('Spodziewany brak zmiany cen !!!');
    end;
    if progn = 4 then
    begin
      GotoXY(18,9);
      TextColor(15);
      Write('Spodziewany spadek cen !!!');
    end;
    if progn = 5 then
    begin
      GotoXY(18,9);
      TextColor(15);
      Write('Spodziewany spadek cen !!!');
    end;
    juz := true;
  end
  else
  begin
ponow:
    if czujnik = 1 then
    begin
      risk := Random(3);
      if risk = 2 then
      begin
        czujnik := Random(5) + 1;
        juz := false;
      end
      else
      begin
        GotoXY(18,9);
        TextColor(15);
        Write('Spodziewany wzrost cen !!!');
        progn := 1;
        juz := true;
      end;
    end;
    if czujnik = 2 then
    begin
      risk := Random(3);
      if risk = 2 then
      begin
        czujnik := Random(5) + 1;
        juz := false;
      end
      else
      begin
        GotoXY(18,9);
        TextColor(15);
        Write('Spodziewany wzrost cen !!!');
        progn := 2;
        juz := true;
      end;
    end;
    if czujnik = 3 then
    begin
      risk := Random(3);
      if risk = 2 then
      begin
        czujnik := Random(5) + 1;
        juz := false;
      end
      else
      begin
        GotoXY(18,9);
        TextColor(15);
        Write('Spodziewany brak zmiany cen !!!');
        progn := 3;
        juz := true;
      end;
    end;
    if czujnik = 4 then
    begin
      risk := Random(3);
      if risk = 2 then
      begin
        czujnik := Random(5) + 1;
        juz := false;
      end
      else
      begin
        GotoXY(18,9);
        TextColor(15);
        Write('Spodziewany spadek cen !!!');
        progn := 4;
        juz := true;
      end;
    end;
    if czujnik = 5 then
    begin
      risk := Random(3);
      if risk = 2 then
      begin
        czujnik := Random(5) + 1;
        juz := false;
      end
      else
      begin
        GotoXY(18,9);
        TextColor(15);
        Write('Spodziewany spadek cen !!!');
        progn := 5;
        juz := true;
      end;
    end;
    if juz = false then goto ponow;
  end;
end;

{ ------------------------------------------------------------------ BIG }
procedure big_prog(czujnik : longint; var progn : longint);
label ponow;
var risk : integer;
    juz  : boolean;
begin
  juz := false;
  if progn <> 0 then
  begin
    if progn = 1 then
    begin
      GotoXY(18,11);
      TextColor(15);
      Write('Spodziewany wzrost cen !!!');
    end;
    if progn = 2 then
    begin
      GotoXY(18,11);
      TextColor(15);
      Write('Spodziewany wzrost cen !!!');
    end;
    if progn = 3 then
    begin
      GotoXY(18,11);
      TextColor(15);
      Write('Spodziewany brak zmiany cen !!!');
    end;
    if progn = 4 then
    begin
      GotoXY(18,11);
      TextColor(15);
      Write('Spodziewany spadek cen !!!');
    end;
    if progn = 5 then
    begin
      GotoXY(18,11);
      TextColor(15);
      Write('Spodziewany spadek cen !!!');
    end;
    juz := true;
  end
  else
  begin
ponow:
    if czujnik = 1 then
    begin
      risk := Random(3);
      if risk = 2 then
      begin
        czujnik := Random(5) + 1;
        juz := false;
      end
      else
      begin
        GotoXY(18,11);
        TextColor(15);
        Write('Spodziewany wzrost cen !!!');
        progn := 1;
        juz := true;
      end;
    end;
    if czujnik = 2 then
    begin
      risk := Random(3);
      if risk = 2 then
      begin
        czujnik := Random(5) + 1;
        juz := false;
      end
      else
      begin
        GotoXY(18,11);
        TextColor(15);
        Write('Spodziewany wzrost cen !!!');
        progn := 2;
        juz := true;
      end;
    end;
    if czujnik = 3 then
    begin
      risk := Random(3);
      if risk = 2 then
      begin
        czujnik := Random(5) + 1;
        juz := false;
      end
      else
      begin
        GotoXY(18,11);
        TextColor(15);
        Write('Spodziewany brak zmiany cen !!!');
        progn := 3;
        juz := true;
      end;
    end;
    if czujnik = 4 then
    begin
      risk := Random(3);
      if risk = 2 then
      begin
        czujnik := Random(5) + 1;
        juz := false;
      end
      else
      begin
        GotoXY(18,11);
        TextColor(15);
        Write('Spodziewany spadek cen !!!');
        progn := 4;
        juz := true;
      end;
    end;
    if czujnik = 5 then
    begin
      risk := Random(3);
      if risk = 2 then
      begin
        czujnik := Random(5) + 1;
        juz := false;
      end
      else
      begin
        GotoXY(18,11);
        TextColor(15);
        Write('Spodziewany spadek cen !!!');
        progn := 5;
        juz := true;
      end;
    end;
    if juz = false then goto ponow;
  end;
end;

{ ------------------------------------------------------------------ BPH }
procedure bph_prog(czujnik : longint; var progn : longint);
label ponow;
var risk : integer;
    juz  : boolean;
begin
  juz := false;
  if progn <> 0 then
  begin
    if progn = 1 then
    begin
      GotoXY(18,13);
      TextColor(15);
      Write('Spodziewany wzrost cen !!!');
    end;
    if progn = 2 then
    begin
      GotoXY(18,13);
      TextColor(15);
      Write('Spodziewany wzrost cen !!!');
    end;
    if progn = 3 then
    begin
      GotoXY(18,13);
      TextColor(15);
      Write('Spodziewany brak zmiany cen !!!');
    end;
    if progn = 4 then
    begin
      GotoXY(18,13);
      TextColor(15);
      Write('Spodziewany spadek cen !!!');
    end;
    if progn = 5 then
    begin
      GotoXY(18,13);
      TextColor(15);
      Write('Spodziewany spadek cen !!!');
    end;
    juz := true;
  end
  else
  begin
ponow:
    if czujnik = 1 then
    begin
      risk := Random(3);
      if risk = 2 then
      begin
        czujnik := Random(5) + 1;
        juz := false;
      end
      else
      begin
        GotoXY(18,13);
        TextColor(15);
        Write('Spodziewany wzrost cen !!!');
        progn := 1;
        juz := true;
      end;
    end;
    if czujnik = 2 then
    begin
      risk := Random(3);
      if risk = 2 then
      begin
        czujnik := Random(5) + 1;
        juz := false;
      end
      else
      begin
        GotoXY(18,13);
        TextColor(15);
        Write('Spodziewany wzrost cen !!!');
        progn := 2;
        juz := true;
      end;
    end;
    if czujnik = 3 then
    begin
      risk := Random(3);
      if risk = 2 then
      begin
        czujnik := Random(5) + 1;
        juz := false;
      end
      else
      begin
        GotoXY(18,13);
        TextColor(15);
        Write('Spodziewany brak zmiany cen !!!');
        progn := 3;
        juz := true;
      end;
    end;
    if czujnik = 4 then
    begin
      risk := Random(3);
      if risk = 2 then
      begin
        czujnik := Random(5) + 1;
        juz := false;
      end
      else
      begin
        GotoXY(18,13);
        TextColor(15);
        Write('Spodziewany spadek cen !!!');
        progn := 4;
        juz := true;
      end;
    end;
    if czujnik = 5 then
    begin
      risk := Random(3);
      if risk = 2 then
      begin
        czujnik := Random(5) + 1;
        juz := false;
      end
      else
      begin
        GotoXY(18,13);
        TextColor(15);
        Write('Spodziewany spadek cen !!!');
        progn := 5;
        juz := true;
      end;
    end;
    if juz = false then goto ponow;
  end;
end;

{ ------------------------------------------------------------------ BSK }
procedure bsk_prog(czujnik : longint; var progn : longint);
label ponow;
var risk : integer;
    juz  : boolean;
begin
  juz := false;
  if progn <> 0 then
  begin
    if progn = 1 then
    begin
      GotoXY(18,15);
      TextColor(15);
      Write('Spodziewany wzrost cen !!!');
    end;
    if progn = 2 then
    begin
      GotoXY(18,15);
      TextColor(15);
      Write('Spodziewany wzrost cen !!!');
    end;
    if progn = 3 then
    begin
      GotoXY(18,15);
      TextColor(15);
      Write('Spodziewany brak zmiany cen !!!');
    end;
    if progn = 4 then
    begin
      GotoXY(18,15);
      TextColor(15);
      Write('Spodziewany spadek cen !!!');
    end;
    if progn = 5 then
    begin
      GotoXY(18,15);
      TextColor(15);
      Write('Spodziewany spadek cen !!!');
    end;
    juz := true;
  end
  else
  begin
ponow:
    if czujnik = 1 then
    begin
      risk := Random(3);
      if risk = 2 then
      begin
        czujnik := Random(5) + 1;
        juz := false;
      end
      else
      begin
        GotoXY(18,15);
        TextColor(15);
        Write('Spodziewany wzrost cen !!!');
        progn := 1;
        juz := true;
      end;
    end;
    if czujnik = 2 then
    begin
      risk := Random(3);
      if risk = 2 then
      begin
        czujnik := Random(5) + 1;
        juz := false;
      end
      else
      begin
        GotoXY(18,15);
        TextColor(15);
        Write('Spodziewany wzrost cen !!!');
        progn := 2;
        juz := true;
      end;
    end;
    if czujnik = 3 then
    begin
      risk := Random(3);
      if risk = 2 then
      begin
        czujnik := Random(5) + 1;
        juz := false;
      end
      else
      begin
        GotoXY(18,15);
        TextColor(15);
        Write('Spodziewany brak zmiany cen !!!');
        progn := 3;
        juz := true;
      end;
    end;
    if czujnik = 4 then
    begin
      risk := Random(3);
      if risk = 2 then
      begin
        czujnik := Random(5) + 1;
        juz := false;
      end
      else
      begin
        GotoXY(18,15);
        TextColor(15);
        Write('Spodziewany spadek cen !!!');
        progn := 4;
        juz := true;
      end;
    end;
    if czujnik = 5 then
    begin
      risk := Random(3);
      if risk = 2 then
      begin
        czujnik := Random(5) + 1;
        juz := false;
      end
      else
      begin
        GotoXY(18,15);
        TextColor(15);
        Write('Spodziewany spadek cen !!!');
        progn := 5;
        juz := true;
      end;
    end;
    if juz = false then goto ponow;
  end;
end;

{ ------------------------------------------------------------------ KĘTY }
procedure kety_prog(czujnik : longint; var progn : longint);
label ponow;
var risk : integer;
    juz  : boolean;
begin
  juz := false;
  if progn <> 0 then
  begin
    if progn = 1 then
    begin
      GotoXY(18,17);
      TextColor(15);
      Write('Spodziewany wzrost cen !!!');
    end;
    if progn = 2 then
    begin
      GotoXY(18,17);
      TextColor(15);
      Write('Spodziewany wzrost cen !!!');
    end;
    if progn = 3 then
    begin
      GotoXY(18,17);
      TextColor(15);
      Write('Spodziewany brak zmiany cen !!!');
    end;
    if progn = 4 then
    begin
      GotoXY(18,17);
      TextColor(15);
      Write('Spodziewany spadek cen !!!');
    end;
    if progn = 5 then
    begin
      GotoXY(18,17);
      TextColor(15);
      Write('Spodziewany spadek cen !!!');
    end;
    juz := true;
  end
  else
  begin
ponow:
    if czujnik = 1 then
    begin
      risk := Random(3);
      if risk = 2 then
      begin
        czujnik := Random(5) + 1;
        juz := false;
      end
      else
      begin
        GotoXY(18,17);
        TextColor(15);
        Write('Spodziewany wzrost cen !!!');
        progn := 1;
        juz := true;
      end;
    end;
    if czujnik = 2 then
    begin
      risk := Random(3);
      if risk = 2 then
      begin
        czujnik := Random(5) + 1;
        juz := false;
      end
      else
      begin
        GotoXY(18,17);
        TextColor(15);
        Write('Spodziewany wzrost cen !!!');
        progn := 2;
        juz := true;
      end;
    end;
    if czujnik = 3 then
    begin
      risk := Random(3);
      if risk = 2 then
      begin
        czujnik := Random(5) + 1;
        juz := false;
      end
      else
      begin
        GotoXY(18,17);
        TextColor(15);
        Write('Spodziewany brak zmiany cen !!!');
        progn := 3;
        juz := true;
      end;
    end;
    if czujnik = 4 then
    begin
      risk := Random(3);
      if risk = 2 then
      begin
        czujnik := Random(5) + 1;
        juz := false;
      end
      else
      begin
        GotoXY(18,17);
        TextColor(15);
        Write('Spodziewany spadek cen !!!');
        progn := 4;
        juz := true;
      end;
    end;
    if czujnik = 5 then
    begin
      risk := Random(3);
      if risk = 2 then
      begin
        czujnik := Random(5) + 1;
        juz := false;
      end
      else
      begin
        GotoXY(18,17);
        TextColor(15);
        Write('Spodziewany spadek cen !!!');
        progn := 5;
        juz := true;
      end;
    end;
    if juz = false then goto ponow;
  end;
end;

{ ------------------------------------------------------------------ OPTIMUS }
procedure optimus_prog(czujnik : longint; var progn : longint);
label ponow;
var risk : integer;
    juz  : boolean;
begin
  juz := false;
  if progn <> 0 then
  begin
    if progn = 1 then
    begin
      GotoXY(18,19);
      TextColor(15);
      Write('Spodziewany wzrost cen !!!');
    end;
    if progn = 2 then
    begin
      GotoXY(18,19);
      TextColor(15);
      Write('Spodziewany wzrost cen !!!');
    end;
    if progn = 3 then
    begin
      GotoXY(18,19);
      TextColor(15);
      Write('Spodziewany brak zmiany cen !!!');
    end;
    if progn = 4 then
    begin
      GotoXY(18,19);
      TextColor(15);
      Write('Spodziewany spadek cen !!!');
    end;
    if progn = 5 then
    begin
      GotoXY(18,19);
      TextColor(15);
      Write('Spodziewany spadek cen !!!');
    end;
    juz := true;
  end
  else
  begin
ponow:
    if czujnik = 1 then
    begin
      risk := Random(3);
      if risk = 2 then
      begin
        czujnik := Random(5) + 1;
        juz := false;
      end
      else
      begin
        GotoXY(18,19);
        TextColor(15);
        Write('Spodziewany wzrost cen !!!');
        progn := 1;
        juz := true;
      end;
    end;
    if czujnik = 2 then
    begin
      risk := Random(3);
      if risk = 2 then
      begin
        czujnik := Random(5) + 1;
        juz := false;
      end
      else
      begin
        GotoXY(18,19);
        TextColor(15);
        Write('Spodziewany wzrost cen !!!');
        progn := 2;
        juz := true;
      end;
    end;
    if czujnik = 3 then
    begin
      risk := Random(3);
      if risk = 2 then
      begin
        czujnik := Random(5) + 1;
        juz := false;
      end
      else
      begin
        GotoXY(18,19);
        TextColor(15);
        Write('Spodziewany brak zmiany cen !!!');
        progn := 3;
        juz := true;
      end;
    end;
    if czujnik = 4 then
    begin
      risk := Random(3);
      if risk = 2 then
      begin
        czujnik := Random(5) + 1;
        juz := false;
      end
      else
      begin
        GotoXY(18,19);
        TextColor(15);
        Write('Spodziewany spadek cen !!!');
        progn := 4;
        juz := true;
      end;
    end;
    if czujnik = 5 then
    begin
      risk := Random(3);
      if risk = 2 then
      begin
        czujnik := Random(5) + 1;
        juz := false;
      end
      else
      begin
        GotoXY(18,19);
        TextColor(15);
        Write('Spodziewany spadek cen !!!');
        progn := 5;
        juz := true;
      end;
    end;
    if juz = false then goto ponow;
  end;
end;

{ ------------------------------------------------------------------ WEDEL }
procedure wedel_prog(czujnik : longint; var progn : longint);
label ponow;
var risk : integer;
    juz  : boolean;
begin
  juz := false;
  if progn <> 0 then
  begin
    if progn = 1 then
    begin
      GotoXY(18,21);
      TextColor(15);
      Write('Spodziewany wzrost cen !!!');
    end;
    if progn = 2 then
    begin
      GotoXY(18,21);
      TextColor(15);
      Write('Spodziewany wzrost cen !!!');
    end;
    if progn = 3 then
    begin
      GotoXY(18,21);
      TextColor(15);
      Write('Spodziewany brak zmiany cen !!!');
    end;
    if progn = 4 then
    begin
      GotoXY(18,21);
      TextColor(15);
      Write('Spodziewany spadek cen !!!');
    end;
    if progn = 5 then
    begin
      GotoXY(18,21);
      TextColor(15);
      Write('Spodziewany spadek cen !!!');
    end;
    juz := true;
  end
  else
  begin
ponow:
    if czujnik = 1 then
    begin
      risk := Random(3);
      if risk = 2 then
      begin
        czujnik := Random(5) + 1;
        juz := false;
      end
      else
      begin
        GotoXY(18,21);
        TextColor(15);
        Write('Spodziewany wzrost cen !!!');
        progn := 1;
        juz := true;
      end;
    end;
    if czujnik = 2 then
    begin
      risk := Random(3);
      if risk = 2 then
      begin
        czujnik := Random(5) + 1;
        juz := false;
      end
      else
      begin
        GotoXY(18,21);
        TextColor(15);
        Write('Spodziewany wzrost cen !!!');
        progn := 2;
        juz := true;
      end;
    end;
    if czujnik = 3 then
    begin
      risk := Random(3);
      if risk = 2 then
      begin
        czujnik := Random(5) + 1;
        juz := false;
      end
      else
      begin
        GotoXY(18,21);
        TextColor(15);
        Write('Spodziewany brak zmiany cen !!!');
        progn := 3;
        juz := true;
      end;
    end;
    if czujnik = 4 then
    begin
      risk := Random(3);
      if risk = 2 then
      begin
        czujnik := Random(5) + 1;
        juz := false;
      end
      else
      begin
        GotoXY(18,21);
        TextColor(15);
        Write('Spodziewany spadek cen !!!');
        progn := 4;
        juz := true;
      end;
    end;
    if czujnik = 5 then
    begin
      risk := Random(3);
      if risk = 2 then
      begin
        czujnik := Random(5) + 1;
        juz := false;
      end
      else
      begin
        GotoXY(18,21);
        TextColor(15);
        Write('Spodziewany spadek cen !!!');
        progn := 5;
        juz := true;
      end;
    end;
    if juz = false then goto ponow;
  end;
end;

{ ------------------------------------------------------------------ ŻYWIEC }
procedure zywiec_prog(czujnik : longint; var progn : longint);
label ponow;
var risk : integer;
    juz  : boolean;
begin
  juz := false;
  if progn <> 0 then
  begin
    if progn = 1 then
    begin
      GotoXY(18,23);
      TextColor(15);
      Write('Spodziewany wzrost cen !!!');
    end;
    if progn = 2 then
    begin
      GotoXY(18,23);
      TextColor(15);
      Write('Spodziewany wzrost cen !!!');
    end;
    if progn = 3 then
    begin
      GotoXY(18,23);
      TextColor(15);
      Write('Spodziewany brak zmiany cen !!!');
    end;
    if progn = 4 then
    begin
      GotoXY(18,23);
      TextColor(15);
      Write('Spodziewany spadek cen !!!');
    end;
    if progn = 5 then
    begin
      GotoXY(18,23);
      TextColor(15);
      Write('Spodziewany spadek cen !!!');
    end;
    juz := true;
  end
  else
  begin
ponow:
    if czujnik = 1 then
    begin
      risk := Random(3);
      if risk = 2 then
      begin
        czujnik := Random(5) + 1;
        juz := false;
      end
      else
      begin
        GotoXY(18,23);
        TextColor(15);
        Write('Spodziewany wzrost cen !!!');
        progn := 1;
        juz := true;
      end;
    end;
    if czujnik = 2 then
    begin
      risk := Random(3);
      if risk = 2 then
      begin
        czujnik := Random(5) + 1;
        juz := false;
      end
      else
      begin
        GotoXY(18,23);
        TextColor(15);
        Write('Spodziewany wzrost cen !!!');
        progn := 2;
        juz := true;
      end;
    end;
    if czujnik = 3 then
    begin
      risk := Random(3);
      if risk = 2 then
      begin
        czujnik := Random(5) + 1;
        juz := false;
      end
      else
      begin
        GotoXY(18,23);
        TextColor(15);
        Write('Spodziewany brak zmiany cen !!!');
        progn := 3;
        juz := true;
      end;
    end;
    if czujnik = 4 then
    begin
      risk := Random(3);
      if risk = 2 then
      begin
        czujnik := Random(5) + 1;
        juz := false;
      end
      else
      begin
        GotoXY(18,23);
        TextColor(15);
        Write('Spodziewany spadek cen !!!');
        progn := 4;
        juz := true;
      end;
    end;
    if czujnik = 5 then
    begin
      risk := Random(3);
      if risk = 2 then
      begin
        czujnik := Random(5) + 1;
        juz := false;
      end
      else
      begin
        GotoXY(18,23);
        TextColor(15);
        Write('Spodziewany spadek cen !!!');
        progn := 5;
        juz := true;
      end;
    end;
    if juz = false then goto ponow;
  end;
end;

end.

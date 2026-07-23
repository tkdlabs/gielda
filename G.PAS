program gielda;

{ ============================================================================
  GIEŁDA v1.1  —  (C) 1999 Tomasz Dobek / T.J. Softland
  ----------------------------------------------------------------------------
  Source reconstructed in 2026 from GIELDA.EXE (Turbo Pascal 7.0, compiled
  with debug information). Identifier names, procedure signatures, line
  numbering, screen text and program logic recovered from the embedded
  Turbo Debugger symbol table and a per-line disassembly of the code.

  Original file: G.PAS, last saved 1999-02-11 19:11:16.

  NOTE: label names (used with goto) were not stored in the debug info,
  so the labels below are reconstructed; everything else follows the
  original. Compile with TP 7.0; requires DATA1.PAS, DATA2.PAS, IMPORT.PAS
  (EGAVGA.OBJ + SANS.OBJ linked via BINOBJ).
  ============================================================================ }

uses Crt, Dos, Graph, import, data1, data2;

label nowases, odswiez, czytaj, nowasesja_licz, kupwybor, kupsel, kup,
      sprzedwybor, sprzedsel, sprzedaj, prognozy, wykres, zapis, odczyt,
      dzwiekmenu, koniec;

type
  dzwiekopcj   = byte;
  imiet        = string[10];
  rekord       = record
                   agros1, agros2, agros3, agros4, agros5, agros6, agros7, agros8, agros9, agros10, agros11, agros12 : longint;
                   big1, big2, big3, big4, big5, big6, big7, big8, big9, big10, big11, big12 : longint;
                   bph1, bph2, bph3, bph4, bph5, bph6, bph7, bph8, bph9, bph10, bph11, bph12 : longint;
                   bsk1, bsk2, bsk3, bsk4, bsk5, bsk6, bsk7, bsk8, bsk9, bsk10, bsk11, bsk12 : longint;
                   kety1, kety2, kety3, kety4, kety5, kety6, kety7, kety8, kety9, kety10, kety11, kety12 : longint;
                   optimus1, optimus2, optimus3, optimus4, optimus5, optimus6, optimus7, optimus8, optimus9, optimus10, optimus11, optimus12 : longint;
                   wedel1, wedel2, wedel3, wedel4, wedel5, wedel6, wedel7, wedel8, wedel9, wedel10, wedel11, wedel12 : longint;
                   zywiec1, zywiec2, zywiec3, zywiec4, zywiec5, zywiec6, zywiec7, zywiec8, zywiec9, zywiec10, zywiec11, zywiec12 : longint;
                   imie1 : string[10];
                   gotowka, sumaa, wartosca, budzet : longint;
                   gotowka_zerowa : longint;
                   sesja1 : integer;
                 end;
  savegame     = file of rekord;
  konfiguracja = file of dzwiekopcj;

var
  agroscenan, agroscenas, agrosmin, agrosmax, agroswartosc, agrosilosc, agrosoile, agrosczujnik, agrosryzyko, agrossesja, agrossesjem, agrosprogn : longint;
  bigcenan, bigcenas, bigmin, bigmax, bigwartosc, bigilosc, bigoile, bigczujnik, bigryzyko, bigsesja, bigsesjem, bigprogn : longint;
  bphcenan, bphcenas, bphmin, bphmax, bphwartosc, bphilosc, bphoile, bphczujnik, bphryzyko, bphsesja, bphsesjem, bphprogn : longint;
  bskcenan, bskcenas, bskmin, bskmax, bskwartosc, bskilosc, bskoile, bskczujnik, bskryzyko, bsksesja, bsksesjem, bskprogn : longint;
  ketycenan, ketycenas, ketymin, ketymax, ketywartosc, ketyilosc, ketyoile, ketyczujnik, ketyryzyko, ketysesja, ketysesjem, ketyprogn : longint;
  optimuscenan, optimuscenas, optimusmin, optimusmax, optimuswartosc, optimusilosc, optimusoile, optimusczujnik, optimusryzyko, optimussesja, optimussesjem, optimusprogn : longint;
  wedelcenan, wedelcenas, wedelmin, wedelmax, wedelwartosc, wedelilosc, wedeloile, wedelczujnik, wedelryzyko, wedelsesja, wedelsesjem, wedelprogn : longint;
  zywieccenan, zywieccenas, zywiecmin, zywiecmax, zywiecwartosc, zywiecilosc, zywiecoile, zywiecczujnik, zywiecryzyko, zywiecsesja, zywiecsesjem, zywiecprogn : longint;
  sesja    : integer;
  imie     : imiet;
  gotowka, sumaa, wartosca, budzet : longint;
  klawisz  : char;
  dzwiek   : dzwiekopcj;
  klaw2    : char;
  plikcfg  : konfiguracja;
  dzwiekop : byte;
  czujnik_przesuwania : byte;
  gotow_zerowa : longint;
  det, tr  : integer;
  save     : savegame;
  dane     : rekord;
  sra      : string;

{ ---------------------------------------------------------------- line 183 }
procedure czysc_finanse;
begin
  TextBackground(0);
  GotoXY(20,23); Write('      ');
  GotoXY(45,23); Write('      ');
  GotoXY(20,24); Write('      ');
  GotoXY(45,24); Write('      ');
end;

{ ------------------------------------------------------------------ AGROS }
procedure wpisz_wartosci_agros(sesjak, cenanw, cenast, mini, maxi, war, ilo : integer);
var zmiana : integer;
begin
  GotoXY(3,5);
  TextBackground(0);
  TextColor(15);
  Write('Sesja ', sesjak);
  GotoXY(15,7);
  Write(cenanw);
  GotoXY(22,7);
  zmiana := cenanw - cenast;
  if zmiana > 0 then Write('+', zmiana)
  else
  if zmiana = 0 then Write('±', zmiana)
                else Write(zmiana);
  GotoXY(29,7);
  Write(cenast);
  GotoXY(36,7);
  Write(mini);
  GotoXY(43,7);
  Write(maxi);
  GotoXY(50,7);
  Write(ilo);
  GotoXY(57,7);
  Write(war);
end;

{ ------------------------------------------------------------------ BIG }
procedure wpisz_wartosci_big(sesjak, cenanw, cenast, mini, maxi, war, ilo : integer);
var zmiana : integer;
begin
  GotoXY(3,5);
  TextBackground(0);
  TextColor(15);
  Write('Sesja ', sesjak);
  GotoXY(15,9);
  Write(cenanw);
  GotoXY(22,9);
  zmiana := cenanw - cenast;
  if zmiana > 0 then Write('+', zmiana)
  else
  if zmiana = 0 then Write('±', zmiana)
                else Write(zmiana);
  GotoXY(29,9);
  Write(cenast);
  GotoXY(36,9);
  Write(mini);
  GotoXY(43,9);
  Write(maxi);
  GotoXY(50,9);
  Write(ilo);
  GotoXY(57,9);
  Write(war);
end;

{ ------------------------------------------------------------------ BPH }
procedure wpisz_wartosci_bph(sesjak, cenanw, cenast, mini, maxi, war, ilo : integer);
var zmiana : integer;
begin
  GotoXY(3,5);
  TextBackground(0);
  TextColor(15);
  Write('Sesja ', sesjak);
  GotoXY(15,11);
  Write(cenanw);
  GotoXY(22,11);
  zmiana := cenanw - cenast;
  if zmiana > 0 then Write('+', zmiana)
  else
  if zmiana = 0 then Write('±', zmiana)
                else Write(zmiana);
  GotoXY(29,11);
  Write(cenast);
  GotoXY(36,11);
  Write(mini);
  GotoXY(43,11);
  Write(maxi);
  GotoXY(50,11);
  Write(ilo);
  GotoXY(57,11);
  Write(war);
end;

{ ------------------------------------------------------------------ BSK }
procedure wpisz_wartosci_bsk(sesjak, cenanw, cenast, mini, maxi, war, ilo : integer);
var zmiana : integer;
begin
  GotoXY(3,5);
  TextBackground(0);
  TextColor(15);
  Write('Sesja ', sesjak);
  GotoXY(15,13);
  Write(cenanw);
  GotoXY(22,13);
  zmiana := cenanw - cenast;
  if zmiana > 0 then Write('+', zmiana)
  else
  if zmiana = 0 then Write('±', zmiana)
                else Write(zmiana);
  GotoXY(29,13);
  Write(cenast);
  GotoXY(36,13);
  Write(mini);
  GotoXY(43,13);
  Write(maxi);
  GotoXY(50,13);
  Write(ilo);
  GotoXY(57,13);
  Write(war);
end;

{ ------------------------------------------------------------------ KĘTY }
procedure wpisz_wartosci_kety(sesjak, cenanw, cenast, mini, maxi, war, ilo : integer);
var zmiana : integer;
begin
  GotoXY(3,5);
  TextBackground(0);
  TextColor(15);
  Write('Sesja ', sesjak);
  GotoXY(15,15);
  Write(cenanw);
  GotoXY(22,15);
  zmiana := cenanw - cenast;
  if zmiana > 0 then Write('+', zmiana)
  else
  if zmiana = 0 then Write('±', zmiana)
                else Write(zmiana);
  GotoXY(29,15);
  Write(cenast);
  GotoXY(36,15);
  Write(mini);
  GotoXY(43,15);
  Write(maxi);
  GotoXY(50,15);
  Write(ilo);
  GotoXY(57,15);
  Write(war);
end;

{ ------------------------------------------------------------------ OPTIMUS }
procedure wpisz_wartosci_optimus(sesjak, cenanw, cenast, mini, maxi, war, ilo : integer);
var zmiana : integer;
begin
  GotoXY(3,5);
  TextBackground(0);
  TextColor(15);
  Write('Sesja ', sesjak);
  GotoXY(15,17);
  Write(cenanw);
  GotoXY(22,17);
  zmiana := cenanw - cenast;
  if zmiana > 0 then Write('+', zmiana)
  else
  if zmiana = 0 then Write('±', zmiana)
                else Write(zmiana);
  GotoXY(29,17);
  Write(cenast);
  GotoXY(36,17);
  Write(mini);
  GotoXY(43,17);
  Write(maxi);
  GotoXY(50,17);
  Write(ilo);
  GotoXY(57,17);
  Write(war);
end;

{ ------------------------------------------------------------------ WEDEL }
procedure wpisz_wartosci_wedel(sesjak, cenanw, cenast, mini, maxi, war, ilo : integer);
var zmiana : integer;
begin
  GotoXY(3,5);
  TextBackground(0);
  TextColor(15);
  Write('Sesja ', sesjak);
  GotoXY(15,19);
  Write(cenanw);
  GotoXY(22,19);
  zmiana := cenanw - cenast;
  if zmiana > 0 then Write('+', zmiana)
  else
  if zmiana = 0 then Write('±', zmiana)
                else Write(zmiana);
  GotoXY(29,19);
  Write(cenast);
  GotoXY(36,19);
  Write(mini);
  GotoXY(43,19);
  Write(maxi);
  GotoXY(50,19);
  Write(ilo);
  GotoXY(57,19);
  Write(war);
end;

{ ------------------------------------------------------------------ ŻYWIEC }
procedure wpisz_wartosci_zywiec(sesjak, cenanw, cenast, mini, maxi, war, ilo : integer);
var zmiana : integer;
begin
  GotoXY(3,5);
  TextBackground(0);
  TextColor(15);
  Write('Sesja ', sesjak);
  GotoXY(15,21);
  Write(cenanw);
  GotoXY(22,21);
  zmiana := cenanw - cenast;
  if zmiana > 0 then Write('+', zmiana)
  else
  if zmiana = 0 then Write('±', zmiana)
                else Write(zmiana);
  GotoXY(29,21);
  Write(cenast);
  GotoXY(36,21);
  Write(mini);
  GotoXY(43,21);
  Write(maxi);
  GotoXY(50,21);
  Write(ilo);
  GotoXY(57,21);
  Write(war);
end;

{ ---------------------------------------------------------------- line 389 }
procedure nowa_sesja_pok;
begin
  TextBackground(0);
  ClrScr;
  TextColor(3);
  WriteLn('--- ▓▒░ Giełda V 1.1 (C)1999 ░▒▓ --- ESC = Nowa Sesja  F1 = Pomoc  F2 = Kupno ');
  WriteLn('F3 Sprzedaż  F4 Prognozy  F5 Wykres  F6 Dźwięk  F7 Zapis  F8 Odczyt F10 Koniec');
  WriteLn('╔════════════════════════════════════════════════════════════════════════════╗');
  WriteLn('║                                                                            ║');
  WriteLn('║             Cena  Zmiana Poprz.  Min.  Max.    Ilość Wartość   Max. Kupno  ║');
  WriteLn('╠═══════════╦══════╦══════╦══════╦══════╦══════╦══════╦════════╦═════════════╣');
  WriteLn('║  AGROS    ║      ║      ║      ║      ║      ║      ║        ║             ║');
  WriteLn('╠═══════════╬══════╬══════╬══════╬══════╬══════╬══════╬════════╬═════════════╣');
  WriteLn('║  BIG      ║      ║      ║      ║      ║      ║      ║        ║             ║');
  WriteLn('╠═══════════╬══════╬══════╬══════╬══════╬══════╬══════╬════════╬═════════════╣');
  WriteLn('║  BPH      ║      ║      ║      ║      ║      ║      ║        ║             ║');
  WriteLn('╠═══════════╬══════╬══════╬══════╬══════╬══════╬══════╬════════╬═════════════╣');
  WriteLn('║  BSK      ║      ║      ║      ║      ║      ║      ║        ║             ║');
  WriteLn('╠═══════════╬══════╬══════╬══════╬══════╬══════╬══════╬════════╬═════════════╣');
  WriteLn('║  KĘTY     ║      ║      ║      ║      ║      ║      ║        ║             ║');
  WriteLn('╠═══════════╬══════╬══════╬══════╬══════╬══════╬══════╬════════╬═════════════╣');
  WriteLn('║  OPTIMUS  ║      ║      ║      ║      ║      ║      ║        ║             ║');
  WriteLn('╠═══════════╬══════╬══════╬══════╬══════╬══════╬══════╬════════╬═════════════╣');
  WriteLn('║  WEDEL    ║      ║      ║      ║      ║      ║      ║        ║             ║');
  WriteLn('╠═══════════╬══════╬══════╬══════╬══════╬══════╬══════╬════════╬═════════════╣');
  WriteLn('║  ŻYWIEC   ║      ║      ║      ║      ║      ║      ║        ║             ║');
  WriteLn('╠═══════════╩══════╩══════╩══════╩══════╩══════╩══════╩════════╩═════════════╣');
  WriteLn('║        Gotówka :          Ilość   akcji :                                  ║');
  WriteLn('║  Budżet realny :          Wartość akcji :                                  ║');
  Write  ('╚════════════════════════════════════════════════════════════════════════════╝');
end;

{ ---------------------------------------------------------------- line 421 }
procedure pisz_imie(imiegr : imiet);
begin
  GotoXY(35,4);
  Write(imiegr);
end;

{ ---------------------------------------------------------------- line 427 }
procedure pisz_finanse(gotow, ilosca, breal, warta : integer);
begin
  TextBackground(0);
  TextColor(15);
  GotoXY(20,23); Write(gotow);
  GotoXY(45,23); Write(ilosca);
  GotoXY(20,24); Write(breal);
  GotoXY(45,24); Write(warta);
end;

{ ---------------------------------------------------------------- line 441 }
procedure Corupt;
begin
  WriteLn('Plik gielda.exe jest nieodwracalnie uszkodzony !!');
  WriteLn('Proszę zainstalować program jeszcze raz !!');
  WriteLn;
  Halt(0);
end;

{ ---------------------------------------------------------------- line 449 }
procedure graphtryb;
begin
  det := 9;   { VGA }
  tr  := 1;
  if RegisterBGIdriver(@EgaVgaDriver) < 0 then Corupt;
  if RegisterBGIfont(@SansFont) < 0 then Corupt;
  InitGraph(det, tr, '');
end;

{ ================================================================= line 455 }
begin
  TextBackground(0);
  TextColor(10);
  ClrScr;
  WriteLn('(C) 1999 Tomasz Dobek (R), Version 1.1 BASIC          Loading ...');
  WriteLn('                          Wszystkie Prawa Zastrzeżone !!!');
  Assign(plikcfg, 'GIELDA.CFG');
  Reset(plikcfg);
  { odczyt ustawienia dźwięku }
  Read(plikcfg, dzwiekop);
  if dzwiekop = 1 then dzwiek := 1;
  if dzwiekop = 0 then dzwiek := 0;
  Close(plikcfg);
  gotow_zerowa := 2000;
  sesja := 0;
  gotowka := 2000;
  sumaa := 0;
  wartosca := 0;
  budzet := gotowka + sumaa;
  Randomize;

  agroscenan := 100;
  agroscenas := 100;
  agrosmin := 100;
  agrosmax := 100;
  agrosilosc := 0;
  agroswartosc := 0;
  agrosczujnik := Random(5) + 1;
  agrossesja := Random(50) + 1;
  agrossesjem := 0;
  agrosprogn := 0;

  bigcenan := 100;
  bigcenas := 100;
  bigmin := 100;
  bigmax := 100;
  bigilosc := 0;
  bigwartosc := 0;
  bigczujnik := Random(5) + 1;
  bigsesja := Random(50) + 1;
  bigsesjem := 0;
  bigprogn := 0;

  bphcenan := 100;
  bphcenas := 100;
  bphmin := 100;
  bphmax := 100;
  bphilosc := 0;
  bphwartosc := 0;
  bphczujnik := Random(5) + 1;
  bphsesja := Random(50) + 1;
  bphsesjem := 0;
  bphprogn := 0;

  bskcenan := 100;
  bskcenas := 100;
  bskmin := 100;
  bskmax := 100;
  bskilosc := 0;
  bskwartosc := 0;
  bskczujnik := Random(5) + 1;
  bsksesja := Random(50) + 1;
  bsksesjem := 0;
  bskprogn := 0;

  ketycenan := 100;
  ketycenas := 100;
  ketymin := 100;
  ketymax := 100;
  ketyilosc := 0;
  ketywartosc := 0;
  ketyczujnik := Random(5) + 1;
  ketysesja := Random(50) + 1;
  ketysesjem := 0;
  ketyprogn := 0;

  optimuscenan := 100;
  optimuscenas := 100;
  optimusmin := 100;
  optimusmax := 100;
  optimusilosc := 0;
  optimuswartosc := 0;
  optimusczujnik := Random(5) + 1;
  optimussesja := Random(50) + 1;
  optimussesjem := 0;
  optimusprogn := 0;

  wedelcenan := 100;
  wedelcenas := 100;
  wedelmin := 100;
  wedelmax := 100;
  wedelilosc := 0;
  wedelwartosc := 0;
  wedelczujnik := Random(5) + 1;
  wedelsesja := Random(50) + 1;
  wedelsesjem := 0;
  wedelprogn := 0;

  zywieccenan := 100;
  zywieccenas := 100;
  zywiecmin := 100;
  zywiecmax := 100;
  zywiecilosc := 0;
  zywiecwartosc := 0;
  zywiecczujnik := Random(5) + 1;
  zywiecsesja := Random(50) + 1;
  zywiecsesjem := 0;
  zywiecprogn := 0;

  if dzwiek = 1 then
  begin
    Sound(200); Delay(100);
    Sound(210); Delay(100);
    Sound(250); Delay(500);
    NoSound;
  end;

  Write('Jak masz na imie ? :');
  ReadLn(imie);

nowases:                                                          { line 582 }
  sesja := sesja + 1;
  agrosprogn := 0;
  bigprogn := 0;
  bphprogn := 0;
  bskprogn := 0;
  ketyprogn := 0;
  optimusprogn := 0;
  wedelprogn := 0;
  zywiecprogn := 0;
  if dzwiek = 1 then
  begin
    Sound(5000); Delay(100); NoSound;
  end;

odswiez:                                                          { line 597 }
  agroswartosc := agroscenan * agrosilosc;
  bigwartosc := bigcenan * bigilosc;
  bphwartosc := bphcenan * bphilosc;
  bskwartosc := bskcenan * bskilosc;
  ketywartosc := ketycenan * ketyilosc;
  optimuswartosc := optimuscenan * optimusilosc;
  wedelwartosc := wedelcenan * wedelilosc;
  zywiecwartosc := zywieccenan * zywiecilosc;

  sumaa:=agrosilosc+bigilosc+bphilosc+bskilosc+ketyilosc+optimusilosc+wedelilosc+zywiecilosc;
  wartosca:=agroswartosc+bigwartosc+bphwartosc+bskwartosc+ketywartosc+optimuswartosc+wedelwartosc+zywiecwartosc;

  budzet := gotowka + wartosca;
  nowa_sesja_pok;
  wpisz_wartosci_agros(sesja, agroscenan, agroscenas, agrosmin, agrosmax, agroswartosc, agrosilosc);
  wpisz_wartosci_big(sesja, bigcenan, bigcenas, bigmin, bigmax, bigwartosc, bigilosc);
  wpisz_wartosci_bph(sesja, bphcenan, bphcenas, bphmin, bphmax, bphwartosc, bphilosc);
  wpisz_wartosci_bsk(sesja, bskcenan, bskcenas, bskmin, bskmax, bskwartosc, bskilosc);
  wpisz_wartosci_kety(sesja, ketycenan, ketycenas, ketymin, ketymax, ketywartosc, ketyilosc);
  wpisz_wartosci_optimus(sesja, optimuscenan, optimuscenas, optimusmin, optimusmax, optimuswartosc, optimusilosc);
  wpisz_wartosci_wedel(sesja, wedelcenan, wedelcenas, wedelmin, wedelmax, wedelwartosc, wedelilosc);
  wpisz_wartosci_zywiec(sesja, zywieccenan, zywieccenas, zywiecmin, zywiecmax, zywiecwartosc, zywiecilosc);

  pisz_imie(imie);
  pisz_finanse(gotowka, sumaa, budzet, wartosca);

czytaj:                                                           { line 627 }
  klawisz := ReadKey;

  if klawisz = #27 then goto nowasesja_licz; { ESC - Nowa Sesja }
  if klawisz = #59 then goto odswiez;     { F1  - Pomoc (niezrobiona...) }
  if klawisz = #60 then goto kupwybor;    { F2  - Kupno }
  if klawisz = #61 then goto sprzedwybor; { F3  - Sprzedaż }
  if klawisz = #62 then goto prognozy;    { F4  - Prognozy }
  if klawisz = #63 then goto wykres;      { F5  - Wykres }
  if klawisz = #64 then goto dzwiekmenu;  { F6  - Dźwięk }
  if klawisz = #65 then goto zapis;       { F7  - Zapis }
  if klawisz = #66 then goto odczyt;      { F8  - Odczyt }
  if klawisz = #68 then goto koniec;      { F10 - Koniec }
  goto czytaj;

  { ============================= ESC : nowa sesja ================ line 644 }
nowasesja_licz:
  agros_nowses(agroscenan, agroscenas, agrosmin, agrosmax, agrosczujnik, agrosryzyko, agrossesja, agrossesjem);
  big_nowses(bigcenan, bigcenas, bigmin, bigmax, bigczujnik, bigryzyko, bigsesja, bigsesjem);
  bph_nowses(bphcenan, bphcenas, bphmin, bphmax, bphczujnik, bphryzyko, bphsesja, bphsesjem);
  bsk_nowses(bskcenan, bskcenas, bskmin, bskmax, bskczujnik, bskryzyko, bsksesja, bsksesjem);
  kety_nowses(ketycenan, ketycenas, ketymin, ketymax, ketyczujnik, ketyryzyko, ketysesja, ketysesjem);
  optimus_nowses(optimuscenan, optimuscenas, optimusmin, optimusmax, optimusczujnik, optimusryzyko, optimussesja, optimussesjem);
  wedel_nowses(wedelcenan, wedelcenas, wedelmin, wedelmax, wedelczujnik, wedelryzyko, wedelsesja, wedelsesjem);
  zywiec_nowses(zywieccenan, zywieccenas, zywiecmin, zywiecmax, zywiecczujnik, zywiecryzyko, zywiecsesja, zywiecsesjem);
  goto nowases;

  { ============================= F2 : KUPNO ====================== line 663 }
kupwybor:
  czujnik_przesuwania := 0;
kupsel:
  if czujnik_przesuwania = 0 then
  begin
    GotoXY(49,7);
    TextBackground(1);
    TextColor(15);
    Write(' ', agrosilosc, ' ');
    klaw2 := ReadKey;
    if klaw2 = #72 then czujnik_przesuwania := 8;
    if klaw2 = #80 then czujnik_przesuwania := 2;
    if klaw2 = #13 then goto kup;
    if klaw2 = #27 then goto odswiez;
    GotoXY(49,7);
    TextBackground(0);
    TextColor(15);
    Write(' ', agrosilosc, ' ');
    goto kupsel;
  end;
  if czujnik_przesuwania = 1 then
  begin
    GotoXY(49,7);
    TextBackground(1);
    TextColor(15);
    Write(' ', agrosilosc, ' ');
    klaw2 := ReadKey;
    if klaw2 = #72 then czujnik_przesuwania := 8;
    if klaw2 = #80 then czujnik_przesuwania := 2;
    if klaw2 = #13 then goto kup;
    if klaw2 = #27 then goto odswiez;
    GotoXY(49,7);
    TextBackground(0);
    TextColor(15);
    Write(' ', agrosilosc, ' ');
    goto kupsel;
  end;
  if czujnik_przesuwania = 2 then
  begin
    GotoXY(49,9);
    TextBackground(1);
    TextColor(15);
    Write(' ', bigilosc, ' ');
    klaw2 := ReadKey;
    if klaw2 = #72 then czujnik_przesuwania := 1;
    if klaw2 = #80 then czujnik_przesuwania := 3;
    if klaw2 = #13 then goto kup;
    if klaw2 = #27 then goto odswiez;
    GotoXY(49,9);
    TextBackground(0);
    TextColor(15);
    Write(' ', bigilosc, ' ');
    goto kupsel;
  end;
  if czujnik_przesuwania = 3 then
  begin
    GotoXY(49,11);
    TextBackground(1);
    TextColor(15);
    Write(' ', bphilosc, ' ');
    klaw2 := ReadKey;
    if klaw2 = #72 then czujnik_przesuwania := 2;
    if klaw2 = #80 then czujnik_przesuwania := 4;
    if klaw2 = #13 then goto kup;
    if klaw2 = #27 then goto odswiez;
    GotoXY(49,11);
    TextBackground(0);
    TextColor(15);
    Write(' ', bphilosc, ' ');
    goto kupsel;
  end;
  if czujnik_przesuwania = 4 then
  begin
    GotoXY(49,13);
    TextBackground(1);
    TextColor(15);
    Write(' ', bskilosc, ' ');
    klaw2 := ReadKey;
    if klaw2 = #72 then czujnik_przesuwania := 3;
    if klaw2 = #80 then czujnik_przesuwania := 5;
    if klaw2 = #13 then goto kup;
    if klaw2 = #27 then goto odswiez;
    GotoXY(49,13);
    TextBackground(0);
    TextColor(15);
    Write(' ', bskilosc, ' ');
    goto kupsel;
  end;
  if czujnik_przesuwania = 5 then
  begin
    GotoXY(49,15);
    TextBackground(1);
    TextColor(15);
    Write(' ', ketyilosc, ' ');
    klaw2 := ReadKey;
    if klaw2 = #72 then czujnik_przesuwania := 4;
    if klaw2 = #80 then czujnik_przesuwania := 6;
    if klaw2 = #13 then goto kup;
    if klaw2 = #27 then goto odswiez;
    GotoXY(49,15);
    TextBackground(0);
    TextColor(15);
    Write(' ', ketyilosc, ' ');
    goto kupsel;
  end;
  if czujnik_przesuwania = 6 then
  begin
    GotoXY(49,17);
    TextBackground(1);
    TextColor(15);
    Write(' ', optimusilosc, ' ');
    klaw2 := ReadKey;
    if klaw2 = #72 then czujnik_przesuwania := 5;
    if klaw2 = #80 then czujnik_przesuwania := 7;
    if klaw2 = #13 then goto kup;
    if klaw2 = #27 then goto odswiez;
    GotoXY(49,17);
    TextBackground(0);
    TextColor(15);
    Write(' ', optimusilosc, ' ');
    goto kupsel;
  end;
  if czujnik_przesuwania = 7 then
  begin
    GotoXY(49,19);
    TextBackground(1);
    TextColor(15);
    Write(' ', wedelilosc, ' ');
    klaw2 := ReadKey;
    if klaw2 = #72 then czujnik_przesuwania := 6;
    if klaw2 = #80 then czujnik_przesuwania := 8;
    if klaw2 = #13 then goto kup;
    if klaw2 = #27 then goto odswiez;
    GotoXY(49,19);
    TextBackground(0);
    TextColor(15);
    Write(' ', wedelilosc, ' ');
    goto kupsel;
  end;
  if czujnik_przesuwania = 8 then
  begin
    GotoXY(49,21);
    TextBackground(1);
    TextColor(15);
    Write(' ', zywiecilosc, ' ');
    klaw2 := ReadKey;
    if klaw2 = #72 then czujnik_przesuwania := 7;
    if klaw2 = #80 then czujnik_przesuwania := 1;
    if klaw2 = #13 then goto kup;
    if klaw2 = #27 then goto odswiez;
    GotoXY(49,21);
    TextBackground(0);
    TextColor(15);
    Write(' ', zywiecilosc, ' ');
    goto kupsel;
  end;
  goto kupsel;

kup:                                                              { line 822 }
  if (czujnik_przesuwania = 0) or (czujnik_przesuwania = 1) then
  begin
    agrosilosc := agrosilosc + 1;
    agroswartosc := agroscenan * agrosilosc;
    wartosca:=agroswartosc+bigwartosc+bphwartosc+bskwartosc+ketywartosc+optimuswartosc+wedelwartosc+zywiecwartosc;
    gotowka := gotowka - agroscenan;
    if gotowka < 0 then
    begin
      if dzwiek = 1 then
      begin
        Sound(200); Delay(200); NoSound;
      end;
      agrosilosc := agrosilosc - 1;
      agroswartosc := agroscenan * agrosilosc;
      wartosca:=agroswartosc+bigwartosc+bphwartosc+bskwartosc+ketywartosc+optimuswartosc+wedelwartosc+zywiecwartosc;
      gotowka := budzet - wartosca;
      wpisz_wartosci_agros(sesja, agroscenan, agroscenas, agrosmin, agrosmax, agroswartosc, agrosilosc);
      goto kupsel;
    end
    else
    begin
      budzet := gotowka + wartosca;
      czysc_finanse;
      pisz_finanse(gotowka, sumaa, budzet, wartosca);
      wpisz_wartosci_agros(sesja, agroscenan, agroscenas, agrosmin, agrosmax, agroswartosc, agrosilosc);
      goto kupsel;
    end;
  end;
  if czujnik_przesuwania = 2 then
  begin
    bigilosc := bigilosc + 1;
    bigwartosc := bigcenan * bigilosc;
    wartosca:=agroswartosc+bigwartosc+bphwartosc+bskwartosc+ketywartosc+optimuswartosc+wedelwartosc+zywiecwartosc;
    gotowka := gotowka - bigcenan;
    if gotowka < 0 then
    begin
      if dzwiek = 1 then
      begin
        Sound(200); Delay(200); NoSound;
      end;
      bigilosc := bigilosc - 1;
      bigwartosc := bigcenan * bigilosc;
      wartosca:=agroswartosc+bigwartosc+bphwartosc+bskwartosc+ketywartosc+optimuswartosc+wedelwartosc+zywiecwartosc;
      gotowka := budzet - wartosca;
      wpisz_wartosci_big(sesja, bigcenan, bigcenas, bigmin, bigmax, bigwartosc, bigilosc);
      goto kupsel;
    end
    else
    begin
      budzet := gotowka + wartosca;
      czysc_finanse;
      pisz_finanse(gotowka, sumaa, budzet, wartosca);
      wpisz_wartosci_big(sesja, bigcenan, bigcenas, bigmin, bigmax, bigwartosc, bigilosc);
      goto kupsel;
    end;
  end;
  if czujnik_przesuwania = 3 then
  begin
    bphilosc := bphilosc + 1;
    bphwartosc := bphcenan * bphilosc;
    wartosca:=agroswartosc+bigwartosc+bphwartosc+bskwartosc+ketywartosc+optimuswartosc+wedelwartosc+zywiecwartosc;
    gotowka := gotowka - bphcenan;
    if gotowka < 0 then
    begin
      if dzwiek = 1 then
      begin
        Sound(200); Delay(200); NoSound;
      end;
      bphilosc := bphilosc - 1;
      bphwartosc := bphcenan * bphilosc;
      wartosca:=agroswartosc+bigwartosc+bphwartosc+bskwartosc+ketywartosc+optimuswartosc+wedelwartosc+zywiecwartosc;
      gotowka := budzet - wartosca;
      wpisz_wartosci_bph(sesja, bphcenan, bphcenas, bphmin, bphmax, bphwartosc, bphilosc);
      goto kupsel;
    end
    else
    begin
      budzet := gotowka + wartosca;
      czysc_finanse;
      pisz_finanse(gotowka, sumaa, budzet, wartosca);
      wpisz_wartosci_bph(sesja, bphcenan, bphcenas, bphmin, bphmax, bphwartosc, bphilosc);
      goto kupsel;
    end;
  end;
  if czujnik_przesuwania = 4 then
  begin
    bskilosc := bskilosc + 1;
    bskwartosc := bskcenan * bskilosc;
    wartosca:=agroswartosc+bigwartosc+bphwartosc+bskwartosc+ketywartosc+optimuswartosc+wedelwartosc+zywiecwartosc;
    gotowka := gotowka - bskcenan;
    if gotowka < 0 then
    begin
      if dzwiek = 1 then
      begin
        Sound(200); Delay(200); NoSound;
      end;
      bskilosc := bskilosc - 1;
      bskwartosc := bskcenan * bskilosc;
      wartosca:=agroswartosc+bigwartosc+bphwartosc+bskwartosc+ketywartosc+optimuswartosc+wedelwartosc+zywiecwartosc;
      gotowka := budzet - wartosca;
      wpisz_wartosci_bsk(sesja, bskcenan, bskcenas, bskmin, bskmax, bskwartosc, bskilosc);
      goto kupsel;
    end
    else
    begin
      budzet := gotowka + wartosca;
      czysc_finanse;
      pisz_finanse(gotowka, sumaa, budzet, wartosca);
      wpisz_wartosci_bsk(sesja, bskcenan, bskcenas, bskmin, bskmax, bskwartosc, bskilosc);
      goto kupsel;
    end;
  end;
  if czujnik_przesuwania = 5 then
  begin
    ketyilosc := ketyilosc + 1;
    ketywartosc := ketycenan * ketyilosc;
    wartosca:=agroswartosc+bigwartosc+bphwartosc+bskwartosc+ketywartosc+optimuswartosc+wedelwartosc+zywiecwartosc;
    gotowka := gotowka - ketycenan;
    if gotowka < 0 then
    begin
      if dzwiek = 1 then
      begin
        Sound(200); Delay(200); NoSound;
      end;
      ketyilosc := ketyilosc - 1;
      ketywartosc := ketycenan * ketyilosc;
      wartosca:=agroswartosc+bigwartosc+bphwartosc+bskwartosc+ketywartosc+optimuswartosc+wedelwartosc+zywiecwartosc;
      gotowka := budzet - wartosca;
      wpisz_wartosci_kety(sesja, ketycenan, ketycenas, ketymin, ketymax, ketywartosc, ketyilosc);
      goto kupsel;
    end
    else
    begin
      budzet := gotowka + wartosca;
      czysc_finanse;
      pisz_finanse(gotowka, sumaa, budzet, wartosca);
      wpisz_wartosci_kety(sesja, ketycenan, ketycenas, ketymin, ketymax, ketywartosc, ketyilosc);
      goto kupsel;
    end;
  end;
  if czujnik_przesuwania = 6 then
  begin
    optimusilosc := optimusilosc + 1;
    optimuswartosc := optimuscenan * optimusilosc;
    wartosca:=agroswartosc+bigwartosc+bphwartosc+bskwartosc+ketywartosc+optimuswartosc+wedelwartosc+zywiecwartosc;
    gotowka := gotowka - optimuscenan;
    if gotowka < 0 then
    begin
      if dzwiek = 1 then
      begin
        Sound(200); Delay(200); NoSound;
      end;
      optimusilosc := optimusilosc - 1;
      optimuswartosc := optimuscenan * optimusilosc;
      wartosca:=agroswartosc+bigwartosc+bphwartosc+bskwartosc+ketywartosc+optimuswartosc+wedelwartosc+zywiecwartosc;
      gotowka := budzet - wartosca;
      wpisz_wartosci_optimus(sesja, optimuscenan, optimuscenas, optimusmin, optimusmax, optimuswartosc, optimusilosc);
      goto kupsel;
    end
    else
    begin
      budzet := gotowka + wartosca;
      czysc_finanse;
      pisz_finanse(gotowka, sumaa, budzet, wartosca);
      wpisz_wartosci_optimus(sesja, optimuscenan, optimuscenas, optimusmin, optimusmax, optimuswartosc, optimusilosc);
      goto kupsel;
    end;
  end;
  if czujnik_przesuwania = 7 then
  begin
    wedelilosc := wedelilosc + 1;
    wedelwartosc := wedelcenan * wedelilosc;
    wartosca:=agroswartosc+bigwartosc+bphwartosc+bskwartosc+ketywartosc+optimuswartosc+wedelwartosc+zywiecwartosc;
    gotowka := gotowka - wedelcenan;
    if gotowka < 0 then
    begin
      if dzwiek = 1 then
      begin
        Sound(200); Delay(200); NoSound;
      end;
      wedelilosc := wedelilosc - 1;
      wedelwartosc := wedelcenan * wedelilosc;
      wartosca:=agroswartosc+bigwartosc+bphwartosc+bskwartosc+ketywartosc+optimuswartosc+wedelwartosc+zywiecwartosc;
      gotowka := budzet - wartosca;
      wpisz_wartosci_wedel(sesja, wedelcenan, wedelcenas, wedelmin, wedelmax, wedelwartosc, wedelilosc);
      goto kupsel;
    end
    else
    begin
      budzet := gotowka + wartosca;
      czysc_finanse;
      pisz_finanse(gotowka, sumaa, budzet, wartosca);
      wpisz_wartosci_wedel(sesja, wedelcenan, wedelcenas, wedelmin, wedelmax, wedelwartosc, wedelilosc);
      goto kupsel;
    end;
  end;
  if czujnik_przesuwania = 8 then
  begin
    zywiecilosc := zywiecilosc + 1;
    zywiecwartosc := zywieccenan * zywiecilosc;
    wartosca:=agroswartosc+bigwartosc+bphwartosc+bskwartosc+ketywartosc+optimuswartosc+wedelwartosc+zywiecwartosc;
    gotowka := gotowka - zywieccenan;
    if gotowka < 0 then
    begin
      if dzwiek = 1 then
      begin
        Sound(200); Delay(200); NoSound;
      end;
      zywiecilosc := zywiecilosc - 1;
      zywiecwartosc := zywieccenan * zywiecilosc;
      wartosca:=agroswartosc+bigwartosc+bphwartosc+bskwartosc+ketywartosc+optimuswartosc+wedelwartosc+zywiecwartosc;
      gotowka := budzet - wartosca;
      wpisz_wartosci_zywiec(sesja, zywieccenan, zywieccenas, zywiecmin, zywiecmax, zywiecwartosc, zywiecilosc);
      goto kupsel;
    end
    else
    begin
      budzet := gotowka + wartosca;
      czysc_finanse;
      pisz_finanse(gotowka, sumaa, budzet, wartosca);
      wpisz_wartosci_zywiec(sesja, zywieccenan, zywieccenas, zywiecmin, zywiecmax, zywiecwartosc, zywiecilosc);
      goto kupsel;
    end;
  end;
  goto odswiez;

  { ============================= F3 : SPRZEDAŻ =================== line 1053 }
sprzedwybor:
  czujnik_przesuwania := 0;
sprzedsel:
  if czujnik_przesuwania = 0 then
  begin
    GotoXY(49,7);
    TextBackground(1);
    TextColor(15);
    Write(' ', agrosilosc, ' ');
    klaw2 := ReadKey;
    if klaw2 = #72 then czujnik_przesuwania := 8;
    if klaw2 = #80 then czujnik_przesuwania := 2;
    if klaw2 = #13 then goto sprzedaj;
    if klaw2 = #27 then goto odswiez;
    GotoXY(49,7);
    TextBackground(0);
    TextColor(15);
    Write(' ', agrosilosc, ' ');
    goto sprzedsel;
  end;
  if czujnik_przesuwania = 1 then
  begin
    GotoXY(49,7);
    TextBackground(1);
    TextColor(15);
    Write(' ', agrosilosc, ' ');
    klaw2 := ReadKey;
    if klaw2 = #72 then czujnik_przesuwania := 8;
    if klaw2 = #80 then czujnik_przesuwania := 2;
    if klaw2 = #13 then goto sprzedaj;
    if klaw2 = #27 then goto odswiez;
    GotoXY(49,7);
    TextBackground(0);
    TextColor(15);
    Write(' ', agrosilosc, ' ');
    goto sprzedsel;
  end;
  if czujnik_przesuwania = 2 then
  begin
    GotoXY(49,9);
    TextBackground(1);
    TextColor(15);
    Write(' ', bigilosc, ' ');
    klaw2 := ReadKey;
    if klaw2 = #72 then czujnik_przesuwania := 1;
    if klaw2 = #80 then czujnik_przesuwania := 3;
    if klaw2 = #13 then goto sprzedaj;
    if klaw2 = #27 then goto odswiez;
    GotoXY(49,9);
    TextBackground(0);
    TextColor(15);
    Write(' ', bigilosc, ' ');
    goto sprzedsel;
  end;
  if czujnik_przesuwania = 3 then
  begin
    GotoXY(49,11);
    TextBackground(1);
    TextColor(15);
    Write(' ', bphilosc, ' ');
    klaw2 := ReadKey;
    if klaw2 = #72 then czujnik_przesuwania := 2;
    if klaw2 = #80 then czujnik_przesuwania := 4;
    if klaw2 = #13 then goto sprzedaj;
    if klaw2 = #27 then goto odswiez;
    GotoXY(49,11);
    TextBackground(0);
    TextColor(15);
    Write(' ', bphilosc, ' ');
    goto sprzedsel;
  end;
  if czujnik_przesuwania = 4 then
  begin
    GotoXY(49,13);
    TextBackground(1);
    TextColor(15);
    Write(' ', bskilosc, ' ');
    klaw2 := ReadKey;
    if klaw2 = #72 then czujnik_przesuwania := 3;
    if klaw2 = #80 then czujnik_przesuwania := 5;
    if klaw2 = #13 then goto sprzedaj;
    if klaw2 = #27 then goto odswiez;
    GotoXY(49,13);
    TextBackground(0);
    TextColor(15);
    Write(' ', bskilosc, ' ');
    goto sprzedsel;
  end;
  if czujnik_przesuwania = 5 then
  begin
    GotoXY(49,15);
    TextBackground(1);
    TextColor(15);
    Write(' ', ketyilosc, ' ');
    klaw2 := ReadKey;
    if klaw2 = #72 then czujnik_przesuwania := 4;
    if klaw2 = #80 then czujnik_przesuwania := 6;
    if klaw2 = #13 then goto sprzedaj;
    if klaw2 = #27 then goto odswiez;
    GotoXY(49,15);
    TextBackground(0);
    TextColor(15);
    Write(' ', ketyilosc, ' ');
    goto sprzedsel;
  end;
  if czujnik_przesuwania = 6 then
  begin
    GotoXY(49,17);
    TextBackground(1);
    TextColor(15);
    Write(' ', optimusilosc, ' ');
    klaw2 := ReadKey;
    if klaw2 = #72 then czujnik_przesuwania := 5;
    if klaw2 = #80 then czujnik_przesuwania := 7;
    if klaw2 = #13 then goto sprzedaj;
    if klaw2 = #27 then goto odswiez;
    GotoXY(49,17);
    TextBackground(0);
    TextColor(15);
    Write(' ', optimusilosc, ' ');
    goto sprzedsel;
  end;
  if czujnik_przesuwania = 7 then
  begin
    GotoXY(49,19);
    TextBackground(1);
    TextColor(15);
    Write(' ', wedelilosc, ' ');
    klaw2 := ReadKey;
    if klaw2 = #72 then czujnik_przesuwania := 6;
    if klaw2 = #80 then czujnik_przesuwania := 8;
    if klaw2 = #13 then goto sprzedaj;
    if klaw2 = #27 then goto odswiez;
    GotoXY(49,19);
    TextBackground(0);
    TextColor(15);
    Write(' ', wedelilosc, ' ');
    goto sprzedsel;
  end;
  if czujnik_przesuwania = 8 then
  begin
    GotoXY(49,21);
    TextBackground(1);
    TextColor(15);
    Write(' ', zywiecilosc, ' ');
    klaw2 := ReadKey;
    if klaw2 = #72 then czujnik_przesuwania := 7;
    if klaw2 = #80 then czujnik_przesuwania := 1;
    if klaw2 = #13 then goto sprzedaj;
    if klaw2 = #27 then goto odswiez;
    GotoXY(49,21);
    TextBackground(0);
    TextColor(15);
    Write(' ', zywiecilosc, ' ');
    goto sprzedsel;
  end;
  goto sprzedsel;

sprzedaj:                                                         { line 1212 }
  if (czujnik_przesuwania = 0) or (czujnik_przesuwania = 1) then
  begin
    agrosilosc := agrosilosc - 1;
    agroswartosc := agroscenan * agrosilosc;
    wartosca:=agroswartosc+bigwartosc+bphwartosc+bskwartosc+ketywartosc+optimuswartosc+wedelwartosc+zywiecwartosc;
    gotowka := gotowka + agroscenan;
    if agrosilosc < 0 then
    begin
      if wartosca = 0 then gotow_zerowa := gotowka;
      if dzwiek = 1 then
      begin
        Sound(200); Delay(200); NoSound;
      end;
      agrosilosc := agrosilosc + 1;
      agroswartosc := agroscenan * agrosilosc;
      wartosca:=agroswartosc+bigwartosc+bphwartosc+bskwartosc+ketywartosc+optimuswartosc+wedelwartosc+zywiecwartosc;
      gotowka := budzet - wartosca;
      wpisz_wartosci_agros(sesja, agroscenan, agroscenas, agrosmin, agrosmax, agroswartosc, agrosilosc);
      goto sprzedsel;
    end
    else
    begin
      budzet := gotowka + wartosca;
      czysc_finanse;
      pisz_finanse(gotowka, sumaa, budzet, wartosca);
      wpisz_wartosci_agros(sesja, agroscenan, agroscenas, agrosmin, agrosmax, agroswartosc, agrosilosc);
      goto sprzedsel;
    end;
  end;
  if czujnik_przesuwania = 2 then
  begin
    bigilosc := bigilosc - 1;
    bigwartosc := bigcenan * bigilosc;
    wartosca:=agroswartosc+bigwartosc+bphwartosc+bskwartosc+ketywartosc+optimuswartosc+wedelwartosc+zywiecwartosc;
    gotowka := gotowka + bigcenan;
    if bigilosc < 0 then
    begin
      if wartosca = 0 then gotow_zerowa := gotowka;
      if dzwiek = 1 then
      begin
        Sound(200); Delay(200); NoSound;
      end;
      bigilosc := bigilosc + 1;
      bigwartosc := bigcenan * bigilosc;
      wartosca:=agroswartosc+bigwartosc+bphwartosc+bskwartosc+ketywartosc+optimuswartosc+wedelwartosc+zywiecwartosc;
      gotowka := budzet - wartosca;
      wpisz_wartosci_big(sesja, bigcenan, bigcenas, bigmin, bigmax, bigwartosc, bigilosc);
      goto sprzedsel;
    end
    else
    begin
      budzet := gotowka + wartosca;
      czysc_finanse;
      pisz_finanse(gotowka, sumaa, budzet, wartosca);
      wpisz_wartosci_big(sesja, bigcenan, bigcenas, bigmin, bigmax, bigwartosc, bigilosc);
      goto sprzedsel;
    end;
  end;
  if czujnik_przesuwania = 3 then
  begin
    bphilosc := bphilosc - 1;
    bphwartosc := bphcenan * bphilosc;
    wartosca:=agroswartosc+bigwartosc+bphwartosc+bskwartosc+ketywartosc+optimuswartosc+wedelwartosc+zywiecwartosc;
    gotowka := gotowka + bphcenan;
    if bphilosc < 0 then
    begin
      if wartosca = 0 then gotow_zerowa := gotowka;
      if dzwiek = 1 then
      begin
        Sound(200); Delay(200); NoSound;
      end;
      bphilosc := bphilosc + 1;
      bphwartosc := bphcenan * bphilosc;
      wartosca:=agroswartosc+bigwartosc+bphwartosc+bskwartosc+ketywartosc+optimuswartosc+wedelwartosc+zywiecwartosc;
      gotowka := budzet - wartosca;
      wpisz_wartosci_bph(sesja, bphcenan, bphcenas, bphmin, bphmax, bphwartosc, bphilosc);
      goto sprzedsel;
    end
    else
    begin
      budzet := gotowka + wartosca;
      czysc_finanse;
      pisz_finanse(gotowka, sumaa, budzet, wartosca);
      wpisz_wartosci_bph(sesja, bphcenan, bphcenas, bphmin, bphmax, bphwartosc, bphilosc);
      goto sprzedsel;
    end;
  end;
  if czujnik_przesuwania = 4 then
  begin
    bskilosc := bskilosc - 1;
    bskwartosc := bskcenan * bskilosc;
    wartosca:=agroswartosc+bigwartosc+bphwartosc+bskwartosc+ketywartosc+optimuswartosc+wedelwartosc+zywiecwartosc;
    gotowka := gotowka + bskcenan;
    if bskilosc < 0 then
    begin
      if wartosca = 0 then gotow_zerowa := gotowka;
      if dzwiek = 1 then
      begin
        Sound(200); Delay(200); NoSound;
      end;
      bskilosc := bskilosc + 1;
      bskwartosc := bskcenan * bskilosc;
      wartosca:=agroswartosc+bigwartosc+bphwartosc+bskwartosc+ketywartosc+optimuswartosc+wedelwartosc+zywiecwartosc;
      gotowka := budzet - wartosca;
      wpisz_wartosci_bsk(sesja, bskcenan, bskcenas, bskmin, bskmax, bskwartosc, bskilosc);
      goto sprzedsel;
    end
    else
    begin
      budzet := gotowka + wartosca;
      czysc_finanse;
      pisz_finanse(gotowka, sumaa, budzet, wartosca);
      wpisz_wartosci_bsk(sesja, bskcenan, bskcenas, bskmin, bskmax, bskwartosc, bskilosc);
      goto sprzedsel;
    end;
  end;
  if czujnik_przesuwania = 5 then
  begin
    ketyilosc := ketyilosc - 1;
    ketywartosc := ketycenan * ketyilosc;
    wartosca:=agroswartosc+bigwartosc+bphwartosc+bskwartosc+ketywartosc+optimuswartosc+wedelwartosc+zywiecwartosc;
    gotowka := gotowka + ketycenan;
    if ketyilosc < 0 then
    begin
      if wartosca = 0 then gotow_zerowa := gotowka;
      if dzwiek = 1 then
      begin
        Sound(200); Delay(200); NoSound;
      end;
      ketyilosc := ketyilosc + 1;
      ketywartosc := ketycenan * ketyilosc;
      wartosca:=agroswartosc+bigwartosc+bphwartosc+bskwartosc+ketywartosc+optimuswartosc+wedelwartosc+zywiecwartosc;
      gotowka := budzet - wartosca;
      wpisz_wartosci_kety(sesja, ketycenan, ketycenas, ketymin, ketymax, ketywartosc, ketyilosc);
      goto sprzedsel;
    end
    else
    begin
      budzet := gotowka + wartosca;
      czysc_finanse;
      pisz_finanse(gotowka, sumaa, budzet, wartosca);
      wpisz_wartosci_kety(sesja, ketycenan, ketycenas, ketymin, ketymax, ketywartosc, ketyilosc);
      goto sprzedsel;
    end;
  end;
  if czujnik_przesuwania = 6 then
  begin
    optimusilosc := optimusilosc - 1;
    optimuswartosc := optimuscenan * optimusilosc;
    wartosca:=agroswartosc+bigwartosc+bphwartosc+bskwartosc+ketywartosc+optimuswartosc+wedelwartosc+zywiecwartosc;
    gotowka := gotowka + optimuscenan;
    if optimusilosc < 0 then
    begin
      if wartosca = 0 then gotow_zerowa := gotowka;
      if dzwiek = 1 then
      begin
        Sound(200); Delay(200); NoSound;
      end;
      optimusilosc := optimusilosc + 1;
      optimuswartosc := optimuscenan * optimusilosc;
      wartosca:=agroswartosc+bigwartosc+bphwartosc+bskwartosc+ketywartosc+optimuswartosc+wedelwartosc+zywiecwartosc;
      gotowka := budzet - wartosca;
      wpisz_wartosci_optimus(sesja, optimuscenan, optimuscenas, optimusmin, optimusmax, optimuswartosc, optimusilosc);
      goto sprzedsel;
    end
    else
    begin
      budzet := gotowka + wartosca;
      czysc_finanse;
      pisz_finanse(gotowka, sumaa, budzet, wartosca);
      wpisz_wartosci_optimus(sesja, optimuscenan, optimuscenas, optimusmin, optimusmax, optimuswartosc, optimusilosc);
      goto sprzedsel;
    end;
  end;
  if czujnik_przesuwania = 7 then
  begin
    wedelilosc := wedelilosc - 1;
    wedelwartosc := wedelcenan * wedelilosc;
    wartosca:=agroswartosc+bigwartosc+bphwartosc+bskwartosc+ketywartosc+optimuswartosc+wedelwartosc+zywiecwartosc;
    gotowka := gotowka + wedelcenan;
    if wedelilosc < 0 then
    begin
      if wartosca = 0 then gotow_zerowa := gotowka;
      if dzwiek = 1 then
      begin
        Sound(200); Delay(200); NoSound;
      end;
      wedelilosc := wedelilosc + 1;
      wedelwartosc := wedelcenan * wedelilosc;
      wartosca:=agroswartosc+bigwartosc+bphwartosc+bskwartosc+ketywartosc+optimuswartosc+wedelwartosc+zywiecwartosc;
      gotowka := budzet - wartosca;
      wpisz_wartosci_wedel(sesja, wedelcenan, wedelcenas, wedelmin, wedelmax, wedelwartosc, wedelilosc);
      goto sprzedsel;
    end
    else
    begin
      budzet := gotowka + wartosca;
      czysc_finanse;
      pisz_finanse(gotowka, sumaa, budzet, wartosca);
      wpisz_wartosci_wedel(sesja, wedelcenan, wedelcenas, wedelmin, wedelmax, wedelwartosc, wedelilosc);
      goto sprzedsel;
    end;
  end;
  if czujnik_przesuwania = 8 then
  begin
    zywiecilosc := zywiecilosc - 1;
    zywiecwartosc := zywieccenan * zywiecilosc;
    wartosca:=agroswartosc+bigwartosc+bphwartosc+bskwartosc+ketywartosc+optimuswartosc+wedelwartosc+zywiecwartosc;
    gotowka := gotowka + zywieccenan;
    if zywiecilosc < 0 then
    begin
      if wartosca = 0 then gotow_zerowa := gotowka;
      if dzwiek = 1 then
      begin
        Sound(200); Delay(200); NoSound;
      end;
      zywiecilosc := zywiecilosc + 1;
      zywiecwartosc := zywieccenan * zywiecilosc;
      wartosca:=agroswartosc+bigwartosc+bphwartosc+bskwartosc+ketywartosc+optimuswartosc+wedelwartosc+zywiecwartosc;
      gotowka := budzet - wartosca;
      wpisz_wartosci_zywiec(sesja, zywieccenan, zywieccenas, zywiecmin, zywiecmax, zywiecwartosc, zywiecilosc);
      goto sprzedsel;
    end
    else
    begin
      budzet := gotowka + wartosca;
      czysc_finanse;
      pisz_finanse(gotowka, sumaa, budzet, wartosca);
      wpisz_wartosci_zywiec(sesja, zywieccenan, zywieccenas, zywiecmin, zywiecmax, zywiecwartosc, zywiecilosc);
      goto sprzedsel;
    end;
  end;
  goto odswiez;

  { ============================= F4 : PROGNOZY =================== line 1450 }
prognozy:
  progmenu;
  agros_prog(agrosczujnik, agrosprogn);
  big_prog(bigczujnik, bigprogn);
  bph_prog(bphczujnik, bphprogn);
  bsk_prog(bskczujnik, bskprogn);
  kety_prog(ketyczujnik, ketyprogn);
  optimus_prog(optimusczujnik, optimusprogn);
  wedel_prog(wedelczujnik, wedelprogn);
  zywiec_prog(zywiecczujnik, zywiecprogn);
  ReadLn;
  goto odswiez;

  { ============================= F5 : WYKRES ===================== line 1462 }
wykres:
  graphtryb;
  SetTextStyle(3, 0, 4);
  OutTextXY(50, 50, 'WYKRES W CZASIE PRODUKCJI !!!');
  Str(MemAvail, sra);
  OutTextXY(50, 100, sra);
  ReadLn;
  CloseGraph;
  goto odswiez;

  { ============================= F7 : ZAPIS ====================== line 1471 }
zapis:
  Assign(save, 'GAME.SAV');
  Rewrite(save);
  dane.imie1 := imie;          dane.sesja1 := sesja;
  dane.gotowka := gotowka;     dane.sumaa := sumaa;    dane.wartosca := wartosca;
  dane.budzet := budzet;       dane.gotowka_zerowa := gotow_zerowa;
  dane.agros1 := agroscenan;  dane.agros2 := agroscenas;  dane.agros3 := agrosmin;
  dane.agros4 := agrosmax;  dane.agros5 := agroswartosc;  dane.agros6 := agrosilosc;
  dane.agros7 := agrosoile;  dane.agros8 := agrosczujnik;  dane.agros9 := agrosryzyko;
  dane.agros10 := agrossesja;  dane.agros11 := agrossesjem;  dane.agros12 := agrosprogn;

  dane.big1 := bigcenan;  dane.big2 := bigcenas;  dane.big3 := bigmin;
  dane.big4 := bigmax;  dane.big5 := bigwartosc;  dane.big6 := bigilosc;
  dane.big7 := bigoile;  dane.big8 := bigczujnik;  dane.big9 := bigryzyko;
  dane.big10 := bigsesja;  dane.big11 := bigsesjem;  dane.big12 := bigprogn;

  dane.bph1 := bphcenan;  dane.bph2 := bphcenas;  dane.bph3 := bphmin;
  dane.bph4 := bphmax;  dane.bph5 := bphwartosc;  dane.bph6 := bphilosc;
  dane.bph7 := bphoile;  dane.bph8 := bphczujnik;  dane.bph9 := bphryzyko;
  dane.bph10 := bphsesja;  dane.bph11 := bphsesjem;  dane.bph12 := bphprogn;

  dane.bsk1 := bskcenan;  dane.bsk2 := bskcenas;  dane.bsk3 := bskmin;
  dane.bsk4 := bskmax;  dane.bsk5 := bskwartosc;  dane.bsk6 := bskilosc;
  dane.bsk7 := bskoile;  dane.bsk8 := bskczujnik;  dane.bsk9 := bskryzyko;
  dane.bsk10 := bsksesja;  dane.bsk11 := bsksesjem;  dane.bsk12 := bskprogn;

  dane.kety1 := ketycenan;  dane.kety2 := ketycenas;  dane.kety3 := ketymin;
  dane.kety4 := ketymax;  dane.kety5 := ketywartosc;  dane.kety6 := ketyilosc;
  dane.kety7 := ketyoile;  dane.kety8 := ketyczujnik;  dane.kety9 := ketyryzyko;
  dane.kety10 := ketysesja;  dane.kety11 := ketysesjem;  dane.kety12 := ketyprogn;

  dane.optimus1 := optimuscenan;  dane.optimus2 := optimuscenas;  dane.optimus3 := optimusmin;
  dane.optimus4 := optimusmax;  dane.optimus5 := optimuswartosc;  dane.optimus6 := optimusilosc;
  dane.optimus7 := optimusoile;  dane.optimus8 := optimusczujnik;  dane.optimus9 := optimusryzyko;
  dane.optimus10 := optimussesja;  dane.optimus11 := optimussesjem;  dane.optimus12 := optimusprogn;

  dane.wedel1 := wedelcenan;  dane.wedel2 := wedelcenas;  dane.wedel3 := wedelmin;
  dane.wedel4 := wedelmax;  dane.wedel5 := wedelwartosc;  dane.wedel6 := wedelilosc;
  dane.wedel7 := wedeloile;  dane.wedel8 := wedelczujnik;  dane.wedel9 := wedelryzyko;
  dane.wedel10 := wedelsesja;  dane.wedel11 := wedelsesjem;  dane.wedel12 := wedelprogn;

  dane.zywiec1 := zywieccenan;  dane.zywiec2 := zywieccenas;  dane.zywiec3 := zywiecmin;
  dane.zywiec4 := zywiecmax;  dane.zywiec5 := zywiecwartosc;  dane.zywiec6 := zywiecilosc;
  dane.zywiec7 := zywiecoile;  dane.zywiec8 := zywiecczujnik;  dane.zywiec9 := zywiecryzyko;
  dane.zywiec10 := zywiecsesja;  dane.zywiec11 := zywiecsesjem;  dane.zywiec12 := zywiecprogn;

  Reset(save);
  Write(save, dane);
  Close(save);
  goto odswiez;

  { ============================= F8 : ODCZYT ===================== line 1513 }
odczyt:
  Assign(save, 'GAME.SAV');
  Reset(save);
  Read(save, dane);
  imie := dane.imie1;          sesja := dane.sesja1;
  gotowka := dane.gotowka;     sumaa := dane.sumaa;    wartosca := dane.wartosca;
  budzet := dane.budzet;       gotow_zerowa := dane.gotowka_zerowa;
  agroscenan := dane.agros1;  agroscenas := dane.agros2;  agrosmin := dane.agros3;
  agrosmax := dane.agros4;  agroswartosc := dane.agros5;  agrosilosc := dane.agros6;
  agrosoile := dane.agros7;  agrosczujnik := dane.agros8;  agrosryzyko := dane.agros9;
  agrossesja := dane.agros10;  agrossesjem := dane.agros11;  agrosprogn := dane.agros12;

  bigcenan := dane.big1;  bigcenas := dane.big2;  bigmin := dane.big3;
  bigmax := dane.big4;  bigwartosc := dane.big5;  bigilosc := dane.big6;
  bigoile := dane.big7;  bigczujnik := dane.big8;  bigryzyko := dane.big9;
  bigsesja := dane.big10;  bigsesjem := dane.big11;  bigprogn := dane.big12;

  bphcenan := dane.bph1;  bphcenas := dane.bph2;  bphmin := dane.bph3;
  bphmax := dane.bph4;  bphwartosc := dane.bph5;  bphilosc := dane.bph6;
  bphoile := dane.bph7;  bphczujnik := dane.bph8;  bphryzyko := dane.bph9;
  bphsesja := dane.bph10;  bphsesjem := dane.bph11;  bphprogn := dane.bph12;

  bskcenan := dane.bsk1;  bskcenas := dane.bsk2;  bskmin := dane.bsk3;
  bskmax := dane.bsk4;  bskwartosc := dane.bsk5;  bskilosc := dane.bsk6;
  bskoile := dane.bsk7;  bskczujnik := dane.bsk8;  bskryzyko := dane.bsk9;
  bsksesja := dane.bsk10;  bsksesjem := dane.bsk11;  bskprogn := dane.bsk12;

  ketycenan := dane.kety1;  ketycenas := dane.kety2;  ketymin := dane.kety3;
  ketymax := dane.kety4;  ketywartosc := dane.kety5;  ketyilosc := dane.kety6;
  ketyoile := dane.kety7;  ketyczujnik := dane.kety8;  ketyryzyko := dane.kety9;
  ketysesja := dane.kety10;  ketysesjem := dane.kety11;  ketyprogn := dane.kety12;

  optimuscenan := dane.optimus1;  optimuscenas := dane.optimus2;  optimusmin := dane.optimus3;
  optimusmax := dane.optimus4;  optimuswartosc := dane.optimus5;  optimusilosc := dane.optimus6;
  optimusoile := dane.optimus7;  optimusczujnik := dane.optimus8;  optimusryzyko := dane.optimus9;
  optimussesja := dane.optimus10;  optimussesjem := dane.optimus11;  optimusprogn := dane.optimus12;

  wedelcenan := dane.wedel1;  wedelcenas := dane.wedel2;  wedelmin := dane.wedel3;
  wedelmax := dane.wedel4;  wedelwartosc := dane.wedel5;  wedelilosc := dane.wedel6;
  wedeloile := dane.wedel7;  wedelczujnik := dane.wedel8;  wedelryzyko := dane.wedel9;
  wedelsesja := dane.wedel10;  wedelsesjem := dane.wedel11;  wedelprogn := dane.wedel12;

  zywieccenan := dane.zywiec1;  zywieccenas := dane.zywiec2;  zywiecmin := dane.zywiec3;
  zywiecmax := dane.zywiec4;  zywiecwartosc := dane.zywiec5;  zywiecilosc := dane.zywiec6;
  zywiecoile := dane.zywiec7;  zywiecczujnik := dane.zywiec8;  zywiecryzyko := dane.zywiec9;
  zywiecsesja := dane.zywiec10;  zywiecsesjem := dane.zywiec11;  zywiecprogn := dane.zywiec12;

  Close(save);
  goto odswiez;

  { ============================= F6 : DŹWIĘK ===================== line 1554 }
dzwiekmenu:
  TextColor(10);
  GotoXY(24, 9);  Write('╔══════════════════════╗');
  GotoXY(24,10);  Write('║    DŹWIĘK - F1       ║');
  GotoXY(24,11);  Write('║    CISZA  - F2       ║');
  GotoXY(24,12);  Write('╚══════════════════════╝');
  klaw2 := ReadKey;
  if klaw2 = #59 then begin dzwiek := 1; Sound(5000); Delay(100); NoSound; end else
  if klaw2 = #60 then dzwiek := 0 else
  if klaw2 = #27 then goto odswiez else
  goto dzwiekmenu;

  Assign(plikcfg, 'GIELDA.CFG');
  Rewrite(plikcfg);
  Reset(plikcfg);
  if dzwiek = 1 then dzwiekop := 1;
  if dzwiek = 0 then dzwiekop := 0;
  Write(plikcfg, dzwiekop);
  Close(plikcfg);
  goto odswiez;

  { ============================= F10 : KONIEC ==================== line 1579 }
koniec:
  TextColor(7);
  TextBackground(0);
  ClrScr;
end.

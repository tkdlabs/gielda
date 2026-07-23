unit data1;

{ ============================================================================
  GIEŁDA — silnik cen / price engine.  Original: DATA1.PAS, 1997-03-11 20:09.
  Reconstructed from GIELDA.EXE debug info + disassembly (byte-identical
  for all 8 companies; only the first parameter name varied: cenan1..cenan8).
  ============================================================================ }

interface

uses Crt;

procedure agros_nowses(var cenan1, cenas, min, max, czujnik, ryzyko, sesja, sesjem : longint);
procedure big_nowses(var cenan2, cenas, min, max, czujnik, ryzyko, sesja, sesjem : longint);
procedure bph_nowses(var cenan3, cenas, min, max, czujnik, ryzyko, sesja, sesjem : longint);
procedure bsk_nowses(var cenan4, cenas, min, max, czujnik, ryzyko, sesja, sesjem : longint);
procedure kety_nowses(var cenan5, cenas, min, max, czujnik, ryzyko, sesja, sesjem : longint);
procedure optimus_nowses(var cenan6, cenas, min, max, czujnik, ryzyko, sesja, sesjem : longint);
procedure wedel_nowses(var cenan7, cenas, min, max, czujnik, ryzyko, sesja, sesjem : longint);
procedure zywiec_nowses(var cenan8, cenas, min, max, czujnik, ryzyko, sesja, sesjem : longint);

implementation

{ ------------------------------------------------------------------ AGROS }
procedure agros_nowses(var cenan1, cenas, min, max, czujnik, ryzyko, sesja, sesjem : longint);
var oile1 : integer;
begin
  oile1 := Round(cenas / 10);
  ryzyko := Random(6);
  if ryzyko <> 5 then
  begin
    cenas := cenan1;
    if czujnik = 1 then cenan1 := cenan1 + Random(oile1) + 1;
    if czujnik = 2 then cenan1 := cenan1 + Random(oile1) + 1;
    if czujnik = 3 then cenan1 := cenan1;
    if czujnik = 4 then cenan1 := cenan1 - Random(oile1) - 1;
    if czujnik = 5 then cenan1 := cenan1 - Random(oile1) - 1;
    sesjem := sesjem + 1;
    if sesja - sesjem > 0 then
    begin
      if cenan1 <= 50 then cenan1 := 50;
      if cenan1 > 50 then
      begin
        if cenan1 > max then max := cenan1;
        if cenan1 < min then min := cenan1;
        if cenan1 > 3000 then cenan1 := 3000;
      end;
    end;
  end;
  czujnik := Random(5) + 1;
  sesja := Random(50) + 1;
  sesjem := 0;
end;

{ ------------------------------------------------------------------ BIG }
procedure big_nowses(var cenan2, cenas, min, max, czujnik, ryzyko, sesja, sesjem : longint);
var oile : integer;
begin
  oile := Round(cenas / 10);
  ryzyko := Random(6);
  if ryzyko <> 5 then
  begin
    cenas := cenan2;
    if czujnik = 1 then cenan2 := cenan2 + Random(oile) + 1;
    if czujnik = 2 then cenan2 := cenan2 + Random(oile) + 1;
    if czujnik = 3 then cenan2 := cenan2;
    if czujnik = 4 then cenan2 := cenan2 - Random(oile) - 1;
    if czujnik = 5 then cenan2 := cenan2 - Random(oile) - 1;
    sesjem := sesjem + 1;
    if sesja - sesjem > 0 then
    begin
      if cenan2 <= 50 then cenan2 := 50;
      if cenan2 > 50 then
      begin
        if cenan2 > max then max := cenan2;
        if cenan2 < min then min := cenan2;
        if cenan2 > 3000 then cenan2 := 3000;
      end;
    end;
  end;
  czujnik := Random(5) + 1;
  sesja := Random(50) + 1;
  sesjem := 0;
end;

{ ------------------------------------------------------------------ BPH }
procedure bph_nowses(var cenan3, cenas, min, max, czujnik, ryzyko, sesja, sesjem : longint);
var oile : integer;
begin
  oile := Round(cenas / 10);
  ryzyko := Random(6);
  if ryzyko <> 5 then
  begin
    cenas := cenan3;
    if czujnik = 1 then cenan3 := cenan3 + Random(oile) + 1;
    if czujnik = 2 then cenan3 := cenan3 + Random(oile) + 1;
    if czujnik = 3 then cenan3 := cenan3;
    if czujnik = 4 then cenan3 := cenan3 - Random(oile) - 1;
    if czujnik = 5 then cenan3 := cenan3 - Random(oile) - 1;
    sesjem := sesjem + 1;
    if sesja - sesjem > 0 then
    begin
      if cenan3 <= 50 then cenan3 := 50;
      if cenan3 > 50 then
      begin
        if cenan3 > max then max := cenan3;
        if cenan3 < min then min := cenan3;
        if cenan3 > 3000 then cenan3 := 3000;
      end;
    end;
  end;
  czujnik := Random(5) + 1;
  sesja := Random(50) + 1;
  sesjem := 0;
end;

{ ------------------------------------------------------------------ BSK }
procedure bsk_nowses(var cenan4, cenas, min, max, czujnik, ryzyko, sesja, sesjem : longint);
var oile : integer;
begin
  oile := Round(cenas / 10);
  ryzyko := Random(6);
  if ryzyko <> 5 then
  begin
    cenas := cenan4;
    if czujnik = 1 then cenan4 := cenan4 + Random(oile) + 1;
    if czujnik = 2 then cenan4 := cenan4 + Random(oile) + 1;
    if czujnik = 3 then cenan4 := cenan4;
    if czujnik = 4 then cenan4 := cenan4 - Random(oile) - 1;
    if czujnik = 5 then cenan4 := cenan4 - Random(oile) - 1;
    sesjem := sesjem + 1;
    if sesja - sesjem > 0 then
    begin
      if cenan4 <= 50 then cenan4 := 50;
      if cenan4 > 50 then
      begin
        if cenan4 > max then max := cenan4;
        if cenan4 < min then min := cenan4;
        if cenan4 > 3000 then cenan4 := 3000;
      end;
    end;
  end;
  czujnik := Random(5) + 1;
  sesja := Random(50) + 1;
  sesjem := 0;
end;

{ ------------------------------------------------------------------ KĘTY }
procedure kety_nowses(var cenan5, cenas, min, max, czujnik, ryzyko, sesja, sesjem : longint);
var oile : integer;
begin
  oile := Round(cenas / 10);
  ryzyko := Random(6);
  if ryzyko <> 5 then
  begin
    cenas := cenan5;
    if czujnik = 1 then cenan5 := cenan5 + Random(oile) + 1;
    if czujnik = 2 then cenan5 := cenan5 + Random(oile) + 1;
    if czujnik = 3 then cenan5 := cenan5;
    if czujnik = 4 then cenan5 := cenan5 - Random(oile) - 1;
    if czujnik = 5 then cenan5 := cenan5 - Random(oile) - 1;
    sesjem := sesjem + 1;
    if sesja - sesjem > 0 then
    begin
      if cenan5 <= 50 then cenan5 := 50;
      if cenan5 > 50 then
      begin
        if cenan5 > max then max := cenan5;
        if cenan5 < min then min := cenan5;
        if cenan5 > 3000 then cenan5 := 3000;
      end;
    end;
  end;
  czujnik := Random(5) + 1;
  sesja := Random(50) + 1;
  sesjem := 0;
end;

{ ------------------------------------------------------------------ OPTIMUS }
procedure optimus_nowses(var cenan6, cenas, min, max, czujnik, ryzyko, sesja, sesjem : longint);
var oile : integer;
begin
  oile := Round(cenas / 10);
  ryzyko := Random(6);
  if ryzyko <> 5 then
  begin
    cenas := cenan6;
    if czujnik = 1 then cenan6 := cenan6 + Random(oile) + 1;
    if czujnik = 2 then cenan6 := cenan6 + Random(oile) + 1;
    if czujnik = 3 then cenan6 := cenan6;
    if czujnik = 4 then cenan6 := cenan6 - Random(oile) - 1;
    if czujnik = 5 then cenan6 := cenan6 - Random(oile) - 1;
    sesjem := sesjem + 1;
    if sesja - sesjem > 0 then
    begin
      if cenan6 <= 50 then cenan6 := 50;
      if cenan6 > 50 then
      begin
        if cenan6 > max then max := cenan6;
        if cenan6 < min then min := cenan6;
        if cenan6 > 3000 then cenan6 := 3000;
      end;
    end;
  end;
  czujnik := Random(5) + 1;
  sesja := Random(50) + 1;
  sesjem := 0;
end;

{ ------------------------------------------------------------------ WEDEL }
procedure wedel_nowses(var cenan7, cenas, min, max, czujnik, ryzyko, sesja, sesjem : longint);
var oile : integer;
begin
  oile := Round(cenas / 10);
  ryzyko := Random(6);
  if ryzyko <> 5 then
  begin
    cenas := cenan7;
    if czujnik = 1 then cenan7 := cenan7 + Random(oile) + 1;
    if czujnik = 2 then cenan7 := cenan7 + Random(oile) + 1;
    if czujnik = 3 then cenan7 := cenan7;
    if czujnik = 4 then cenan7 := cenan7 - Random(oile) - 1;
    if czujnik = 5 then cenan7 := cenan7 - Random(oile) - 1;
    sesjem := sesjem + 1;
    if sesja - sesjem > 0 then
    begin
      if cenan7 <= 50 then cenan7 := 50;
      if cenan7 > 50 then
      begin
        if cenan7 > max then max := cenan7;
        if cenan7 < min then min := cenan7;
        if cenan7 > 3000 then cenan7 := 3000;
      end;
    end;
  end;
  czujnik := Random(5) + 1;
  sesja := Random(50) + 1;
  sesjem := 0;
end;

{ ------------------------------------------------------------------ ŻYWIEC }
procedure zywiec_nowses(var cenan8, cenas, min, max, czujnik, ryzyko, sesja, sesjem : longint);
var oile : integer;
begin
  oile := Round(cenas / 10);
  ryzyko := Random(6);
  if ryzyko <> 5 then
  begin
    cenas := cenan8;
    if czujnik = 1 then cenan8 := cenan8 + Random(oile) + 1;
    if czujnik = 2 then cenan8 := cenan8 + Random(oile) + 1;
    if czujnik = 3 then cenan8 := cenan8;
    if czujnik = 4 then cenan8 := cenan8 - Random(oile) - 1;
    if czujnik = 5 then cenan8 := cenan8 - Random(oile) - 1;
    sesjem := sesjem + 1;
    if sesja - sesjem > 0 then
    begin
      if cenan8 <= 50 then cenan8 := 50;
      if cenan8 > 50 then
      begin
        if cenan8 > max then max := cenan8;
        if cenan8 < min then min := cenan8;
        if cenan8 > 3000 then cenan8 := 3000;
      end;
    end;
  end;
  czujnik := Random(5) + 1;
  sesja := Random(50) + 1;
  sesjem := 0;
end;

end.

unit import;

{ ============================================================================
  GIEŁDA — sterownik BGI i czcionka wlinkowane do EXE.
  EGAVGA.BGI 3.00 (Jul 15 1992) and SANS.CHR converted with BINOBJ:
      BINOBJ EGAVGA.BGI EGAVGA.OBJ EgaVgaDriver
      BINOBJ SANS.CHR   SANS.OBJ   SansFont
  ============================================================================ }

interface

procedure EgaVgaDriver;
procedure SansFont;

implementation

procedure EgaVgaDriver; external;
{$L EGAVGA.OBJ}

procedure SansFont; external;
{$L SANS.OBJ}

end.

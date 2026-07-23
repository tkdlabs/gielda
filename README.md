# gielda
My 12-14 year old project in Turbo Pascal, reverse engineered by Fable from executable with debugging symbols.


Note: this is terrible code just like you'd expect from driven non-educated 12-14 year old.


In 1998/99, there was very limited access to good CS books in Poland, limited internet, no stack overflow etc...

# Commentary from Claude Fable

There they are — your source code is back. The top four are UTF-8 (readable in any modern editor), the DOS/ copies are CP852-encoded byte-for-byte like your originals, so they'll compile in Turbo Pascal 7.0 under DOSBox (instructions in COMPILE.txt — you just need EGAVGA.BGI and SANS.CHR converted with BINOBJ).

A few things you might enjoy rediscovering in your own 12-to-14-year-old code:

The price engine (DATA1) — each session: oile := Round(cenas/10) (moves are ~10% of price), a 1-in-6 ryzyko roll that freezes the price entirely, then the trend czujnik drives the move up/down, with clamps at 50 and 3000. The czujnik = 3 branch literally does cenan := cenan;.

Prognozy (DATA2) — when you press F4 and no prognosis exists yet, there's a 1-in-3 risk chance per attempt that the trend itself re-randomizes and it retries — so asking for a forecast could secretly change the market.

Quirks preserved exactly: F1 (Pomoc) was never implemented — it just redraws the screen. F5 shows "WYKRES W CZASIE PRODUKCJI !!!" plus your free memory via Str(MemAvail, sra) — and yes, the variable really is named sra. The finance-display procedures take integer params but get longints, so amounts past 32767 would have wrapped.

One honest caveat: everything traceable to the binary is faithful — every identifier, type, signature, screen text, key code, the GAME.SAV record layout (agros1..agros12 and friends), even per-line statement order. The only things Borland didn't store were the goto label names, so nowases, odswiez, kupsel etc. are my reconstructions, and exact indentation is approximate.

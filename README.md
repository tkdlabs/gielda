# gielda
12-14 year old me project in Turbo Pascal, reverse engineered by Fable from executable with debugging symbols.


Note: this is terrible code just like you'd expect from driven non-educated 12-14 year old.


In 1998/99, there was very limited access to good CS books in Poland, limited internet, no stack overflow etc...

# Commentary from Claude Fable

## Initial investigation

Done — and this went far better than a typical lost-source recovery, because you compiled with debug info enabled. The EXE carries a full Turbo Debugger symbol table: 854 original identifier names, 664 symbols, and 2,107 line-number records.

Highlights of what came back:

Project layout — program gielda (G.PAS, ~1,582 lines, saved 1999‑02‑11 19:11) + three units: data1 (DATA1.PAS, the price engine — dated March 1997, two years older than the rest), data2 (DATA2.PAS, the F4 prognosis screens, ~896 lines), and import (EGAVGA BGI driver + SANS font linked in via the BINOBJ trick).

All 47 procedures with names, signatures, locals, and source line numbers — e.g. wpisz_wartosci_agros(sesjak, cenanw, cenast, mini, maxi, war, ilo) at line 197, agros_nowses(var cenan1, cenas, min, max, czujnik, ryzyko, sesja, sesjem) at DATA1.PAS:17, the Corupt fake-corruption error handler at line 441, and a ~1,128-line main body holding the whole event loop (F2 Kupno / F3 Sprzedaż are inline, not procedures). Fun fossil: the copy-pasted *_nowses procedures have their first parameter named cenan1 through cenan8.

Your save file decoded — GAME.SAV is the 418-byte rekord type; the save shows session 8, 2,390 zł cash from a 2,000 zł start, no shares held, with full price/min/max/risk state for AGROS, BIG, BPH, BSK, KĘTY, OPTIMUS, WEDEL and ŻYWIEC. GIELDA.CFG is just the 1-byte sound flag.

## Final Result

There they are — your source code is back. The top four are UTF-8 (readable in any modern editor), the DOS/ copies are CP852-encoded byte-for-byte like your originals, so they'll compile in Turbo Pascal 7.0 under DOSBox (instructions in COMPILE.txt — you just need EGAVGA.BGI and SANS.CHR converted with BINOBJ).

A few things you might enjoy rediscovering in your own 12-to-14-year-old code:

The price engine (DATA1) — each session: oile := Round(cenas/10) (moves are ~10% of price), a 1-in-6 ryzyko roll that freezes the price entirely, then the trend czujnik drives the move up/down, with clamps at 50 and 3000. The czujnik = 3 branch literally does cenan := cenan;.

Prognozy (DATA2) — when you press F4 and no prognosis exists yet, there's a 1-in-3 risk chance per attempt that the trend itself re-randomizes and it retries — so asking for a forecast could secretly change the market.

Quirks preserved exactly: F1 (Pomoc) was never implemented — it just redraws the screen. F5 shows "WYKRES W CZASIE PRODUKCJI !!!" plus your free memory via Str(MemAvail, sra) — and yes, the variable really is named sra. The finance-display procedures take integer params but get longints, so amounts past 32767 would have wrapped.

One honest caveat: everything traceable to the binary is faithful — every identifier, type, signature, screen text, key code, the GAME.SAV record layout (agros1..agros12 and friends), even per-line statement order. The only things Borland didn't store were the goto label names, so nowases, odswiez, kupsel etc. are my reconstructions, and exact indentation is approximate.

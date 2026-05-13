#import "lib.typ": *

#note[
  Rozkład ujemnno dwumianowy $cal(N B) (r, p)$
  - $r$ - ilosc sukcesow przed zakonczeniem eksperymentu
  - $p$ - prawdopodobienstwo sukcesu

  Ile razy się wyjebie przed $r$-tym sukcesem.

  Nośnik $x$ - ile razy się wyjebie.

  $
    f(x;theta) = underbrace(binom(x+r-1, x), "na ile sposobów mogę ustawić porażki") quad underbrace(p^r, "to że się uda r razy") quad underbrace((1-p)^k, "to że się zjebie k razy")
  $
]

#note[
  y' = 1/y => y = e^t
]

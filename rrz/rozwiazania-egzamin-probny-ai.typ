#import "Równania Różniczkowe Zwyczajne — Listy/RRZ/lib.typ": *

#set text(lang: "pl", size: 10.5pt)
#set par(leading: 0.72em, justify: true)
#show math.equation: set block(above: 0.6em, below: 0.6em)

#let green = rgb("#0c6b53")
#let orange = rgb("#c96732")
#let pale-green = rgb("#e7f2ed")
#let pale-orange = rgb("#faece2")

#let metoda(body) = block(
  width: 100%,
  fill: pale-green,
  stroke: 0.6pt + green,
  radius: 4pt,
  inset: 8pt,
  above: 0.4em,
  below: 0.8em,
)[
  #text(fill: green, weight: "bold")[Metoda z kursu:] #body
]

#let wynik(body) = block(
  width: 100%,
  fill: pale-orange,
  stroke: 0.8pt + orange,
  radius: 4pt,
  inset: 9pt,
  above: 0.8em,
  below: 0.8em,
)[
  #text(fill: orange, weight: "bold")[Wynik.] #body
]

#align(center)[
  #text(size: 25pt, weight: "bold", fill: green)[Równania różniczkowe zwyczajne] \
  #v(0.4em)
  #text(size: 17pt, weight: "semibold")[Rozwiązania przykładowego egzaminu] \
  #v(1em)
  #text(size: 10pt, fill: luma(90))[Metody zgodne z wykładem i listami zadań 1–10]
]

#v(1.5em)
#block(fill: luma(245), inset: 10pt, radius: 5pt, width: 100%)[
  W każdym zadaniu najpierw wskazano rozpoznany typ i metodę. Przy dzieleniu przez
  wyrażenie mogące się zerować rozpatrzono osobno utracone rozwiązania. Dziedziny
  podano tam, gdzie wpływają na rozwiązanie.
]

#v(1em)
#outline(title: "Spis treści", depth: 2)
#pagebreak()

#zadanie("1")[
  Rozwiązać układ
  $ cases(x' = 2x + y + 2e^t, y' = x + 2y - 3e^(4t)). $
]
#rozwiazanie[
  #metoda[Układ liniowy niejednorodny o stałej macierzy: diagonalizacja układu
    jednorodnego i uzmiennianie stałych w bazie własnej.]

  Zapisujemy
  $
    "X"' = A "X" + h(t), quad
    A = mat(2, 1; 1, 2), quad
    h(t) = mat(2e^t; -3e^(4t)).
  $
  Wielomian charakterystyczny i wektory własne są równe
  $
    det(A-lambda I) = (2-lambda)^2-1
    = (lambda-1)(lambda-3),
  $
  $
    lambda_1=1, quad v_1=mat(1; -1),
    quad quad lambda_2=3, quad v_2=mat(1; 1).
  $
  Niech
  $
    P=mat(1, 1; -1, 1), quad
    P^(-1)=1/2 mat(1, -1; 1, 1), quad
    "X"=P mat(alpha; beta).
  $
  Po przemnożeniu przez $P^(-1)$ otrzymujemy dwa równania skalarne:
  $
    mat(alpha'; beta')
    = mat(1, 0; 0, 3) mat(alpha; beta)
    + mat(e^t + 3/2 e^(4t); e^t - 3/2 e^(4t)).
  $
  Zatem
  $
    alpha' - alpha & = e^t + 3/2 e^(4t), \
     beta' - 3beta & = e^t - 3/2 e^(4t).
  $
  W pierwszym równaniu składnik $e^t$ jest rezonansowy. Rozwiązania mają postać
  $
    alpha(t) & = C_1 e^t + t e^t + 1/2 e^(4t), \
     beta(t) & = C_2 e^(3t) - 1/2 e^t - 3/2 e^(4t).
  $
  Wracamy do $x=alpha+beta$, $y=-alpha+beta$.

  #wynik[
    $
      x(t) & = C_1 e^t+C_2 e^(3t)+(t-1/2)e^t-e^(4t), \
      y(t) & = -C_1 e^t+C_2 e^(3t)-(t+1/2)e^t-2e^(4t).
    $
  ]
]

#zadanie("2")[
  Rozwiązać zagadnienie
  $ cases(x' + 2e^t x - x^2 = e^(2t)+e^t, x(0)=3) $
  i podać dziedzinę rozwiązania nieprzedłużalnego.
]
#rozwiazanie[
  #metoda[Równanie Riccatiego ze znanym lub łatwym do odgadnięcia rozwiązaniem
    szczególnym.]

  Widać, że $phi(t)=e^t$ spełnia równanie, ponieważ
  $
    phi' + 2e^t phi - phi^2
    = e^t+2e^(2t)-e^(2t)=e^t+e^(2t).
  $
  Podstawiamy $x=phi+u=e^t+u$. Po skróceniu równania spełnianego przez $phi$
  pozostaje
  $
    u'-u^2=0, quad u(0)=x(0)-1=2.
  $
  Rozdzielamy zmienne:
  $
    (dif u)/(u^2)=dif t
    quad => quad -1/u=t+C
    quad => quad u(t)=2/(1-2t).
  $
  Jedyna osobliwość wzoru występuje dla $t=1/2$. Największy przedział
  zawierający punkt początkowy $t_0=0$ to $(-oo,1/2)$.

  #wynik[
    $ x(t)=e^t+2/(1-2t), quad quad cal(D)=(-oo,1/2). $
  ]
]

#zadanie("3")[
  Dla układu
  $ cases(x'=-x(1+x^2-2x y), y'=y(1-x y)) $
  znaleźć punkty krytyczne i zbadać ich stabilność.
]
#rozwiazanie[
  #metoda[Punkty równowagi, macierz Jacobiego i klasyfikacja na podstawie części
    rzeczywistych wartości własnych.]

  Punkty krytyczne spełniają
  $
    x(1+x^2-2x y)=0, quad quad y(1-x y)=0.
  $
  Jeśli $x=0$, to z drugiego równania $y=0$. Dla $x!=0$ pierwsza nawiasowa
  część musi być zerem. Przypadek $y=0$ nie daje rozwiązania rzeczywistego,
  więc $x y=1$, a wtedy
  $
    1+x^2-2x y=x^2-1=0.
  $
  Otrzymujemy trzy punkty:
  $ (0,0), (1,1), (-1,-1). $

  Dla
  $
    f=-x-x^3+2x^2 y, quad quad g=y-x y^2
  $
  macierz Jacobiego wynosi
  $
    J(x,y)=mat(-1-3x^2+4x y, 2x^2; -y^2, 1-2x y).
  $

  W punkcie $(0,0)$:
  $
    J(0,0)=mat(-1, 0; 0, 1), quad quad lambda_1=-1, lambda_2=1.
  $
  Jest to punkt siodłowy, zatem niestabilny.

  W obu punktach $(1,1)$ i $(-1,-1)$ macierz jest taka sama:
  $
    J=mat(0, 2; -1, -1), quad quad
    det(J-lambda I)=lambda^2+lambda+2.
  $
  Stąd
  $
    lambda_(1,2)=(-1 plus.minus i sqrt(7))/2.
  $
  Obie części rzeczywiste są ujemne, więc oba punkty są ogniskami
  asymptotycznie stabilnymi.

  #wynik[
    $(0,0)$ — siodło niestabilne; $(1,1)$ i $(-1,-1)$ — ogniska
    asymptotycznie stabilne.
  ]
]

#zadanie("4")[
  Scałkować metodą czynnika całkującego
  $
    (2/y+y/x^3) dif x + (1/(x y)-2/x^2) dif y=0.
  $
]
#rozwiazanie[
  #metoda[Równanie w postaci Leibniza; czynnik całkujący zależny od
    $S(x,y)=x y$, a następnie odtworzenie funkcji pierwotnej.]

  Oznaczamy
  $
    P=2/y+y/x^3, quad quad Q=1/(x y)-2/x^2.
  $
  Równanie nie jest zupełne, bo $P_y != Q_x$. Dla czynnika postaci
  $mu(S)$ z wykładu stosujemy
  $
    (mu'(S))/(mu(S))=(P_y-Q_x)/(Q S_x-P S_y).
  $
  Bierzemy $S=x y$, więc $S_x=y$, $S_y=x$. Bezpośrednie uproszczenie daje
  $
    (P_y-Q_x)/(Q y-P x)=1/(x y)=1/S.
  $
  Zatem
  $
    (mu'(S))/(mu(S))=1/S
    quad => quad mu(S)=C S.
  $
  Możemy przyjąć $mu(x, y)=x y$. Po przemnożeniu równania dostajemy
  $
    (2x+y^2/x^2) dif x + (1-2y/x) dif y=0.
  $
  Teraz równanie jest zupełne. Szukamy $Phi$:
  $
    Phi_x=2x+y^2/x^2
    quad => quad Phi=x^2-y^2/x+C(y).
  $
  Porównanie pochodnej po $y$ z drugim współczynnikiem daje
  $
    Phi_y=-2y/x+C'(y)=1-2y/x,
    quad quad C'(y)=1,
  $
  czyli $C(y)=y$.

  #wynik[
    Całka równania ma postać
    $ x^2-y^2/x+y=C. $
    Obliczenia prowadzone są na składowych obszaru $x!=0$, $y!=0$.
  ]
]

#zadanie("5")[
  Znaleźć rozwiązanie ogólne
  $ 4t x''+2x'-x=sqrt(t) $
  za pomocą podstawienia $s=sqrt(t)$.
]
#rozwiazanie[
  #metoda[Zmiana zmiennej niezależnej sprowadzająca równanie do równania
    liniowego o stałych współczynnikach.]

  Dla $t>0$ piszemy $t=s^2$ i $x(t)=X(s)$. Ponieważ
  $
    (dif s)/(dif t)=1/(2s),
  $
  otrzymujemy
  $
    x'=(X_s)/(2s), quad quad
    x''=(X_(s s))/(4s^2)-(X_s)/(4s^3).
  $
  Po podstawieniu:
  $
    4s^2 ((X_(s s))/(4s^2)-(X_s)/(4s^3))
    +2 (X_s)/(2s)-X=s.
  $
  Składniki z $X_s$ redukują się i zostaje
  $
    X_(s s)-X=s.
  $
  Równanie jednorodne ma pierwiastki $lambda=plus.minus 1$, a rozwiązaniem
  szczególnym jest $X_p=-s$. Zatem
  $
    X(s)=C_1 e^s+C_2 e^(-s)-s.
  $

  #wynik[
    $ x(t)=C_1 e^(sqrt(t))+C_2 e^(-sqrt(t))-sqrt(t), quad quad t>0. $

    Podrodzina spełniająca $C_1-C_2=1$ przedłuża się jako funkcja klasy $C^1$
    przez punkt osobliwy $t=0$.
  ]
]

#zadanie("6")[
  Pokazać, że tylko jedno rozwiązanie równania
  $ t x'-(2t^2+1)x=t^2 $
  ma skończoną granicę dla $t->oo$, i wyznaczyć tę granicę.
]
#rozwiazanie[
  #metoda[Równanie liniowe I rzędu; dobór stałej przez warunek asymptotyczny.]

  Dla $t>0$ dzielimy przez $t$:
  $
    x'-(2t+1/t)x=t.
  $
  Czynnik całkujący jest równy
  $
    mu(t)=exp(integral (-2t-1/t) dif t)=e^(-t^2)/t.
  $
  Zatem
  $
    (e^(-t^2)/t x)'=e^(-t^2).
  $
  Wszystkie rozwiązania na $(0,oo)$ można zapisać w postaci
  $
    x(t)=t e^(t^2) (C+integral_1^t e^(-s^2) dif s).
  $
  Oznaczmy
  $
    A=integral_1^oo e^(-s^2) dif s.
  $
  Jest to liczba skończona, ponieważ całka Gaussa jest zbieżna. Wobec tego
  $
    C+integral_1^t e^(-s^2) dif s -> C+A.
  $
  Jednocześnie $t e^(t^2)->oo$. Jeśli $C+A!=0$, nawias dąży do liczby
  niezerowej, więc iloczyn nie może mieć skończonej granicy. Konieczne jest
  zatem dokładne skasowanie granicy nawiasu:
  $
    C+A=0 quad <==> quad C=-A.
  $
  Dla tego wyboru stałej
  $
    C+integral_1^t e^(-s^2) dif s & =-integral_1^oo e^(-s^2) dif s+integral_1^t e^(-s^2) dif s \
                                  & =-integral_t^oo e^(-s^2) dif s.
  $
  Odejmujemy tu całkę od $1$ do $oo$ od całki od $1$ do $t$; pozostaje
  minus „ogon” od $t$ do $oo$. Dlatego jedyne możliwe rozwiązanie to
  $
    x_*(t)=-t e^(t^2) integral_t^oo e^(-s^2) dif s.
  $
  Pozostaje policzyć granicę. Iloczyn zapisujemy jako iloraz:
  $
    t e^(t^2) integral_t^oo e^(-s^2) dif s
    = (integral_t^oo e^(-s^2) dif s)/(e^(-t^2)/t).
  $
  Licznik i mianownik dążą do zera, więc stosujemy regułę de l'Hospitala.
  Potrzebne pochodne to
  $
    (integral_t^oo e^(-s^2) dif s)' & = -e^(-t^2), \
                      (e^(-t^2)/t)' & = -2e^(-t^2)-e^(-t^2)/t^2 \
                                    & = -e^(-t^2)(2+1/t^2).
  $
  Wobec tego
  $
    lim_(t->oo)
    (integral_t^oo e^(-s^2) dif s)/(e^(-t^2)/t) & = lim_(t->oo)
                                                  (-e^(-t^2))/(-e^(-t^2)(2+1/t^2)) \
                                                & = lim_(t->oo) 1/(2+1/t^2)=1/2.
  $
  W rozwiązaniu $x_*$ przed tym wyrażeniem stoi znak minus, dlatego
  $lim_(t->oo)x_*(t)=-1/2$.

  #wynik[
    Jedynym rozwiązaniem o skończonej granicy jest
    $ x_*(t)=-t e^(t^2) integral_t^oo e^(-s^2) dif s, $
    a $ lim_(t->oo) x_*(t)=-1/2. $
  ]
]

#zadanie("7")[
  Rozwiązać dla $t>0$ równanie
  $ t x'+x=x^2 ln t. $
]
#rozwiazanie[
  #metoda[Równanie Bernoulliego z wykładnikiem $p=2$.]

  Po podzieleniu przez $t$:
  $
    x'+1/t x=(ln t)/t x^2.
  $
  Najpierw zauważamy rozwiązanie $x(t) equiv 0$. Dla $x!=0$ podstawiamy
  $u=x^(-1)$. Ponieważ $u'=-x'/x^2$, otrzymujemy równanie liniowe
  $
    u'-1/t u=-(ln t)/t.
  $
  Jego czynnik całkujący to $1/t$, więc
  $
    (u/t)'=-(ln t)/t^2.
  $
  Ponieważ
  $
    integral -(ln t)/t^2 dif t=(ln t+1)/t,
  $
  mamy
  $
    u/t=(ln t+1)/t+C,
    quad quad u=1+ln t+C t.
  $

  #wynik[
    $ x(t) equiv 0 $
    albo
    $ x(t)=1/(1+ln t+C t). $

    Dla każdego $C$ dziedziną jest dowolna składowa zbioru
    ${t>0: 1+ln t+C t!=0}$.
  ]
]

#zadanie("8")[
  Wyznaczyć macierz fundamentalną i rozwiązanie ogólne układu
  $ cases(x'=3x-y, y'=x+y). $
]
#rozwiazanie[
  #metoda[Macierz wykładnicza i klatka Jordana.]

  Macierz układu to
  $
    A=mat(3, -1; 1, 1).
  $
  Wielomian charakterystyczny wynosi
  $
    det(A-lambda I)=(lambda-2)^2.
  $
  Wartość $lambda=2$ ma jeden kierunek własny, więc macierz nie jest
  diagonalizowalna. Zapisujemy
  $
    A=2I+N, quad quad N=A-2I=mat(1, -1; 1, -1).
  $
  Ponieważ $N^2=0$, szereg wykładniczy urywa się:
  $
    e^(t A)=e^(2t)e^(t N)=e^(2t)(I+t N).
  $
  Stąd unormowana macierz fundamentalna ($Phi(0)=I$) jest równa
  $
    Phi(t)=e^(2t) mat(1+t, -t; t, 1-t).
  $
  Jej wyznacznik to $e^(4t)!=0$.

  #wynik[
    $
      mat(x(t); y(t))
      = e^(2t) mat(1+t, -t; t, 1-t) mat(C_1; C_2),
    $
    czyli
    $
      x(t) & =e^(2t)((1+t)C_1-t C_2), \
      y(t) & =e^(2t)(t C_1+(1-t)C_2).
    $
  ]
]

#zadanie("9")[
  Korzystając z transformaty Laplace'a, rozwiązać
  $ cases(x''-2x'+x=t e^t, x(0)=0, x'(0)=1). $
]
#rozwiazanie[
  #metoda[Transformata Laplace'a z warunkami początkowymi.]

  Niech $X(s)=cal(L)[x(t)](s)$. Wówczas
  $
      cal(L)[x''] & = s^2 X-s x(0)-x'(0)=s^2 X-1, \
       cal(L)[x'] & = s X-x(0)=s X, \
    cal(L)[t e^t] & = 1/(s-1)^2.
  $
  Po transformacji równania:
  $
    (s^2 X-1)-2s X+X=1/(s-1)^2,
  $
  zatem
  $
    (s-1)^2X=1+1/(s-1)^2,
    quad quad X=1/(s-1)^2+1/(s-1)^4.
  $
  Korzystamy ze wzoru
  $
    cal(L)^(-1)[1/(s-a)^(n+1)]=t^n/n! e^(at).
  $

  #wynik[
    $ x(t)=t e^t+t^3/6 e^t=e^t(t+t^3/6). $
  ]
]

#zadanie("10")[
  Dla zagadnienia
  $
    y''+t y'+3y=0, quad quad y(0)=2, quad quad y'(0)=-1
  $
  i szeregu $y(t)=sum_(n=0)^oo a_n t^n$ wyznaczyć $a_n$ dla $0<=n<=5$.
]
#rozwiazanie[
  #metoda[Metoda szeregów potęgowych i wyrównanie współczynników przy $t^n$.]

  W arkuszu zamiennie użyto liter $x$, $y$ i $t$; przyjmujemy $t$ jako zmienną
  niezależną. Zaczynamy od
  $
    y(t)=sum_(n=0)^oo a_n t^n.
  $
  Po zróżniczkowaniu i przesunięciu indeksu:
  $
     y' & = sum_(n=1)^oo n a_n t^(n-1)
          =sum_(n=0)^oo (n+1)a_(n+1)t^n, \
    y'' & = sum_(n=0)^oo (n+2)(n+1)a_(n+2)t^n.
  $
  Składnik $t y'$ otrzymujemy przez zwykłe pomnożenie szeregu pochodnej
  przez $t$:
  $
    t y' & =t sum_(n=1)^oo n a_n t^(n-1) \
         & =sum_(n=1)^oo n a_n t^n
           =sum_(n=0)^oo n a_n t^n.
  $
  Ostatnią sumę wolno rozpocząć od $n=0$, ponieważ jej zerowy wyraz to
  $0 dot a_0 dot t^0=0$. Wprost:
  $
      y' & =a_1+2a_2 t+3a_3 t^2+dots, \
    t y' & =a_1 t+2a_2 t^2+3a_3 t^3+dots.
  $
  Po podstawieniu:
  $
    sum_(n=0)^oo
    ((n+2)(n+1)a_(n+2)+(n+3)a_n)t^n=0.
  $
  Dostajemy rekurencję
  $
    a_(n+2)=-(n+3)/((n+2)(n+1)) a_n.
  $
  Warunki początkowe dają $a_0=2$ oraz $a_1=-1$. Kolejno:
  $
    a_2 & = -3/2 a_0=-3, \
    a_3 & = -4/6 a_1=2/3, \
    a_4 & = -5/12 a_2=5/4, \
    a_5 & = -6/20 a_3=-1/5.
  $

  #wynik[
    $
      (a_0,a_1,a_2,a_3,a_4,a_5)
      =(2,-1,-3,2/3,5/4,-1/5).
    $
  ]
]

#zadanie("11")[
  Stosując $x'=u$, rozwiązać równanie Clairauta
  $ x=t x'+(x')^2 $
  i znaleźć rozwiązanie osobliwe.
]
#rozwiazanie[
  #metoda[Równanie Clairauta: różniczkowanie i rozdzielenie na dwie gałęzie.]

  Niech $u=x'$. Równanie ma postać
  $
    x=t u+u^2.
  $
  Różniczkujemy obie strony po $t$:
  $
    u=u+t u'+2u u',
  $
  więc
  $
    (t+2u)u'=0.
  $
  Są dwa przypadki:

  + $u'=0$. Wtedy $u=C$ i po podstawieniu do równania wyjściowego
    $ x=C t+C^2. $
  + $t+2u=0$. Wtedy $u=-t/2$, a z równania wyjściowego
    $
      x=t(-t/2)+(-t/2)^2=-t^2/4.
    $

  *Dlaczego jest to rozwiązanie osobliwe?* Funkcja $x_s(t)=-t^2/4$ spełnia
  równanie, ale nie należy do rodziny $x_C(t)=C t+C^2$ dla żadnej ustalonej
  stałej $C$. Aby ją uzyskać, trzeba byłoby przyjąć $C=-t/2$, czyli wartość
  zależną od $t$, a nie stałą całkowania.

  *Dlaczego jest to obwiednia?* Obwiednia jest krzywą styczną do każdego
  elementu rodziny w odpowiednim punkcie. Dla
  $
    F(t,C)=C t+C^2
  $
  wyznaczamy ją z układu
  $
    x=F(t,C), quad quad (partial F)/(partial C)=t+2C=0.
  $
  Stąd $C=-t/2$, a po wyeliminowaniu parametru
  $
    x=F(t,-t/2)=-t^2/4.
  $
  Rzeczywiście prosta o parametrze $C$ styka się z parabolą dla $t=-2C$:
  obie mają wtedy wartość $-C^2$, a ich pochodne są równe
  $
    x_C'=C, quad quad x_s'(-2C)=-(-2C)/2=C.
  $

  #align(center)[
    #image("obwiednia-clairauta-zad11.svg", width: 92%)
  ]

  #wynik[
    Rodzina rozwiązań ogólnych to $x=C t+C^2$, a jej obwiednią i rozwiązaniem
    osobliwym jest $x_s(t)=-t^2/4$.
  ]
]

#zadanie("12")[
  Dla układu
  $
    mat(x'; y')=mat(1, -4; 1, 1)mat(x; y)
  $
  określić typ i stabilność punktu równowagi oraz naszkicować portret fazowy.
]
#rozwiazanie[
  #metoda[Klasyfikacja liniowego układu płaskiego przez wartości własne oraz
    odczyt kierunku obrotu z pola wektorowego.]

  Układ ma postać $"X"'=A"X"$, gdzie
  $
    A=mat(1, -4; 1, 1).
  $

  *Punkt równowagi.* Punkt $"X"_*$ jest stacjonarny wtedy i tylko wtedy, gdy
  $A"X"_*=0$. Ponieważ
  $
    det A=1 dot 1-(-4)dot 1=5!=0,
  $
  macierz $A$ jest odwracalna, a jej jądro zawiera wyłącznie wektor zerowy.
  Dlatego jedynym punktem równowagi jest $(0,0)$.

  *Typ i stabilność.* Wielomian charakterystyczny wynosi
  $
    det(A-lambda I)
    =mat(1-lambda, -4; 1, 1-lambda; delim: "|")
    =(1-lambda)^2+4.
  $
  Równanie charakterystyczne daje
  $
    lambda_(1,2)=1 plus.minus 2i.
  $
  Część urojona $plus.minus 2i$ odpowiada za obrót, więc punkt jest ogniskiem.
  Część rzeczywista jest dodatnia i równa $1$, dlatego amplituda rośnie jak
  $e^t$: ognisko jest niestabilne.

  *Skąd bierze się macierz $e^(t A)$?* Rozkładamy
  $
    A=I+B, quad quad B=mat(0, -4; 1, 0), quad quad B^2=-4I.
  $
  Macierze $I$ i $B$ komutują, więc
  $
    e^(t A)=e^(t I)e^(t B)=e^t e^(t B).
  $
  Ponieważ $B^2=-4I$, parzyste potęgi szeregu wykładniczego tworzą
  $I cos(2t)$, a nieparzyste $(B/2)sin(2t)$. Otrzymujemy
  $
    e^(t A)=e^t (I cos(2t)+B/2 sin(2t))
    =e^t mat(cos(2t), -2sin(2t); 1/2 sin(2t), cos(2t)).
  $
  Dla warunku początkowego $(x(0),y(0))=(x_0,y_0)$ rozwiązanie ma więc postać
  $
    x(t) & =e^t(x_0 cos(2t)-2y_0 sin(2t)), \
    y(t) & =e^t(1/2 x_0 sin(2t)+y_0 cos(2t)).
  $

  *Dlaczego zmieniamy $u=x$, $v=2y$?* Ta zmiana usuwa nierówne współczynniki
  przy sinusie i pozwala mierzyć zwykły promień. Z równań
  $x'=x-4y$, $y'=x+y$ otrzymujemy
  $
    u' & =u-2v, \
    v' & =2u+v.
  $
  Niech $r^2=u^2+v^2$. Wtedy
  $
    (r^2)' & =2u u'+2v v' \
           & =2u(u-2v)+2v(2u+v) \
           & =2(u^2+v^2)=2r^2.
  $
  Stąd $r^2=C e^(2t)$, czyli $r=sqrt(C)e^t$. Ponieważ
  $r^2=u^2+v^2=x^2+4y^2$, dostajemy
  $
    x^2+4y^2=C e^(2t).
  $
  Odległość od zera rośnie wykładniczo, więc trajektorie spiralnie oddalają
  się od punktu równowagi.

  *Kierunek i prędkość obrotu.* Dla kąta $theta$ w układzie $(u,v)$ mamy
  $
    theta'=(u v'-v u')/(u^2+v^2)
    =(u(2u+v)-v(u-2v))/(u^2+v^2)=2.
  $
  Kąt rośnie, więc obrót jest przeciwny do wskazówek zegara, z prędkością
  kątową $2$. Można to szybko potwierdzić w punkcie $(1,0)$: pole ma tam
  wartość $(x',y')=(1,1)$, czyli wektor jest skierowany w górę i w prawo.

  #align(center)[
    #image("portret-fazowy-zad12.svg", width: 88%)
  ]

  #wynik[
    Punkt $(0,0)$ jest ogniskiem niestabilnym. Trajektorie spiralnie oddalają
    się od zera i obracają przeciwnie do wskazówek zegara.
  ]
]

#v(1em)
#align(center)[
  #text(size: 9pt, fill: luma(100))[
    Koniec opracowania — 12 zadań, metody z kursu RRZ.
  ]
]

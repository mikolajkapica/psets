#import "../lib.typ": *
#show: styling

statystka matematyczna | lista 7

#set enum(numbering: "(a)")

Problem 1
Niech $X=(X_1,...,X_n)$, $Y=(Y_1,...,Y_n)$ będą niezależnymi próbami losowymi z rozkładów odpowiednio
$ X_i tilde cal(N)(mu_X, sigma^2) $
$ Y_i tilde cal(N)(mu_Y, sigma^2) $
gdzie $mu_X in bb(R)$, $mu_Y in bb(R)$ oraz $sigma > 0$ są nieznanymi parametrami.
+ Pokazać, że następujące statystyki
  $ T_1(X,Y) = overline(X) overline(Y), $
  $ T_2(X,Y) = 1/n sum_(i=1)^n X_i Y_i $
  są nieobciążonymi estymatorami parametru $mu_X mu_Y$.
+ Który z tych dwóch estymatorów ma mniejszy błąd średniokwadratowy.

Problem 2
Niech $X=(X_1,...,X_n)$ będzie próbą losową z rozkładu Poissona $cal(P)(lambda)$, gdzie $lambda > 0$. Pokazać, że nie istnieją nieobciążone estymatory parametrów
$ g_1(lambda) = 1/lambda $
oraz $ g_2(lambda) = e^lambda $

Problem 3
Niech $X=(X_1,...,X_n)$ będzie próbą losową z rozkładu Bernoulliego
$cal(B)(1,p)$, $p in (0,1)$.

+ Znaleźć estymator UMVU dla funkcji $g(p)=p^r$, gdzie $r$ jest liczbą naturalną
  nie większą niż $n$. Dla $r=1$ wyznaczyć funkcję ryzyka tego estymatora przy
  kwadratowej funkcji straty.

  Z tw. Lehmanna-Scheffego: znajdujemy estymator nieobciążony $W(X)$ parametru $g(p)$ i wyznaczamy
  statystykę dostateczną i zupełną $T(X)$ dla $p$. Wówczas $phi(T) = EE[W | T]$ jest UMVUE.

  Niech $W(X) = X_1 dot dots dot X_r$. Wówczas $EE[W] = EE[X_1] dot dots dot EE[X_r] = p^r$ (niezależność).

  $T(X) = X_1 + dots + X_n ~ cal(B)(n, p)$ jest statystyką dostateczną i zupełną.

  $
    phi(T) & = EE[W | T = t] \
           & = PP_p (X_1 = 1, dots, X_r = 1 | T = t) \
           & = (PP_p (X_1 = 1, dots, X_r = 1) dot PP_p (X_(r+1) + dots + X_n = t - r)) / (PP_p (T = t)) \
           & = (p^r dot binom(n-r, t-r) p^(t-r) (1-p)^(n-t)) / (binom(n, t) p^t (1-p)^(n-t)) \
           & = binom(n-r, t-r) / binom(n, t) \
           & = (t dot (t-1) dot dots dot (t-r+1)) / (n dot (n-1) dot dots dot (n-r+1))
  $

  dla $t >= r$ (dla $t < r$ mamy $phi(T) = 0$).

  Dla $r = 1$: $phi(T) = T / n = overline(X)$. Funkcja ryzyka przy kwadratowej funkcji straty:
  $R(p, phi) = EE_p [(overline(X) - p)^2] = "Var"_p (overline(X)) = p(1-p)/n$



+ Znaleźć estymator UMVU dla funkcji $g(p)=p(1-p)$ i zbadać jego asymptotyczne
  własności (zgodność, $sqrt(n)$ zgodność, asymptotyczną normalność).

  $T(X) = X_1 + dots + X_n$ jest statystyką dostateczną i zupełną dla $p$.

  $W(X) = "Var"_p (X_1) = p(1-p)$ dla $X_1 ~ cal(B)(1,p)$ - szukamy UMVUE dla wariancji pojedynczej obserwacji.

  Wariancja próbkowa $S^2 = 1/(n-1) sum_(i=1)^n (X_i - dash(X))^2$ jest
  nieobciążonym estymatorem wariancji, czyli $EE[S^2] = "Var"_p (X_1) = W(X)$.

  Ponieważ $"Var"_p (X_1) = p(1-p)$, to $EE[S^2] = p(1-p)$.

  Dla Bernoulliego $X_i in {0,1}$, więc $X_i^2 = X_i$. Stąd:
  $
    sum_(i=1)^n X_i^2 = sum_(i=1)^n X_i = T quad ==> quad dash(X) = T/n
  $
  więc:
  $
    sum_(i=1)^n (X_i - dash(X))^2 = sum_(i=1)^n X_i^2 - n dash(X)^2 = T - T^2/n = (T(n-T))/n.
  $

  Zatem $S^2 = 1/(n-1) dot (T(n-T))/n = T(n-T)/(n(n-1))$.

  Zatem $W(X) = EE[S^2]$ (estymator nieobciążony) zależy wyłącznie od $T(X)$ (dostatecznej i zupełnej), więc jest UMVUE.

  Zatem $hat(g)(T) = T(n-T)/(n(n-1))$ jest UMVUE dla $g(p) = p(1-p)$.

  *Asymptotyczne własności:*

  Niech $dash(p) = T/n$. Wtedy $W = n/(n-1) dot dash(p)(1-dash(p))$.

  + *Zgodność:* $dash(p) ->^(P) p$ (z PPN), $n/(n-1) -> 1$,
    więc $W ->^(P) p(1-p)$ -- estymator jest zgodny.

  + *$sqrt(n)$-zgodność i asymptotyczna normalność:*
    Z CLT $sqrt(n)(dash(p) - p) ->^d cal(N)(0, p(1-p))$.

    Z metody delty dla $g(p) = p(1-p)$, $g'(p) = 1 - 2p$:
    $
      sqrt(n)(g(dash(p)) - g(p)) ->^d cal(N)(0, [g'(p)]^2 p(1-p))
    $
    czyli $sqrt(n)(dash(p)(1-dash(p)) - p(1-p)) ->^d cal(N)(0, (1-2p)^2 p(1-p))$.

    Ponieważ $sqrt(n)(W - g(p)) = sqrt(n)(n/(n-1) dash(p)(1-dash(p)) - p(1-p))$
    $= sqrt(n)(dash(p)(1-dash(p)) - p(1-p)) + sqrt(n) dot 1/(n-1) dash(p)(1-dash(p))$,
    a drugi wyraz $-> 0$, to $W$ ma ten sam rozkład graniczny:
    $
      sqrt(n)(W - p(1-p)) ->^d cal(N)(0, (1-2p)^2 p(1-p))
    $
    Estymator jest $sqrt(n)$-zgodny i asymptotycznie normalny.


Problem 4
Niech $X=(X_1,...,X_n)$ będzie próbą losową z rozkładu wykładniczego $cal(E)(lambda)$, gdzie $lambda > 0$. Pokazać, że estymator
$ T_n(X) = n X_((1)) $
jest nieobciążonym estymatorem parametru $lambda$, jednakże ciąg estymatorów $(T_n)$ nie jest zgodny.

Problem 5
Niech $X=(X_1,...,X_n)$ będzie próbą losową z rozkładu
+ normalnego $cal(N)(a theta, theta^2)$, gdzie $a$ jest znaną stałą, $theta > 0$;
+ jednostajnego $cal(U)(theta - 1/2, theta + 1/2)$, $theta in bb(R)$;
+ jednostajnego $cal(U)(alpha, beta)$, $alpha, beta in bb(R)$, $alpha < beta$, $theta=(alpha, beta)$.
Dla każdej z tych rodzin rozkładów wyznaczyć statystykę dostateczną i zupełną dla parametru $theta$.

Problem 6
Niech $X=(X_1,...,X_n)$ będzie próbą losową z rozkładu jednostajnego $cal(U)(alpha, beta)$, $alpha, beta in bb(R)$, $alpha < beta$.
+ Znaleźć estymatory UMVU parametrów $alpha$ i $beta$.
+ Znaleźć estymator UMVU funkcji $g(alpha, beta) = beta - alpha$.

Problem 7
Niech $X=(X_1,...,X_n)$ będzie próbą losową. Pokazać, że estymator $overline(X)$ parametru $mu$ w rodzinie $cal(N)(mu, 1)$ jest lepszy niż estymator $T(X) = 1/2(X_((1)) + X_((n)))$, tzn. $T(X)$ jest niedopuszczalny. Następnie udowodnić, że w rodzinie rozkładów jednostajnych na odcinku $[mu - 1/2, mu + 1/2]$ jest na odwrót, tzn. $overline(X)$ jest niedopuszczalny.

Problem 8
Niech $X=(X_1,...,X_n)$ będzie próbą losową z rozkładu $cal(N)(mu, sigma^2)$. Dobrać stałą $c$, tak aby statystyka
$ W^2 = c sum_(i=1)^(n-1) (X_(i+1) - X_i)^2 $
była nieobciążonym estymatorem parametru $sigma^2$. Porównać wariancję $W^2$ z wariancją $S^2$. Który z estymatorów pozwala ocenić $sigma^2$ z większą dokładnością?

Problem 9
Niech $X=(X_1,...,X_n)$ będzie próbą losową z rozkładu jednostajnego $cal(U)(0, theta)$, gdzie $theta > 0$. Wykazać, że w klasie wszystkich estymatorów estymator
$ T(X) = (n+1)/n X_((n)) $
jest niedopuszczalny dla $L(theta, d) = (d - theta)^2$, chociaż jest estymatorem UMVU.
Wskazówka: Rozważyć estymator $T_1(X) = (n+2)/(n+1) X_((n))$.

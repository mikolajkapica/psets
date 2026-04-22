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
Niech $X=(X_1,...,X_n)$ będzie próbą losową z rozkładu Bernoulliego $cal(B)(1,p)$, $p in (0,1)$.
+ Znaleźć estymator UMVU dla funkcji $g(p)=p^r$, gdzie $r$ jest liczbą naturalną nie większą niż $n$. Dla $r=1$ wyznaczyć funkcję ryzyka tego estymatora przy kwadratowej funkcji straty.
+ Znaleźć estymator UMVU dla funkcji $g(p)=p(1-p)$ i zbadać jego asymptotyczne własności (zgodność, $sqrt(n)$ zgodność, asymptotyczną normalność).

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

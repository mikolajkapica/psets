#import "../lib.typ": *
#show: styling

#let dx = $"d"x$
#let dy = $"d"y$
#let dz = $"d"z$

statystka matematyczna | lista 6

Problem 1

Niech $bold(X)=(X_1,...,X_n)$ będzie próbą losową z rozkładu Poissona
$cal(P)(lambda)$, $lambda in (0, oo)$ i niech $T=sum_(i=1)^n X_i$. Znaleźć
rozkład warunkowy $Pr(bold(X)|T=t)$ i wykorzystując definicję dostateczności wykazać,
że $T$ jest statystyką dostateczną dla $lambda$.

$
  Pr(bold(X)|T=t) & = Pr(bold(X) = bold(x), T = t) / Pr(T = t) space =^(bold(X) "wyzncza" T) space Pr(bold(X) = bold(x))/Pr(T=t) \
  & = ((lambda^(x_1) e^(-lambda))/(x_1)! dot dots dot (lambda^(x_n) e^(-lambda))/(x_n)!)/(((n lambda)^t e^(-n lambda))/t!)
  = (lambda^(x_1 + ... + x_n) dot cancel(e^(-n lambda)) dot t!)/((n lambda)^t dot cancel(e^(-n lambda)) dot product_(i=1)^n x_i !)
  =^(x_1 + ... + x_n = t) (cancel(lambda^t) dot t!)/(n^t dot cancel(lambda^t) dot product_(i=1)^n x_i !) \
  &= (t!)/(n^t dot product_(i=1)^n x_i !) \
$

Rozkład warunkowy $bold(X)|T=t$ jest niezależny od $lambda$, zatem jest to statystyka dostateczna (trywialna).


Problem 2

Niech $X_1,...,X_n$ będzie próbą losową z populacji o rozkładzie $P in
cal(P)={P_theta, theta in Theta}$. Wykorzystując kryterium faktoryzacji znaleźć
statystykę dostateczną dla $theta$, tego samego wymiaru co $theta$, gdy:
+ $P_theta$ jest rozkładem Poissona $cal(P)(theta)$, $theta in (0, oo)$;
+ $P_theta$ jest rozkładem ujemno dwumianowym $cal(N)cal(B)(r,theta)$ ze znanym
  $r$ i $theta in (0,1)$;
+ $P_theta$ jest rozkładem wykładniczym $cal(E)(theta)$, $theta in (0, oo)$;
+ $P_theta$ jest rozkładem Gamma $cal(G)(alpha,beta)$, $theta=(alpha,beta) in
  (0, oo) times (0, oo)$;
+ $P_theta$ jest rozkładem beta $cal(B)e(alpha,beta)$, $theta=(alpha,beta) in
  (0, oo) times (0, oo)$;
+ $P_theta$ jest rozkładem lognormalnym $cal(L)cal(N)(mu,sigma^2)$,
  $theta=(mu,sigma) in bb(R) times (0, oo)$;
+ $P_theta$ jest rozkładem Weibulla $cal(W)e(alpha,theta)$ ze znanym $alpha$ i
  $theta in (0, oo)$.

#note[
  *Kryterium faktoryzacji*: \
  $T(x)$ jest dostateczna, jeśli $g_theta, h >= 0$ i $f(x; theta) = g_theta (T(x)) dot h(x) "-" mu "p.n"$ \
  Następstwem jest to że w rodzinie wykładniczej $T(X) = T_1 (X) + ... + T_k (X)$ \
  i jesli mamy n rozkładów iid X_i to $T(X) = (sum_(i=1)^n T_1 (x_i), ..., sum_(i=1)^n T_k (x_i))$.
]

Rozwiązania:

1. $P_theta$ jest rozkładem Poissona $cal(P)(theta)$, $theta in (0, oo)$;

Funkcja prawdopodobieństwa:
$
  f(bold(x); theta) = product_(i=1)^n (theta^(x_i) e^(-theta))/(x_i !)
  = underbrace(theta^(sum_(i=1)^n x_i) e^(-n theta), g_theta(T(bold(x)))) dot underbrace(product_(i=1)^n 1/(x_i !), h(bold(x))).
$
Zatem statystyką dostateczną jest
$ T(bold(X)) = sum_(i=1)^n X_i. $

2. $P_theta$ jest rozkładem ujemno dwumianowym $cal(N)cal(B)(r,theta)$ ze znanym $r$ i $theta in (0,1)$;

Funkcja prawdopodobieństwa (liczba niepowodzeń przed $r$-tym sukcesem):
$
  f(bold(x); theta) = product_(i=1)^n binom(x_i+r-1, r-1) theta^r (1-theta)^(x_i) = underbrace(theta^(n r) (1-theta)^(sum_(i=1)^n x_i), g_theta(T(bold(x)))) dot underbrace(product_(i=1)^n binom(x_i+r-1, r-1), h(bold(x))).
$
Stąd
$ T(bold(X)) = sum_(i=1)^n X_i. $

3. $P_theta$ jest rozkładem wykładniczym $cal(E)(theta)$, $theta in (0, oo)$;

Gęstość:
$
  f(bold(x); theta) = product_(i=1)^n theta e^(-theta x_i) = underbrace(theta^n e^(-theta sum_(i=1)^n x_i), g_theta(T(bold(x)))) dot underbrace(1, h(bold(x))).
$
Zatem
$ T(bold(X)) = sum_(i=1)^n X_i. $

4. $P_theta$ jest rozkładem Gamma $cal(G)(alpha,beta)$, $theta=(alpha,beta) in
  (0, oo) times (0, oo)$;

Gęstość:
$
  f(bold(x); alpha, beta)
  &= product_(i=1)^n 1/(Gamma(alpha) beta^alpha) (x_i)^(alpha - 1) e^(-(x_i)/beta) dot bb(1)_([0, oo)) (x_i) \
  &= bb(1)_([0, oo)) underbrace((min_i x_i), h(x)) underbrace(exp((alpha - 1) sum_(i=1)^n ln(x_i) -1/beta sum_(i=1)^n x_i - n ln(Gamma(alpha) beta^alpha)), g_theta (T(x)))
$

Zatem

$ T(bold(X)) = (sum_(i=1)^n ln(X_i), sum_(i=1)^n X_i) $

Problem 3

Pokazać, że jeśli $T$ jest statystyką dostateczną dla $P$ oraz $T=g(S)$ dla
pewnej statystyki $S$ i odwzorowania mierzalnego $g$, to $S$ jest statystyką
dostateczną dla $P$.

Jeśli $T$ jest statystyką dostateczną to można zapisać (kryterium faktoryzacji)
gęstość rozkładu wektora $bold(X)$ wzlędem $mu$:

$
  f(x;theta) = g_theta (T(x)) dot h(x) "-" mu "p.n."
$

Skoro $T=g(S) = g compose S$ to $T(x) = g(S)(x) = (g compose S)(x) = g(S(x))$.

Możemy zdefiniować $g'_theta = g'_theta compose g$.

Wtedy możemy zapisać gęstość:

$
  f(x;theta) = g'_theta (S(x)) dot h(x) "-" mu "p.n."
$

Zatem z kryterium faktoryzacji $S$ jest statytyką dostateczną dla $P$.

Intuicyjnie: skoro $S$ wyznacza jednoznacznie $T$ to $S$ niesie tę samą
informację o rozkładzie co $T$.


Problem 4

Niech $X_1,...,X_n$ będzie próbą losową z rozkładu o gęstości $ p_((theta,eta))=c(theta,eta)h(x)1_((theta,eta))(x), $ gdzie $h(x)$ jest ustaloną
dodatnią funkcją całkowalną na $(-oo, oo)$. Udowodnić, że $(X_((1)),X_((n)))$
jest statystyką dostateczną dla parametru $(theta,eta) in bb(R) times bb(R)$.

#text(size: 20pt)[BYŁO]

Problem 5

Niech $X_1,...,X_n$ będzie próbą losową z rozkładu beta $cal(B)e(alpha,alpha)$,
$alpha in (0, oo)$. Wyznaczyć minimalną statystykę dostateczną dla parametru
$alpha$. Uzasadnić, że jest to statystyka zupełna.

#text(size: 20pt)[BYŁO]

Problem 6

Uzasadnić, że rodzina rozkładów normalnych $cal(N)(mu,1)$ z parametrem $mu in
bb(R)$ jest rodziną zupełną.

Problem 7

Niech $X_1,...,X_n$ będzie próbą losową z rozkładu normalnego
$cal(N)(theta,theta^2)$, $theta>0$. Wyznaczyć minimalną statystykę dostateczną
dla parametru $theta$. Pokazać, że nie jest ona zupełna.

*Wskazówka.* Obliczyć $bb(E)_theta(sum_(i=1)^n X_i^2)$ i
$bb(E)_theta(sum_(i=1)^n X_i)^2$.

#text(size: 20pt)[BYŁO]

Problem 8

Niech $X_1,...,X_n$ będzie próbą losową z rozkładu jednostajnego $cal(U)(0;
  theta)$, $theta in (0, oo)$. Pokazać, że $T(X)=X_((n))$ jest minimalną i zupełną
statystyką dostateczną.

Problem 9

Niech $X_1,...,X_n$ będzie próbą losową z rozkładu jednostajnego
$cal(U)(theta-1/2; theta+1/2)$, $theta in bb(R)$. Udowodnić, że
$(X_((1)),X_((n)))$ jest minimalną statystyką dostateczną dla parametru $theta$,
ale nie jest statystyką zupełną.

*Wskazówka.* Obliczyć $bb(E)_theta(X_((n)))$ i $bb(E)_theta(X_((1)))$.

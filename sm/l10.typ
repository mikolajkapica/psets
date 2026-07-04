#import "../lib.typ": *

statystyka matematyczna | lista 10 - Testy jednostajnie najmocniejsze.

#set enum(numbering: "(a)")

#outline()

= Lista 10
Testy jednostajnie najmocniejsze

W rozwiązaniach oznaczamy przez $Phi$ dystrybuantę rozkładu
$cal(N)(0,1)$, a przez $z_q = Phi^(-1)(q)$ jego kwantyl rzędu $q$.
Symbol $chi^2_(k,q)$ oznacza kwantyl rzędu $q$ rozkładu $chi^2_k$.

== Zadanie 1

Niech $X_1, ..., X_n$ będą niezależne i mają rozkład $cal(N)(mu,1)$.
Testujemy
$
  H_0: mu=0
  quad "przeciwko" quad
  H_1: mu=mu_1>0.
$

=== Iloraz wiarygodności

Dla $bold(x)=(x_1,...,x_n)$ mamy
$
  f_mu (bold(x))
  = (2 pi)^(-n/2)
  exp(-1/2 sum_(i=1)^n (x_i-mu)^2).
$
Stąd
$
  (f_(mu_1) (bold(x))) / (f_0 (bold(x)))
  = exp(
    mu_1 sum_(i=1)^n x_i
    - (n mu_1^2)/2
  ).
$
Iloraz jest rosnącą funkcją statystyki
$
  T(bold(X))=sum_(i=1)^n X_i,
$
czyli także średniej $overline(X)$.

Z lematu Neymana--Pearsona test najmocniejszy odrzuca $H_0$ dla dużych
wartości $overline(X)$. Ponieważ pod $H_0$
$
  sqrt(n) overline(X) ~ cal(N)(0,1),
$
test poziomu $alpha$ ma postać
$
  phi(bold(x))
  = bb(1)_((z_(1-alpha)/sqrt(n), oo)) (overline(x)).
$
Równoważnie odrzucamy $H_0$, gdy
$
  sum_(i=1)^n X_i > sqrt(n) z_(1-alpha).
$

=== Funkcja mocy

Dla dowolnego $mu in RR$ zachodzi
$
  beta(mu) & = PP_mu (overline(X)>z_(1-alpha)/sqrt(n)) \
           & = PP_mu (
               sqrt(n)(overline(X)-mu)
               >z_(1-alpha)-sqrt(n)mu
             ) \
           & = 1-Phi(z_(1-alpha)-sqrt(n)mu).
$
W szczególności moc przeciwko zadanej alternatywie wynosi
$
  beta(mu_1)
  = 1-Phi(z_(1-alpha)-sqrt(n)mu_1).
$

== Zadanie 2

Niech $X ~ cal(U)(0,theta)$ i niech
$
  0<theta_0<theta_1.
$
Testujemy $H_0:theta=theta_0$ przeciwko $H_1:theta=theta_1$.

Gęstość ma postać
$
  f_theta (x)=1/theta bb(1)_((0,theta))(x).
$
Zatem
$
  (f_(theta_1) (x))/(f_(theta_0) (x))
  = cases(
    theta_0/theta_1, & 0<x<theta_0,
    oo, & theta_0<x<theta_1.
  )
$
Na przedziale $(0,theta_0)$ iloraz jest stały. Każdy podzbiór tego
przedziału o długości $alpha theta_0$ daje więc test najmocniejszy.
Wygodny wybór to
$
  phi(x)
  = bb(1)_(((1-alpha)theta_0, oo))(x).
$
Rzeczywiście,
$
  EE_(theta_0) [phi(X)]
  = PP_(theta_0) (X>(1-alpha)theta_0)
  = alpha.
$

Moc testu pod alternatywą jest równa
$
  beta(theta_1)
  = PP_(theta_1) (X>(1-alpha)theta_0)
  = 1-(1-alpha)theta_0/theta_1.
$

Test nie jest jedyny. Możemy do zbioru $(theta_0,theta_1)$ dołączyć dowolny
zbiór $A subset (0,theta_0)$ o długości $alpha theta_0$.

== Zadanie 3

Testujemy
$
  H_0: X eq.delta cal(B)(10,1/2)
  quad "przeciwko" quad
  H_1: X eq.delta cal(P)(1)
$
na poziomie $alpha=0.1$.

Dla $x=0,...,10$ iloraz wiarygodności wynosi
$
  L(x) & = (e^(-1)/x!) /
         (binom(10, x)2^(-10)) \
       & = 2^10 e^(-1) (10-x)!/10!.
$
Ponadto
$
  L(x+1)/L(x)=1/(10-x).
$
Iloraz maleje dla $x=0,...,9$. Dla $x>10$ mianownik jest zerowy, więc
$L(x)=oo$. Test odrzuca zatem $H_0$ dla małych wartości $X$ oraz zawsze dla
$X>10$.

Z tablic rozkładu dwumianowego:
$
  PP_0(X<=2)
  = (1+10+45)/2^10
  = 56/1024
  = 0.0546875,
$
oraz
$
  PP_0(X=3)
  = binom(10, 3)/2^10
  = 120/1024
  = 0.1171875.
$
Trzeba więc randomizować dla $X=3$. Niech prawdopodobieństwo odrzucenia w
tym punkcie będzie równe $gamma$. Z równania
$
  0.1=56/1024+gamma 120/1024
$
dostajemy
$
  gamma=29/75.
$

Test najmocniejszy ma postać
$
  phi(x)=cases(
    1, & x<=2 " lub " x>10,
    29/75, & x=3,
    0, & 4<=x<=10.
  )
$

Jego moc wynosi
$
  beta & = PP_1(X<=2)+29/75 PP_1(X=3)+PP_1(X>10) \
       & = e^(-1)(1+1+1/2)
         +29/75 e^(-1)/3!
         +PP_1(X>10) \
       & approx 0.9433.
$

== Zadanie 4

Przyjmujemy parametryzację
$
  f_lambda (x)=lambda e^(-lambda x)bb(1)_((0,oo))(x).
$
Testujemy
$
  H_0: X eq.delta cal(U)(0,1)
  quad "przeciwko" quad
  H_1: X eq.delta cal(E)(lambda), quad lambda>0.
$

Dla ustalonego $lambda>0$ iloraz wiarygodności na nośniku hipotezy zerowej
jest równy
$
  (f_lambda (x))/(f_0 (x))=lambda e^(-lambda x),
  quad 0<x<1.
$
Jest on malejącą funkcją $x$. Dla $x>1$ mianownik jest zerowy, więc iloraz
jest nieskończony. Z lematu Neymana--Pearsona odrzucamy $H_0$ dla $x>1$
oraz dla najmniejszych $10%$ przedziału $(0,1)$.

Otrzymujemy test
$
  phi(x)
  = bb(1)_((0,0.1))(x)
  +bb(1)_((1,oo))(x).
$
Pod $H_0$ drugi składnik ma prawdopodobieństwo zero, a pierwszy ma
prawdopodobieństwo $0.1$. Test ma więc poziom istotności $0.1$.

Zbiór krytyczny nie zależy od $lambda$. Test jest zatem JNM dla całej
alternatywy $lambda>0$.

Funkcja mocy ma postać
$
  beta(lambda) & = PP_lambda (X<0.1)+PP_lambda (X>1) \
               & = 1-e^(-0.1lambda)+e^(-lambda).
$

== Zadanie 5

W treści przyjmujemy rozkład $cal(N)(0,sigma^2)$. Zapis
$sigma^(2 gamma)$ traktujemy jako literówkę.

Testujemy
$
  H_0:sigma=1
  quad "przeciwko" quad
  H_1:sigma=sigma_1>1.
$

=== Iloraz wiarygodności

Niech
$
  Q(bold(X))=sum_(i=1)^n X_i^2.
$
Wtedy
$
  f_sigma (bold(x))
  = (2 pi sigma^2)^(-n/2)
  exp(-Q(bold(x))/(2sigma^2)).
$
Dla $sigma_1>1$ otrzymujemy
$
  (f_(sigma_1) (bold(x)))/(f_1 (bold(x)))
  = sigma_1^(-n)
  exp(1/2(1-1/sigma_1^2)Q(bold(x))).
$
Iloraz jest rosnącą funkcją $Q$. Test najmocniejszy odrzuca więc $H_0$ dla
dużych wartości sumy kwadratów.

Pod $H_0$ mamy $Q ~ chi^2_n$. Test poziomu $alpha$ ma postać
$
  phi(bold(x))
  = bb(1)_((chi^2_(n,1-alpha),oo))(Q(bold(x))).
$

=== Funkcja mocy

Dla dowolnego $sigma>0$
$
  Q/sigma^2 ~ chi^2_n.
$
Stąd
$
  beta(sigma) & = PP_sigma (Q>chi^2_(n,1-alpha)) \
              & = 1-F_(chi^2_n) (
                  chi^2_(n,1-alpha)/sigma^2
                ).
$

Dla $alpha=0.05$ otrzymujemy:

#align(center)[
  #table(
    columns: 3,
    align: (center, center, center),
    inset: 5pt,
    stroke: 0.5pt,
    [*$n$*], [*$beta(sqrt(2))$*], [*$beta(2)$*],
    [1], [0.1658], [0.3271],
    [2], [0.2236], [0.4729],
    [3], [0.2716], [0.5821],
    [5], [0.3541], [0.7358],
    [10], [0.5176], [0.9176],
    [20], [0.7347], [0.9928],
    [30], [0.8581], [0.9994],
  )
]

== Zadanie 6

Rozpatrujemy osobno oba rozkłady.

=== Rozkład gamma $cal(G)(theta,1)$

Przyjmujemy, że $theta$ jest parametrem kształtu, a drugi parametr jest
skalą. Gęstość jednej obserwacji wynosi
$
  f_theta (x)
  = 1/Gamma(theta) x^(theta-1)e^(-x)
  bb(1)_((0,oo))(x).
$

Testujemy $H_0:theta=1$ przeciwko $H_1:theta=theta_1>1$. Iloraz
wiarygodności ma postać
$
  (f_(theta_1) (bold(x)))/(f_1 (bold(x)))
  = Gamma(theta_1)^(-n)
  exp((theta_1-1)sum_(i=1)^n ln x_i).
$
Jest on rosnącą funkcją statystyki
$
  T_n=sum_(i=1)^n ln X_i.
$
Test najmocniejszy odrzuca więc $H_0$, gdy $T_n>c$.

Pod $H_0$ zmienne $X_i$ mają rozkład wykładniczy z intensywnością $1$.
Dla takiej zmiennej
$
  EE[ln X_i]=-gamma_E,
  quad
  "Var"(ln X_i)=pi^2/6,
$
gdzie $gamma_E approx 0.577216$ jest stałą Eulera. Z centralnego twierdzenia
granicznego
$
  Z_n
  := sqrt(6n)/pi (T_n/n+gamma_E)
  -->^cal(D) cal(N)(0,1).
$

Asymptotyczny test poziomu $alpha$ odrzuca $H_0$, gdy
$
  Z_n>z_(1-alpha).
$
W skali statystyki $T_n$ odpowiada temu wartość krytyczna
$
  c_(n,"as")
  = -n gamma_E+pi sqrt(n/6)z_(1-alpha).
$
Dla $alpha=0.05$:
$
  z_(0.95) approx 1.644854,
  quad
  c_(n,"as")
  approx -0.577216n+2.109607sqrt(n).
$

Aby sensownie porównać dokładną i asymptotyczną wartość krytyczną dla
różnych $n$, porównujemy je w skali $Z_n$. Numeryczne odwrócenie dokładnej
dystrybuanty daje
$
  q_(11,0.95) approx 1.54210,
  quad
  q_(12,0.95) approx 1.54662.
$
Zatem
$
  |q_(11,0.95)-z_(0.95)| approx 0.10275>0.1,
$
ale
$
  |q_(12,0.95)-z_(0.95)| approx 0.09823<0.1.
$
Pierwszą liczebnością spełniającą warunek jest więc $n=12$. Dla kolejnych
$n$ różnica dalej maleje.

=== Rozkład Pareto

Gęstość wynosi
$
  p_theta(x)=theta/x^2 bb(1)_((theta,oo))(x).
$
Niech
$
  X_((1))=min(X_1, ..., X_n).
$
Dla $theta_1>1$ iloraz wiarygodności jest równy
$
  (f_(theta_1) (bold(x)))/(f_1 (bold(x)))
  = theta_1^n
  bb(1)_((theta_1,oo))(X_((1))).
$
Największe wartości ilorazu otrzymujemy dla dużego minimum. Test
najmocniejszy możemy więc zapisać jako
$
  phi(bold(x))
  = bb(1)_((c_n,oo))(X_((1))).
$

Pod $H_0:theta=1$ dla $c>=1$ mamy
$
  PP_1(X_((1))>c)
  = product_(i=1)^n PP_1(X_i>c)
  = c^(-n).
$
Warunek poziomu istotności daje
$
  c_n^(-n)=alpha,
  quad "czyli" quad
  c_n=alpha^(-1/n).
$

Rozważmy statystykę
$
  W_n=n(X_((1))-1).
$
Dla $t>=0$
$
  PP_1(W_n>t)
  = (1+t/n)^(-n)
  --> e^(-t).
$
Zatem
$
  W_n -->^cal(D) cal(E)(1).
$
Asymptotyczna wartość krytyczna wynosi
$
  w_alpha=-ln alpha.
$
Dla $alpha=0.05$:
$
  w_(0.05)=-ln(0.05) approx 2.9957.
$

Dokładna wartość krytyczna w skali $W_n$ jest równa
$
  w_(n,alpha)
  = n(alpha^(-1/n)-1).
$
Dla $alpha=0.05$:
$
  w_(45,0.05)-w_(0.05) approx 0.1020,
$
natomiast
$
  w_(46,0.05)-w_(0.05) approx 0.0997.
$
Warunek różnicy mniejszej niż $0.1$ zachodzi więc dla
$
  n>=46.
$

Na końcu wyznaczamy funkcję mocy testu Pareto. Dla $theta>0$
$
  beta(theta)
  = PP_theta (X_((1))>c_n).
$
Jeśli $c_n>=theta$, to
$
  beta(theta)
  = (theta/c_n)^n
  = alpha theta^n.
$
Jeśli $c_n<theta$, to każda obserwacja jest większa niż $theta>c_n$, więc
moc jest równa $1$. Ostatecznie
$
  beta(theta)
  = cases(
    alpha theta^n, & theta<=alpha^(-1/n),
    1, & theta>alpha^(-1/n)
  )
  = min(alpha theta^n, 1).
$

== Zadanie 7

W obu przypadkach stosujemy twierdzenie Karlina--Rubina.

=== Rozkład normalny $cal(N)(0,theta^2)$

Niech
$
  S(bold(X))=sum_(i=1)^n X_i^2.
$
Dla $theta_2>theta_1>0$
$
  (f_(theta_2) (bold(x)))/(f_(theta_1) (bold(x)))
  = (theta_1/theta_2)^n
  exp(1/2(1/theta_1^2-1/theta_2^2)S(bold(x))).
$
Współczynnik przy $S$ jest dodatni. Rodzina ma więc MLR względem $S$.

Test JNM dla
$
  H_0:theta<=theta_0
  quad "przeciwko" quad
  H_1:theta>theta_0
$
odrzuca $H_0$ dla dużych wartości $S$. Pod $theta=theta_0$
$
  S/theta_0^2 ~ chi^2_n.
$
Wartość krytyczna wynosi zatem
$
  c=theta_0^2 chi^2_(n,1-alpha).
$
Test ma postać
$
  phi(bold(x))
  = bb(1)_((theta_0^2 chi^2_(n,1-alpha),oo))
  (S(bold(x))).
$

=== Rozkład beta $cal(B)e(theta,1)$

Gęstość jednej obserwacji ma postać
$
  f_theta (x)
  = theta x^(theta-1)bb(1)_((0,1))(x).
$
Dla $theta_2>theta_1$:
$
  (f_(theta_2) (bold(x)))/(f_(theta_1) (bold(x)))
  = (theta_2/theta_1)^n
  exp(
    (theta_2-theta_1)
    sum_(i=1)^n ln x_i
  ).
$
Iloraz jest rosnącą funkcją
$
  T(bold(X))=sum_(i=1)^n ln X_i.
$
Rodzina ma MLR względem $T$. Test JNM odrzuca $H_0$ dla dużych wartości
$T$, czyli dla wartości bliskich zeru.

Jeśli $X_i ~ cal(B)e(theta_0,1)$, to
$
  -2theta_0 ln X_i ~ chi^2_2.
$
W konsekwencji
$
  -2theta_0 T ~ chi^2_(2n).
$
Ponieważ odrzucamy dla dużego $T$, odrzucamy dla małej wartości
$-2theta_0T$. Warunek poziomu istotności daje
$
  PP_(theta_0) (
    -2theta_0T<chi^2_(2n,alpha)
  )=alpha.
$
Wartość krytyczna dla $T$ wynosi
$
  c=-chi^2_(2n,alpha)/(2theta_0).
$
Test ma więc postać
$
  phi(bold(x))
  = bb(1)_((-chi^2_(2n,alpha)/(2theta_0),oo))
  (sum_(i=1)^n ln x_i).
$

Równoważnie odrzucamy $H_0$, gdy
$
  product_(i=1)^n X_i
  > exp(-chi^2_(2n,alpha)/(2theta_0)).
$

== Zadanie 8

Dla każdych $theta_1<theta_2$ badamy iloraz
$
  R(x)=(f_(theta_2) (x))/(f_(theta_1) (x)).
$
Wystarczy pokazać, że jest on niemalejącą funkcją $x$.

=== Rozkład Laplace'a $cal(L)a(theta,sigma)$

Gęstość wynosi
$
  f_theta (x)
  = 1/(2sigma) exp(-abs(x-theta)/sigma).
$
Zatem
$
  R(x)
  = exp((abs(x-theta_1)-abs(x-theta_2))/sigma).
$
Możemy zapisać ten iloraz przedziałami:
$
  R(x)=cases(
    exp((theta_1-theta_2)/sigma),
    & x<=theta_1,
    exp((2x-theta_1-theta_2)/sigma),
    & theta_1<x<theta_2,
    exp((theta_2-theta_1)/sigma),
    & x>=theta_2.
  )
$
Najpierw jest stały, potem rośnie, a na końcu znów jest stały. Rodzina ma
więc MLR względem $X$.

=== Przesunięty rozkład wykładniczy

Gęstość ma postać
$
  f_theta (x)
  = 1/sigma e^(-(x-theta)/sigma)
  bb(1)_((theta,oo))(x).
$
Dla $theta_1<theta_2$ na istotnej części nośnika:
$
  R(x)=cases(
    0, & theta_1<x<=theta_2,
    exp((theta_2-theta_1)/sigma), & x>theta_2.
  )
$
Iloraz wykonuje jeden skok w górę. Jest więc niemalejący względem $x$.

=== Rozkład logistyczny $cal(L)G(theta,sigma)$

Gęstość możemy zapisać jako
$
  f_theta (x)
  = e^(-(x-theta)/sigma) /
  (sigma(1+e^(-(x-theta)/sigma))^2).
$
Niech
$
  a_j=e^(theta_j/sigma),
  quad
  y=e^(-x/sigma).
$
Wtedy $a_2>a_1$, a $y$ maleje wraz z $x$. Iloraz ma postać
$
  R(x)
  = a_2/a_1
  ((1+a_1y)/(1+a_2y))^2.
$
Funkcja
$
  h(y)=(1+a_1y)/(1+a_2y)
$
jest malejąca względem $y$, ponieważ
$
  h'(y)=(a_1-a_2)/(1+a_2y)^2<0.
$
Skoro $y$ maleje względem $x$, to $h(y)$ rośnie względem $x$. To samo
dotyczy $R(x)$. Rodzina logistyczna ma zatem MLR względem $X$.

=== Rozkład jednostajny $cal(U)(theta,theta+1)$

Gęstość wynosi
$
  f_theta (x)=bb(1)_((theta,theta+1))(x).
$
Dla $theta_1<theta_2$ wraz ze wzrostem $x$ iloraz przechodzi kolejno przez
wartości
$
  0, quad 1, quad oo.
$
Wartości $0$, $1$ i $oo$ odpowiadają kolejno: lewej części pierwszego
nośnika, części wspólnej i prawej części drugiego nośnika. Część wspólna
może być pusta. Iloraz pozostaje niemalejący.

=== Rozkład hipergeometryczny

Poprawny mianownik funkcji prawdopodobieństwa to $binom(N, r)$:
$
  f_theta (x)
  = (binom(theta, x)binom(N-theta, r-x))/binom(N, r).
$
Wystarczy najpierw porównać sąsiednie wartości parametru. Dla wspólnej
części nośników:
$
  (f_(theta+1) (x))/(f_theta (x)) & = binom(theta+1, x)/binom(theta, x)
                                    dot
                                    binom(N-theta-1, r-x)/binom(N-theta, r-x) \
                                  & = (theta+1)/(theta+1-x)
                                    dot
                                    (N-theta-r+x)/(N-theta).
$
Pierwszy czynnik zależny od $x$ jest rosnący, ponieważ jego mianownik
maleje. Drugi czynnik także jest rosnący, ponieważ jego licznik rośnie.
Iloraz jest więc rosnącą funkcją $x$.

Dla dowolnych $theta_1<theta_2$ poniższy iloczyn jest niemalejący, bo każdy
jego czynnik jest dodatni i niemalejący. Na brzegach nośników dochodzą
wartości $0$ lub $oo$ we właściwej kolejności:
$
  (f_(theta_2) (x))/(f_(theta_1) (x))
  = product_(theta=theta_1)^(theta_2-1)
  (f_(theta+1) (x))/(f_theta (x)).
$
Rodzina hipergeometryczna ma zatem MLR względem $X$.

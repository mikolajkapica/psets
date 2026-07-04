#set page(paper: "a4", margin: 2cm)
#set text(font: "New Computer Modern", size: 12pt, lang: "pl")

#show math.equation: set text(font: "New Computer Modern Math")

#set page(numbering: "1", number-align: center)

// Odstęp 1.5 linii oraz wyłączenie wcięć akapitowych
#set par(
  justify: true,
  leading: 0.8em,
  first-line-indent: 0pt,
  spacing: 1em,
)

#set list(spacing: 0.9em)

#let lim = math.limits(math.lim)
#let sup = math.limits(math.sup)
#let inf = math.limits(math.inf)
#let limsup = math.limits(math.limsup)
#let liminf = math.limits(math.liminf)
#show math.sum: math.limits
#show math.product: math.limits
#show math.union.big: math.limits
#show math.inter.big: math.limits
#show math.forall: math.limits
#show math.exists: math.limits

#let textop(x) = x + h(-0em)

#let darknavy = rgb(0, 15, 63)
#let darknavy-glow = darknavy.lighten(25%)
#show emph: it => text(fill: darknavy, stroke: 0.3pt + darknavy-glow, it)

#let darkgreen = rgb(0, 107, 0)
#let darkgreen-glow = darkgreen.lighten(75%)
#show strong: it => text(fill: darkgreen, stroke: 0.2pt + darkgreen-glow, it)

#let Medpar(x) = $lr((#x#box(width: 0pt, height: 0.875em)))$
#let bigpar(x) = $lr((#x#box(width: 0pt, height: 1em)))$
#let Bigpar(x) = $lr((#x#box(width: 0pt, height: 1.25em)))$

#let Medset(x) = $lr({#x#box(width: 0pt, height: 0.875em)})$
#let bigset(x) = $lr({#x#box(width: 0pt, height: 1em)})$
#let Bigset(x) = $lr({#x#box(width: 0pt, height: 1.25em)})$

#let Medsq(x) = $lr([#x#box(width: 0pt, height: 0.875em)])$
#let bigsq(x) = $lr([#x#box(width: 0pt, height: 1em)])$
#let Bigsq(x) = $lr([#x#box(width: 0pt, height: 1.25em)])$

#let Medmod(x) = $lr(|#x#box(width: 0pt, height: 0.875em)|)$
#let bigmod(x) = $lr(|#x#box(width: 0pt, height: 1em)|)$
#let Bigmod(x) = $lr(|#x#box(width: 0pt, height: 1.25em)|)$

#let Esp = context {
  let f = 1.64 
  
  let inner = rotate(
    13.5deg,
    line(start: (0em, 0em), end: (0pt, 4em/9 * f), stroke: 1em/40 * f + text.fill)
  )
  
  let base = text(size: 1em * f, $epsilon$)
  
  // math.class sprawia, że symbol ma prawidłowe odstępy w równaniach
  textop(box({
    place(center + horizon, dx: -1em/24*f, dy: 1em/8*f, inner)
    base
  }) + h(-1em/6))
}

// Komendy
#let neq = $eq.not$
#let avg(X) = $dash(#X, size:#1em)$
#let Var = textop("Var")
#let Norm = $cal(N)$
#let Uni = $cal(U)$
#let Bin = $cal(B)$
#let Ga = $cal(G)$
#let Poiss = textop("Poiss")
#let Geom = textop("Geom")
#let Exp = textop("Exp")
#let Res = textop("Res")
#let Im = textop("Im")
#let Re = textop("Re")
#let ind = $bb(1)$
#let snail = $partial$
#let war = $thin|thin$

#let int(x) = $circle(#x)$
#let cl(x) = $dash(#x)$
#let bd = $snail$

#show math.equation: it => {
show ":": math.class("punctuation", ":")
it
}

#set enum(numbering: "(1)")
#set list(marker: ([•], [--], [◦]))

#let thinner = h(1em / 12)

#let stwierdzenie(title: none, body) = block(
  above: 25pt,
  below: 10pt,
  width: 100%,
  {
    if title != none {
      text(weight: "bold")[#title] + h(0.05em)
    }
    body
  }
)

#let dowod(title: "Dowód", body) = block(
  above: 10pt,
  below: 10pt,
  width: 100%,
  {
    text(style: "italic")[#title] + h(0.05em) + body
    h(1fr) + $square$
  }
)

#let fakedowod(title: "Dowód", body) = block(
  above: 10pt,
  below: 10pt,
  width: 100%,
  {
    text(style: "italic")[#title] + h(0.05em) + body
  }
)

#let szkicdowodu(title: "Dowód (szkic)", body) = block(
  above: 10pt,
  below: 10pt,
  width: 100%,
  {
    text(style: "italic")[#title] + h(0.05em) + body
  }
)

#let tegoniebedzie(body) = {
  show emph: it => text(style: "italic", it.body)
  text(luma(50%))[#body]
}

= Rozkłady

Gęstości:
- $PP(Poiss(lambda)=k) = e^(-lambda) (lambda^k)/(k!)$
- $f_(Ga(alpha, theta.alt)) (x) = 1/(Gamma(alpha) theta.alt^alpha) x^(alpha-1) e^(-x/theta.alt) ind_((0, oo))(x)$

Momenty:
- $thinner Bin(n, p): Esp med = n p, Var med = n dot p(1-p)$
- $Poiss(lambda): Esp med = lambda, Var med = lambda$
- $Geom_1(p): Esp med = 1/p$
- $Exp(lambda): Esp med = 1/lambda, Var med = 1/(lambda^2)$
- $Ga(alpha, theta.alt): Esp med = alpha theta.alt, Var med = alpha theta.alt^2$

Sumy:
- $sum_(i=1)^n Norm(mu_i, sigma^2_i) ~ Norm(sum_(i=1)^n mu_i, sum_(i=1)^n sigma_i^2)$
- $sum_(i=1)^n Bin(n_i, p) ~ Bin(sum_(i=1)^n n_i, p)$
- $sum_(i=1)^n Poiss(lambda_i) ~ Poiss(sum_(i=1)^n lambda_i)$
- $sum_(i=1)^n Ga(alpha_i, theta.alt) ~ Ga(sum_(i=1)^n alpha_i, theta.alt)$
- $sum_(i=1)^n chi^2_(k_i) ~ chi^2_(sum_(i=1)^n k_i)$

Statystyki pozycyjne:
- $F_X_((1))(t) = 1-(1-F_X (t))^n$, $F_X_((n))(t) = (F_X (t))^n$
- $Esp med Uni(a, b)_((1)) = a + 1/(n+1) (b-a), Esp med Uni(a, b)_((n)) = a + n/(n+1) (b-a)$

Własności:
- $Exp(lambda) ~ Ga(1, 1/lambda)$, $sum_(1,...,n) Exp(lambda) ~ Ga(n, 1 / lambda)$
- $avg(X)_(Norm(mu, sigma^2)) ~ 1/n sum_(1,...,n) Norm(mu, sigma^2) ~ Norm(mu, (sigma^2)/n)$
- $S^2_(Norm(mu, sigma^2)) ~ sigma^2 chi^2_(n-1) /(n-1)$
- $chi^2_(n-1) ~ (n-1) S^2_(Norm(0, 1)) ~ sum_(1,...,(n-1)) (Norm(0, 1))^2$
- $t_(n-1) ~ (sum_(1,...,n) Norm(0, 1))/sqrt(n S_Norm(0, 1)^2) ~ Norm(0, 1)/sqrt((chi^2_(n-1))/(n-1))$

= Teoria

== Modele statystyczne

Model statystyczny: $(cal(X), cal(B), cal(P))$ \
$cal(X)$ -- przestrzeń prób, $cal(B)$ -- $sigma$-ciało podzbiorów, $cal(P)$ -- rodzina rozkładów zparametryzowanych przez $theta in Theta$. $Theta$ -- przestrzeń parametrów

Model parametryczny -- $Theta$ skończenie wymiarowa, nieparametryczny nieskończenie

Model identyfikowalny: dla różnych parametrów różne rozkłady

Próba -- $"X" = (X_1,...,X_n)$ i.i.d. z rozkładu tego samego parametru.

Statystyka -- funkcja od próby

== Rodziny rozkładów

Rodzina rozkładów z parametrem położenia i skali: \
$f_(sigma X+mu)(x) = 1/sigma f_(X)((x-mu)/sigma)$

Rodzina wykładnicza: \
$f_theta (x) = h(x) e^(eta(theta) circle.tiny T(x) - beta(theta))$ \
Pełnego rzędu: $eta(theta)$ afinicznie niezależne i $T(x)$ afinicznie niezależne p.w. i „naturalna przestrzeń parametrów ma niepuste wnętrze” \
Afiniczna niezależność -- nic kombinacją liniową innych plus minus stała

== Estymacja nieparametryczna

Dystrybuanta empiryczna: \
$hat(F)_n (t) = (|{i: X_i <= t}|)/n$ \
Własności:
- $hat(F)_n (t) ~ Bin(n, F(t))/n$
- $Esp med hat(F)_n (t) = F(t)$
- $Var med hat(F)_n (t) = (F(t)(1-F(t)))/n$
- $hat(F)_n (t) ->^"p.w." F(t) $

Nierówność Dvoretzky'ego-Kiefera-Wolfowitza: \
$PP(sup_t thinner |hat(F)_n (t) - F(t)| >= epsilon) <= 2e^(-2n epsilon^2)$

Gliwenka-Cantelli: $sup_t thinner |hat(F)_n (t) - F(t)| ->^"p.n." 0$

Histogram: \
$hat(f)_n (x) = sum_j Medmod({i: X_i in A_(n j)})/(n lambda(A_(n j))) ind_(A_(n j)) (x)$, \
$A_(n j)$ rozłączne o niezerowej mierze

Estymator jądrowy gęstości: \
$hat(f)_n (x) = 1/(n) sum_(i=1)^n 1/h_n K((x - X_i)/(h_n))$, \
gdzie $K$ -- jądro, czyli dowolna gęstość, $h_n>0$

Estymacja plug-in: \
Jak $theta=g(F)$, to $hat(theta)_n = g(hat(F)_n)$ \

== Estymacja parametryczna

Metoda momentów: \
Układ przyrównań momentów do ich estymatorów. \
TYLE RÓWNAŃ JAKI WYMIAR PARAMETRU – MOŻNA STRACIĆ PUNKTY

Estymator największej wiarygodności: \
Taki że funkcja wiarygodności $L(theta) = f_theta ("x") = product_(i=1)^n f_theta (x_i)$ jest największa spośród $theta in Theta$

== Regresja

Estymator najmniejszych kwadratów (regresja): \
„Modelujemy $"Y" = "X"beta + epsilon$, $Esp thinner epsilon = 0$, $Var epsilon_i = sigma^2$, estymator $hat(beta)$ taki żeby $||"Y" - "X"beta||^2$ najmniejsza dla wszystkich $beta in Beta$”

== Statystyki dostateczne

Statystyka dostateczna dla $theta$ jak $PP_theta ("X" = "x" war T=t)$ nie zależy od $theta$

Kryterium faktoryzacji: statystyka dostateczna $<=>$ $PP_theta ("X"="x") = g_theta (T("x")) dot h("x")$

Minimalna statystyka dostateczna $T$ jak każdej innej statystyki dostatecznej $S$ funkcją $T = phi(S)$

Zupełna statystyka dostateczna $T$ jak jedyną funkcją $g(T)$ że dla każdej $theta$ zachodzi $Esp_theta g(T) = c$ funkcja p.w. stała $g(T) = c$ (p.w.)

== UMVU

Rao-Blackwell: Jak $T$ -- statystyka dostateczna, $hat(theta)_1$ -- estymator $theta$ i istnieje skończona $Esp_theta hat(theta)_1$, a $L(theta, hat(theta))$ -- ściśle wypukła funkcja straty, $R(theta, hat(theta)) < oo med forall theta$, to $hat(theta)_2 := Esp[hat(theta)_1 war T]$ lepszy, czyli $R(theta, hat(theta)_2) <= R(theta, hat(theta)_1)$.
Jak $hat(theta)_1$ i $hat(theta)_2$ nie są p.w. równe, to nierówność jest ostra

UMVU: Nieobciążony $hat(theta)_1$ że $Var_theta hat(theta)_1 <= Var_theta hat(theta)_2$ $forall theta in Theta$ dla każdego $hat(theta)_2$ nieobciążonego \
Lehmann-Scheffe: nieobciążony estymator $g(theta)$ ulepszony Rao-Blackwellem statystyką dostateczną dla $g(theta)$ i zupełną UMVUE, jedynym

== Informacja Fishera

Informacja Fishera: $I(theta) = Esp_theta ( ((ln f_theta ("X") )'_theta) ^2 ) = -Esp_theta (ln f_theta ("X") )''_(theta theta) $

Ograniczenie Cramera-Rao: $C(theta) = (g'(theta))^2/I(theta)$

Nierówność Cramera-Rao: $Var_theta hat(g)_n >= C(theta)$ przy warunkach regularności. Równość jak istnieje $k(theta)$ że $(ln f_theta ("x"))'_theta = k(theta) (hat(g)_n - g(theta))$, wtedy efektywny \
Wypada napisać że nośnik nie może zależeć od $theta$ a $hat(g)_n$ nieobciążony

Efektywność: $e(hat(g)_n) = (C(theta))/(Var_theta hat(g)_n)$. Jak $=1$ efektywny

== Ocena jakości estymatorów

Funkcja straty: $L(hat(theta), theta) >= 0$, $L(theta, theta) = 0$, rosnąca wzgl. $||hat(theta) - theta||$ \
Kwadratowa funkcja straty: $L(hat(theta), theta) = (hat(theta) - theta)^2$ (lub $||dot||$)

Funkcja ryzyka: $R(hat(theta), theta) = Esp_theta (L(hat(theta), theta))$ \
MSE = $Esp_theta (hat(theta) - theta)^2 = Var_theta hat(theta) + B(theta)^2$, $B(theta) = Esp_theta (hat(theta) - theta)$

Lemat Słuckiego: jak $X_n ->^d X$ i $Y_n ->^PP c$ to \
(1) $X_n ± Y_n ->^d X ± c$ \
(2) $X_n dot Y_n ->^d X dot c$ \
(3) $(X_n)/(Y_n) ->^d X/c$, $c neq 0$

Metoda delta: jak $a_n -> oo$, $a_n (X_n - c) ->^d V$, $g$ ma niezerową pochodną w $c$ to \
$a_n (g(X_n) - g(c)) ->^d g'(c) dot V$

Zgodność: $hat(theta)_n ->^PP theta$

Mocna zgodność: $hat(theta)_n ->^"p.n." theta$

Ciągi estymatorów $(hat(g)_n)$ $g(theta)$

Asymptotyczna normalność: jak istnieją ciągi $(mu_n)$ i $(sigma_n)$, $sigma_n>0$ takie że \
$(hat(g)_n-mu_n)/(sigma_n) ->^d Norm(0, 1)$ dla $n->oo$

Asymptotyczna efektywność: jak $Theta subset.eq RR$ i $sqrt(n) (hat(g)_n - g(theta)) ->^d Norm(0, v(theta)) $ dla $n -> oo$, gdzie $v(theta) = (g'(theta))^2/(I_1(theta))$

== Przedziały ufności

Przedział ufności: $PP(theta in [L("X"), U("X")]) >= 1-alpha$

Funkcja centralna: $Y(X)$ taka że jej rozkład nie zależy od parametru; $[Q_(Y)(alpha/2), Q_(Y)(1-alpha/2)]$

== Testowanie hipotez

$H_0: theta in Theta_0$, $H_1: theta in Theta_1$, $Theta_0, Theta_1$ rozłączne

I rodzaj jak błędnie odrzucimy $H_0$, II rodzaj jak błędnie przyjmiemy

Zbiór krytyczny: ${"x": phi("x")=1}$

Moc: $beta(theta) = Esp_theta phi("X")$

Poziom istotności $alpha$: rozmiar testu $sup_(theta in Theta_0) beta(theta) <= alpha$. Mniejszy lepszy.

Neyman-Pearson: Jak $H_0: f = f_0$, $H_1: f = f_1$, to test JNM zawsze jest postaci $phi("x") = cases(
1", jeśli" (f_1("x"))/(f_0("x")) > k,
0", jeśli" (f_1("x"))/(f_0("x")) < k
)$, gdzie $k$ takie, że $Esp_(H_0) phi("X") = alpha$ (UWAGA NA $=k$)

Rodzina ma MLR wzgl. $T("x")$: dla $theta_1 < theta_2$, $(f_theta_2("x"))/(f_theta_1("x"))$ niemalejącą funkcją postaci $h(T("x"))$ UWAGA: wektor, iloczyn \
Rodzina wykładnicza (1 par.) z niemalejącą $eta$ MLR wzgl. $T$

Jak $f_theta$ ma MLR wzgl. $T$ i $phi$ -- niemalejąca, to $g(theta) := Esp_theta (phi(T("X")))$ jest niemalejącą funkcją $theta$

Karlin-Rubin: Jak $H_0: theta <= theta_0$, $H_1: theta > theta_0$ (hipoteza jednostronna) oraz jest MLR $f_theta ("x")$ wzgl. $T$, to istnieje test JNM postaci $phi("x") = cases(
1", jeśli" T("x") > k,
gamma", jeśli" T("x") = k,
0", jeśli" T("x") < k
)$, gdzie $k$ i $gamma$ takie żeby $beta(theta_0) = alpha$ \
Jak $H_0: theta >= theta_0$, $H_1: theta < theta_0$ zamieniamy kierunki nierówności.

$p$-value = $dash(alpha)("x") = inf{alpha: "x" in B_alpha}$, gdzie $B_alpha$ zbiór krytyczny dla $alpha$ \
Jak $B_alpha = {"x": T("x") > c_alpha}$, to $dash(alpha)("x") = sup_(theta in Theta_0) PP_theta (T("X") >= T("x"))$ \
Hipoteza dwustronna:\
(H2) $H_0: theta in.not (theta_1, theta_2)$, $H_1: theta in (theta_1, theta_2)$ \
(H3) $H_0: theta in (theta_1, theta_2)$, $H_1: theta in.not (theta_1, theta_2)$ \
(H4) $H_0: theta = theta_0$, $H_1: theta neq theta_0$ \

Twierdzenie: Jak rodzina wykładnicza z ściśle rosnącą $eta$, JNM dla (H2) postaci $phi^*("x") = cases(
1", jeśli" T("x") in (k_1, k_2),
gamma_1", jeśli" T("x") = k_1,
gamma_2", jeśli" T("x") = k_2,
0" w p.p."
)$ z $k_1,k_2,gamma_1,gamma_2$ aby $beta(theta_1)=beta(theta_2)=alpha$

Test nieobciążony jak dla $theta in Theta_1$ $beta(theta) >= alpha$

Twierdzenie: W (H3) i (H4) są JNMN jak w poprzednim tw. tylko z $1$ i $0$ zamienionymi. Stałe w (H3) jak wcześniej, stałe w (H4)  z $beta(theta_0) = alpha and Esp_theta_0 (T("X") phi^*("X")) = alpha Esp_theta_0 T("X")$

Test LR: Dla $H_0: theta in Theta_0$, $H_1: theta in.not Theta_0$ $phi("x") = cases(
1", jeśli" lambda("x") < k,
0", jeśli" lambda("x") >= k
)$, $k in (0, 1)$, $lambda("x") = (sup_(theta in Theta_0) L(theta))/(sup_theta L(theta))$. Jak się da to $k$ takie że $sup_(theta in Theta_0) PP_theta (lambda("X") < k) = alpha$ \

Twierdzenie Wilksa: Jak gęstość $f_theta$, $theta in Theta subset.eq RR^d$, $H_0: theta in Theta_0, H_1: theta in.not Theta_0$, $Theta_0$ wymiaru $k < d$, to przy założeniu $H_0$ i warunków regularności $-2 ln lambda_n ("X") ->^(d) chi^2_(d-k)$ gdzie $lambda_n ("x")$ test LR z $n$-próby


= Typy zadań

- FAKE CTG (lista 4 zadanie 2)
„$PP(|hat(F)_n (...) - ...| >= ...)$” \
Rozwiązanie: rozpisać z rozkładu $hat(F_n)$

- Nierówność DKW (kolokwium 1A zadanie 2)
„najmniejsze $n$ takie że $PP(sup_t thinner |hat(F)_n (t) - ...| >= ...) <= ...$” \
Rozwiązanie: z nierówności DKW i przekształcić, SUFIT!

- Metoda plug-in (lista 5 zadania 6,7 🤷)
Trzeba znaleźć funkcję $g$ taką że $theta= g(F)$ (chyba że będzie podana) i podstawić dystrybuantę empiryczną \
TRIK: Jak jest $theta = integral phi(x) dif x$, to $hat(theta)_n = 1/n sum_(i=1)^n phi(X_i)$ \
TRIK 2: Można podstawiać estymatory momentów

- Metoda momentów (lista 5 zadania 1,2): z definicji po prostu

- Estymator największej wiarygodności (lista 5 zadania 3,4,5,9,10)
Szukamy maksimum funkcji wiarygodności $L(theta) = product_(i=1)^n f_theta (x_i)$ lub logarytmu $l(theta) = sum_(i=1)^n ln f_theta (x_i)$ \
Zazwyczaj poprzez pochodną, jak indykatory to też krańce (wtedy można z monotoniczności) \
Jak jest więcej niż jeden to trzeba coś wybrać

- Znaleźć statystykę dostateczną (lista 7 zadania 1,2,4)
Kryterium faktoryzacji, rodzina wykładnicza, ewentualnie definicja

- Znaleźć statystykę dostateczną minimalną (lista 7 zadania 5,7,8,9)
Kryterium: „Jak statystyka dostateczna $T$ minimalna, to dla dowolnych $"x" "i" "y"$:
$(f_theta ("x"))/(f_theta ("y")) "nie zależy od" theta => T("x") = T("y")$” UWAGA: dla całej próby, iloczyn \
Inna opcja: rodzina wykładnicza pełnego rzędu

- Znaleźć statystykę dostateczną zupełną (lista 7 zadania 6,8)
Rodzina wykładnicza pełnego rzędu

- Pokazać że nie jest zupełna (lista 7 zadania 7,9: z definicji i będzie we wskazówce raczej

- UMVU (lista 7 zadania 3,6, kolokwium 2D zadanie 4)
„2 sposoby: 1. szukamy nieobciążony i go ulepszamy, 2. znajdujemy od razu gotowy” \
Zazwyczaj statystyki da się znaleźć z momentów

- Informacja Fishera
Z definicji policzyć ALE PAMIĘTAĆ ŻE iloczyn gęstości / $I_n (theta) = n I_1(theta)$

- Efektywność: Albo $e=1$ albo z równości w C-R

- Ciągi estymatorów

Jak będzie (raczej nie będzie) to się coś z definicji i Słuckiego i delty wymyśli

- Przedział ufności
Funkcja centralna i kwantyle \
Jak 2 parametry to $chi^2$ i $t$-Student (trzeba znać definicje)

- Asymptotyczne przedziały ufności
Jak będzie to ze Słuckiego i delty zbieżność wg. rozkładu f. centr. zamiast równości

- Test JNM: Bezpośrednio z L N-P, jak nie działa zwykły to zrandomizowany

- Nowe testy: tak jak w twierdzeniach
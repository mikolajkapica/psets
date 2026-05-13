#align(center)[
  = RÓWNANIA RÓŻNICZKOWE ZWYCZAJNE
  == Lista zadań nr 7
  === 7 maja 2026 r.
]

*7.1.* (a) Niech $Phi: I -> bb(R)^(k times m)$ i $Psi: I -> bb(R)^(m times n)$ będą różniczkowalnymi funkcjami macierzowymi. Wykazać, że funkcja $Phi Psi: I -> bb(R)^(k times n)$ jest różniczkowalna, oraz, że
$ (Phi Psi)'(t) = Phi'(t)Psi(t) + Phi(t)Psi'(t) quad "dla każdego" t in I. $

(b) Niech $Phi: I -> bb(R)^(n times n)$ będzie różniczkowalną funkcją macierzową o tej własności, że dla każdego $t in I$ macierz $Phi(t)$ jest nieosobliwa. Wykazać, że funkcja $Phi^(-1): I -> bb(R)^(n times n)$ jest różniczkowalna, oraz, że
$ (Phi^(-1))'(t) = -Phi^(-1)(t)Phi'(t)Phi^(-1)(t) quad "dla każdego" t in I. $

*7.2.* Niech
$ A = mat(1, 0; 0, 2) quad B = mat(0, 1; 0, 0) $
Sprawdzić, że $e^(A+B) eq.not e^A e^B$.

$
e^(A + B) = e^mat(1,1;0,2)
$

$
mat(1- lambda, 1; 0, 2 - lambda) = (1 - lambda)(2 - lambda) = 0 => lambda_1 = 1,
lambda_2 = 2
$

$
mat(
  0, 1;
  0, 1;
) mat(
  x;
  y
) = mat(
  0;
  0
) => mat(x; y) = mat(1;0)
$

$
mat(
  -1, 1;
  0, 0
) mat(
  x;
  y
) = mat(
  0;
  0
) => mat(x; y) = mat(1;1)
$

Zatem

$
  P = mat(1, 1; 0, 1), quad
  P^-1 = mat(1, -1; 0, 1), quad
  D = mat(1, 0; 0, 2)
$

$
e^(P D P^-1) = P e^D P^-1 
= mat(1, 1; 0, 1) mat(e^t, 0; 0, e^(2t)) mat(1, -1; 0, 1)
= mat(e^t, e^(2 t); 0, e^(2 t)) mat(1, -1; 0, 1)
= mat(e^t, -e^t + e^(2t); 0, e^(2 t))
$

Dla $t = 1$

$
mat(e, -e + e^2; 0, e^2)
$

Z drugiej strony z własności macierzy diagnonalnej i klatki jordana:

$
e^A dot e^B = mat(e, e; 0, e^2)
$

Zatem różne.

*7.3.* Obliczyć z definicji $exp(t mat(0, -1; 1, 0))$. Korzystając z tego wykazać, że odwzorowanie $A mapsto e^A$ nie jest różnowartościowe.








*7.4.* Rozważmy układ równań różniczkowych $x' = A x$ gdzie $A$ jest macierzą o
stałych współczynnikach. Pokazać, że jeśli $lambda$ jest wartością własną
macierzy $A$, a $v$ odpowiadającym jej wektorem własnym, to $phi = e^(lambda t)v$ jest rozwiązaniem tego układu.

*7.5.* Znaleźć układ fundamentalny dla układu $x' = A x$, gdzie $A$ jest równe:
#grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  [(a) $mat(-3, -4; -2, -5)$],
  [(b) $mat(1, 1; -2, -1)$],
  [(c) $mat(2, 1; -1, 4)$],
  [(d) $mat(1, 5; -1, -3)$]
)

*7.6.* Znaleźć rozwiązanie zagadnienia początkowego
$ cases(
    x' = -3x - 4y, 
    y' = -2x - 5y
  ) 
  quad 
  cases(
    x(0) = 1, 
    y(0) = 4
  ) 
$

*7.7.* Przy pomocy metody uzmienniania stałych znaleźć rozwiązanie ogólne układu
$ x' = mat(1, 1; -2, -1) x + mat(cos t; sin t + cos t) $

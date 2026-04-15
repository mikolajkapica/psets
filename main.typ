#import "lib.typ": *
#show: styling

sztuczna inteligencja - lista 3 - algorytmiczne wnioskanie w rachunku zdań

#line(length: 100%)

Problem

Uzasadnić metodą rezolucji zasadę szufladkową Dirichleta dla czterech obiektów i trzech szufladek: zapisać odpowiednie warunki jako formuły rachunku zdań i uzasadnić, że taki zbiór formuł jest sprzeczny, wyprowadzając z niego formułę pustą. Warunków będzie dużo (ile?), więc nie trzeba wszystkich zapisywać explicite, wystarczy podać ich ogólną postać. Podobnie nie trzeba wyprowadzać wszystkich zbędnych rezolwent, wystarczą te potrzebne do otrzymania formuły pustej. Warto jednak zastanowić się, ile rezolwent powstałoby, gdybyśmy faktycznie systematycznie wyprowadzali wszystkie możliwe rezolwenty w kolejnych iteracjach.



Problem 

Rozważmy następujący graf z czterema wierzchołkami: 

#image("assets/Zrzut ekranu 2026-04-15 201909.png")

Uzasadnić, że w grafie tym nie istnieje cykl Hamiltona, czyli droga zamknięta, która przechodzi przez każdy wierzchołek dokładnie raz. W tym celu zapisać odpowiedni zbiór formuł i uzasadnić, że nie jest on spełnialny (podobnie jak w przypadku zasady szufladkowej, formuł będzie dużo i niektóre będą bardzo podobne, więc można tylko opisać ich ogólną postać). Uzasadnić też, że jeśli z grafu usuniemy wierzchołek C, to odpowiedni zbiór formuł będzie spełnialny. Ciekawostka: można pokazać, że każdy problem 3SAT (czyli problem SAT z klauzulami zawierającymi po trzy literały) da się sprowadzić w czasie wielomianowym do problemu znalezienia cyklu Hamiltona w pewnym grafie, co oznacza, że problem istnienia cyklu Hamiltona jest NP-zupełny.



Problem

Uzasadnić, że każda formuła 3-CNF składająca się z siedmiu lub mniej klauzul jest spełnialna (za formułę 3-CNF uznajemy formułę CNF, w której każda klauzula składa się dokładnie z trzech literałów).

Problem

Uzasadnić, że jeśli baza wiedzy składa się wyłącznie z klauzul 2-CNF, to algorytm rezolucji będzie miał złożoność wielomianową (względem liczby symboli). Wskazówka: ile różnych (nierównoważnych) klauzul dwuliterałowych można utworzyć z n symboli? 


Problem

Ile formuł k-CNF można utworzyć z n symboli (niekoniecznie wykorzystując wszystkie symbole)? 


Problem

Rozważmy następującą bazę wiedzy: 
- $P => Q$ 
- $L and M => P$ 
- $B and L => M$ 
- $A and P => L$ 
- $A and B => L$ 
- A 
- B 

+ Porównać zachowanie algorytmów forward-chaining, backward-chaining oraz rezolucji przy zadaniu wyprowadzenia Q z tej bazy wiedzy.
+ Jak zastosować algorytm DPLL do wyprowadzenia Q z tej bazy wiedzy?  Który algorytm wnioskowania będzie to najbardziej przypominać w działaniu? 



# language: pl

Właściwość: Przeglądanie listy gier

  Zwykły użytkownik powinien widzieć publiczne, swoje gry lub gry dostępne dla grupy użytkowników, do której należy. 
  Gry, które nie są aktywne oraz są stworzone przez niego może edytować
  W gry aktywne może zagrać.
  Użytkownik o roli admin widzi wszystkie gry.

Scenariusz: W systemie brak zdefiniowanych gier
Zakładając że w systemie brak gier
Jeżeli Odwiedzam stronę "Gry"
Wtedy  Widzę "Brak dostępnych gier"
	    
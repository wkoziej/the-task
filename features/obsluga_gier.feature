# language: pl

Właściwość: Przeglądanie listy gier

  Zwykły użytkownik powinien widzieć publiczne, swoje gry lub gry dostępne dla grupy użytkowników, do której należy. 
  Gry, które nie są aktywne oraz są stworzone przez niego może edytować
  W gry aktywne może zagrać.
  Użytkownik o roli admin widzi wszystkie gry.

Scenariusz: W systemie brak zdefiniowanych gier
  Zakładając W systemie mamy "0" gier
  Oraz Jestem zalogowany jako użytkownik "admin_user"
  Oraz Mam rolę "admin"
  Jeżeli Idę na stronę "/games/"
  Wtedy  Widzę "Brak dostępnych gier"

Szablon scenariusza: Dodawanie gry
  Zakładając Jestem zalogowany jako użytkownik "game_creator"
  Oraz Mam rolę "user"
  Jeżeli Idę na stronę "/games/new" 
  Oraz Wypełniam pole "game_title" wartością "<title>" 
  Oraz Wypełniam pole "game_description" wartością "<description>" 
  Oraz Wciskam przycisk "commit_game"
  Wtedy Widzę "<description>"

  Przykłady:
  | title           | description                                  |
  | Gra terenowa    | Odwiedziny kilku miejsc w najbiższej okolicy |
  | Zbieranie kodów | Odwiedzanie miejsc i zdobywanie kodów        |
  

# gra-w-zgadywanie
Komendy porzebne do uruchomienia gry:

````
sudo apt-get install ruby

gem install colorize
````
Jak 'włączyć' program:

````
ruby game.rb
````
Jeśli używamy komunikacji poprzez Sockety na początku:
````
ruby game.rb
````
Następnie w drugim i trzecim terminalu:
````
ruby player.rb
ruby player_robot.rb
````

Program zawiera trzy opcje:

1. Gra w zgadywanie

Gra w zgadywanie polega na zgadywaniu wylosowanej liczby przez program w zakresie od 1 do 100. Po każdym błędnym wpisaniu liczby program będzie nam podpowiadał czy podać następnym razem "większą" liczbę czy "mniejszą". Za każdym razem możemy wpisać się do Hall_of_fame- dokumentu tekstowego, który jest uporządkowany w kolejności od najlepszego do najgorszego wyniku. Można zagrać w grę więcej razy bez konieczności restartowania programu. Po wpisaniu 'koniec' program kończy pracę.

![pierwszy](https://user-images.githubusercontent.com/58554458/171210727-464270fd-9991-4b7b-9cc8-889de0c62e0d.png)


2. Analiza wyników
 
Po wpisaniu opcji 2 gra robi analize opisaną w poziomie 6, aby nie używać dodatkowych arkuszy excela.

![drugi](https://user-images.githubusercontent.com/58554458/171214081-1d0f7e08-3199-40a1-be4b-897e757b4623.png)


3. Gra w zgadywanie za pomocą wyszukiwania binarnego dla dwóch klientów

![trzeci](https://user-images.githubusercontent.com/58554458/171214719-9536b09f-9b90-4195-b644-d6b4aa97c8ef.png)

Na początku trzeba uruchomić serwer, czyli wpisać opcje 3. Następnie uruchomić do wyboru:

player vs player

player vs player_robot

player_robot vs player_robot(chociaż lekko nie ma sensu, ponieważ pierwszy program 'odpalony' z terminala zawsze wygra.)
Komunikacja opiera się na socket-ach, czyli gniazdach, które są  interfejsem programowania służącym do oprogramowania transmisji sieciowych.


Player:

![czwarty](https://user-images.githubusercontent.com/58554458/171214737-ef033d6e-6257-474a-8d71-e1f2e7e4adf2.png)

Player_Robot oparty na wyszukiwaniu binarnym:

![piaty](https://user-images.githubusercontent.com/58554458/171214743-41a58979-a1a5-4a24-a083-0839083f3aa2.png)



Opis Zadania:

Gra w zgadywanie

Napisz program, którego zadaniem jest przeprowadzić grę z człowiekiem, w zgadywanie wylosowanej przez komputer liczby. Zadanie można zrobić prosto, lub w sposób bardzo rozbudowany. Warianty, a właściwie "poziomy" przedstawione są poniżej.


Poziom 1.
Program na przedstawić użytkownikowi zadanie, np. "Teraz będziesz zgadywać liczbę, którą wylosowałem" - a następnie zapytać użytkownika o tę liczbę, np. pisząc "Podaj liczbę: ", wczytać ją, i sprawdzić, czy wylosowana wcześniej liczba jest taka sama. Jeżeli tak, mają się pojawić gratulacje, a program się kończy. Jeżeli nie, program powinien napisać czy liczba podana przez użytkownika jest "Za mała", lub "Za duża". Wtedy powtarzane są pytania aż w końcu użytkownik zgadnie lub przerwie program.


Poziom 2.

Napisz program jak wyżej, ale zmodyfikuj go w taki sposób, aby możliwe było podanie odpowiedzi "koniec", po której pytania o liczbę są przerywane a program natychmiast się kończy pisząc "żegnaj". Program powinien w powitaniu napisać informację, że po wpisaniu "koniec" nastąpi zakończenie działania. Poza tym - wszystko może pozostać takie, jak na poziomie pierwszym.


Poziom 3.

Napisz program taki jak na poziomie 2, ale dodaj do niego dodatkowe pytanie na końcu, po odgadnięciu liczby, które brzmi "Czy gramy jeszcze raz? [T/N]". Gdy użytkownik wybierze odpowiedź (domyślnie tak lub nie), program rozpoczyna jeszcze raz grę z INNĄ wylosowaną liczbą, albo się kończy.


Poziom 4.

Program z poziomu 3 umożliwia wiele gier. Zmodyfikuj go tak, aby umożliwiał zapamiętanie w ilu próbach użytkownik odgadł liczbę. Po zakończeniu gry zapytaj użytkownika o imię, i zapisz je do struktury danych. Gdyby gra była kontynuowana kolejny raz, ponawiaj takie pytania, aby zebrać dane o wynikach różnych użytkowników. Na zakończenie programu wypisz podsumowanie: kto w ilu próbach odgadywał liczby, posortowane rosnąco według liczby prób.


Poziom 5.

Niech program z poziomu 4 zapisuje swoje wyniki do pliku, tworząc w ten sposób listę "Hall of fame", czyli tabelę najlepszych rezultatów. W tym pliku zapisuj liczbę prób, nazwę użytkownika oraz datę gry; możesz także zapisać zgadywaną liczbę. Taki plik należy wczytać po uruchomieniu programu i załadować do niego wczytane poprzednie rekordy. Program może wtedy po każdej grze informować użytkownika o pobiciu rekordu globalnego, lub osobistego. Pozostałe elementy mogą pozostać bez zmian. Użyj w tym programie struktur lub map, zależnie od tego, które rozwiązanie będzie bardziej pasowało do algorytmu, jaki opracujesz.


Poziom 6.

Przeprowadź cykl gier z różnymi osobami (lub ze sobą samym) i postaraj się prześledzić jak wyglądają wyniki. Np. w ilu próbach dana osoba odgaduje zwykle liczby. Spróbuj określić czy istnieją różnice pomiędzy poszczególnymi osobami, oraz dla poszczególnych liczb. Może liczby z końca zakresu są trudniejsze do odgadnięcia? Może są ludzie, którzy odgadują liczby w najwyżej pięciu-dziesięciu próbach? To zadanie dotyczy analizy danych, które uzbierałeś, ale aby zebrać te dane, trzeba sporo razy pograć. Oczywiście do analizy masz przygotowany plik, więc wyniki można nawet analizować w np. Excelu, Calc lub Arkuszach Googla. Pomyśl, czy istnieje strategia zapewniająca najszybsze odgadnięcie liczby. Może jest jakiś algorytm, którym można przyspieszyć odgadywanie poprzez podawanie odpowiednich liczb? Podpowiedź: jest :) Jeżeli go znajdziesz, możesz przejść do ostatniego etapu.


Poziom 7.

Napisz osobny program, który gra w grę z pierwszym programem. Niech ten program wczytuje lub wpisuje odpowiednie informacje do Twojego pierwszego programu (który - zakładam - czyta ze standardowego wejścia). Połączyć programy można za pomocą Basha, przekierowując wyjście z gracza do wejścia gry. Napisz swój grający program tak, aby optymalnie szybko odgadywał liczby, stosując rozwiązania dotyczące serii wyszukiwań binarnych opracowane w zadaniu na poziomie 6. Powodzenia! :) Jeżeli to zadanie Ci się uda, można powiedzieć, że masz ogromny potencjał, który objawił się już teraz :)

def proste_zgadywanie()
    y = 0
    koniec = 0
    while y == 0
        puts "Gra polega na zgadnięciu liczby, którą wylosuje program.\nProszę wpisać liczbę od 1 do 100.\nJeśli wpiszesz 'koniec' program zakonczy pracę.\n"
        random= rand(1..100)
        s = "koniec"
   
        loop do 
             x = gets.chomp
            if x == s then
                puts "Żegnaj"
                koniec = 1
                break
            end
            if x.to_i == random
                puts "Udało ci się!\n"
                break
            elsif x.to_i < random
                puts "Podaj większą liczbę.\n"
            elsif x.to_i > random
                puts "Podaj mniejszą liczbę.\n"
            end
        end
        if koniec == 1
            break
        end
        puts "Gramy jeszcze raz?\nWybierz T/N\n"
        s = gets.chomp
        if s == "T"
            puts "To gramy! Jeszczę raz wyjaśnię zasady gry.\n"
        elsif s == "N"
            puts "Koniec gry.\n"
            y = 1
            break 
        else
            puts "Podałeś złą literkę. Program kończy pracę."  
        end
    end
end

proste_zgadywanie()
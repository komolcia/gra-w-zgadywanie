def proste_zgadywanie()
    y = 0
    koniec = 0
    while y == 0
        gracze = Struct.new(:name,:attempt,:date)
        hall_of_fame=[]
        if(File.file?('hall_of_fame.txt')) 
            File.foreach("hall_of_fame.txt") { |each_line| 
                my_array = each_line.split(',')
                if my_array[0] == nil || my_array[1]== nil || my_array[2] == nil
                    y = 0
                else    
                    hall_of_fame.push(gracze.new(my_array[0],my_array[1],my_array[2]))
                end
            }
        end
        hall_of_fame = hall_of_fame.sort {|a,b| a[:attempt] <=> b[:attempt]}
        puts "Gra polega na zgadnięciu liczby, którą wylosuje program.\nProszę wpisać liczbę od 1 do 100.\nJeśli wpiszesz 'koniec' program zakonczy pracę.\n"
        random= rand(1..100)
        s = "koniec"
        liczba_prob = 1
   
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
                liczba_prob += 1
            elsif x.to_i > random
                puts "Podaj mniejszą liczbę.\n"
                liczba_prob += 1
            end
        end
        if koniec == 1
            break
        end
        puts "Aby zapisać się do Hall_of_Fame podaj swoje imie.\n"
        imie = gets.chomp
        puts "Pan..Pani "+ imie + " udało się w "+ liczba_prob.to_s + " próbach.\n"
        date = Time.new
        date = date.strftime("%Y-%m-%d")
        gracz = gracze.new(imie,liczba_prob,date)
        hall_of_fame.push(gracz)
        najlepszy = 0
        hall_of_fame.each { |p| 
            p.attempt = p.attempt.to_i
            if p.name == imie 
                if liczba_prob < p.attempt.to_i && p.attempt != nil
                    puts "Jesteś lepszy niż wcześniej.\nPróby wtedy:" + p.attempt.to_s+ " , a to było "+ p.date.to_s  + "\nPróby teraz: " + liczba_prob.to_s + "\n"
                end
            end
            if liczba_prob > p.attempt.to_i
                najlepszy = 1
            end
        }
        wpisz_sie = ""
        hall_of_fame = hall_of_fame.sort {|a,b| a[:attempt] <=> b[:attempt]}
        hall_of_fame.each { |p|
            wpisz_sie += p.name + "," + p.attempt.to_s + ',' + p.date.to_s + "\n"

        }
        File.open("hall_of_fame.txt", 'w') {|f| f.write(wpisz_sie) }

        if najlepszy == 0
            puts "Masz najlepszy wynik! Gratulacje!"
        end
        puts "Gramy jeszcze raz?\nWybierz T lub N\n"
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
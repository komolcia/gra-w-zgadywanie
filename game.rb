require 'socket'
def proste_zgadywanie()
    y = 0
    koniec = 0
    while y == 0
        gracze = Struct.new(:name,:attempt,:number,:date)
        hall_of_fame=[]
        if(File.file?('hall_of_fame.txt')) 
            File.foreach("hall_of_fame.txt") { |each_line| 
                my_array = each_line.split(',')
                if my_array[0] == nil || my_array[1]== nil || my_array[2] == nil || my_array[3] == nil
                    y = 0
                else    
                    hall_of_fame.push(gracze.new(my_array[0],my_array[1],my_array[2],my_array[3]))
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
        gracz = gracze.new(imie,liczba_prob,random,date)
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
            wpisz_sie += p.name + "," + p.attempt.to_s + ',' + p.number.to_s + ',' + p.date.to_s + "\n"

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


def analiza_danych()
    gracze = Struct.new(:name,:attempt,:number,:date)
    hall_of_fame=[]
    if(File.file?('hall_of_fame.txt')) 
        File.foreach("hall_of_fame.txt") { |each_line| 
            my_array = each_line.split(',')
            if my_array[0] == nil || my_array[1]== nil || my_array[2] == nil || my_array[3] == nil
                y = 0
            else    
                hall_of_fame.push(gracze.new(my_array[0],my_array[1],my_array[2],my_array[3]))
            end
        }
        puts "Średnia ilość prób: "
        srednia = 0
        ilosc = 0
        hall_of_fame.each { |p| 
            p.attempt = p.attempt.to_i
            srednia += p.attempt
            ilosc += 1
        }
        hall_of_fame = hall_of_fame.sort {|a,b| a[:attempt] <=> b[:attempt]}
        srednia = srednia / ilosc
        puts srednia + "\n"
        puts "Najlepszym zawodnikiem  jest "+ hall_of_fame[0] + "\n"
        puts "Najczęstsze liczby do odgadnięcia to : "
        srednia_dla_zakresu = [0,0,0,0]
        zakres=[0,0,0,0] 
        hall_of_fame.each { |p|
            if p.number.to_i >=1 && p.number.to_i <= 25
                srednia_dla_zakresu[0] += p.attempt
                zakres[0] += 1
            elsif p.number.to_i > 25 && p.number.to_i <= 50
                srednia_dla_zakresu[1] += p.attempt
                zakres[1] += 1
            elsif p.number.to_i > 50 && p.number.to_i <= 75
                srednia_dla_zakresu[2] += p.attempt
                zakres[2] += 1
            else
                srednia_dla_zakresu[3] += p.attempt
                zakres[3] +=1
            end
        }
        if zakres[0] != 0
             srednia_dla_zakresu[0] = srednia_dla_zakresu[0] / zakres[0]
             puts "Średnia dla zakresu od 0...25 to: " + srednia_dla_zakresu[0] + " , a ilość liczb to: " +zakres[0] + "\n"
        end
        if zakres[1] != 0
            srednia_dla_zakresu[1] = srednia_dla_zakresu[1] / zakres[1]
            puts "Średnia dla zakresu od 0...25 to: " + srednia_dla_zakresu[1] + " , a ilość liczb to: " +zakres[1] + "\n"
        end
        if zakres[2] != 0
        srednia_dla_zakresu[2] = srednia_dla_zakresu[2] / zakres[2]
        puts "Średnia dla zakresu od 0...25 to: " + srednia_dla_zakresu[2] + " , a ilość liczb to: " +zakres[2] + "\n"
        end
        if zakres[3] != 0
            srednia_dla_zakresu[3] = srednia_dla_zakresu[3] / zakres[3]
            puts "Średnia dla zakresu od 0...25 to: " + srednia_dla_zakresu[3] + " , a ilość liczb to: " +zakres[3] + "\n"
        end
        puts "Czy są osoby szybko zgadujące?\n"
        hall_of_fame.each { |p|
            if p.attempt < 5
                puts "Gracz " + p.name + " potrafi super szybko zgadywać!\nTylko w " + p.attempt + " próbach\n\n"
            end
        }
    end
end

def clients_puts(message)
	@client[0].puts message
	@client[1].puts message
end

def wpisz_numerek(player)
    client_number = player == 'o' ? 0 : 1
    @client[client_number].puts "REQ"
    return @client[client_number].gets
end

def gra_robot(random,x)
    s = "koniec"
    liczba_prob = 1
   
    loop do 
        if x == s then
            puts "Żegnaj"
            koniec = 1
            break
        end
        if x.to_i == random
            puts "Udało ci się!\n"
            break
        elsif x.to_i < random
            return -1
        elsif x.to_i > random
            return -2
        end
    end
    if x.to_s == s
       return liczba_prob
    end
    return liczba_prob
end
puts "Witaj w programie zaprojektowanym przez Julie Komorowską.\nMasz kilka opcji do wyboru:\n1. Gra w zgadywanie\n2. Analiza wyników\n3. Gra w zgadywanie za pomocą wyszukiwania binarnego dla dwóch klientów\n"
x = gets.to_i
case x
when 1
    proste_zgadywanie()
when 2
    analiza_danych()
when 3
    puts "Połącz dwóch graczy.\n"
    @client = []
    server = TCPServer.open(2000) 
    @client[0] = server.accept
    @client[0].puts "PNT Cześć! Graczu 1.Gra polega na zgadnięciu liczby, którą wylosuje program.Proszę wpisać liczbę od 1 do 100. Jeśli wpiszesz 'koniec' program zakonczy pracę.\n"
    @client[1] = server.accept
    @client[1].puts "PNT Cześć! Graczu 2.Gra polega na zgadnięciu liczby, którą wylosuje program. Proszę wpisać liczbę od 1 do 100. Jeśli wpiszesz 'koniec' program zakonczy pracę.\n"
    turn_player = 'o'
    liczba_prob1 = 0
    liczba_prob2 = 0
    random= rand(1..100)
    (1..100).each{ |turn_number|
	    
        if turn_player == 'o'
	        @client[0].puts "PNT Który raz? -  #{turn_number}, Próby: #{liczba_prob1}, Gracz: 1."
            liczba_prob1 += 1 
        else
            @client[1].puts "PNT Który raz? - #{turn_number}, Próby: #{liczba_prob2}, Gracz: 2."
            liczba_prob2 += 1
        end
      
        y = gra_robot(random,(wpisz_numerek turn_player).to_i)
	    if  y > 0
		    break
	    end
        if turn_player == 'o'
            if y == -1
            @client[0].puts "PNT Podaj większą liczbę."
            else
            @client[0].puts "PNT Podaj mniejszą liczbę."
            end
        else
            if y == -1
                @client[1].puts "PNT Podaj większą liczbę."
                else
                @client[1].puts "PNT Podaj mniejszą liczbę."
                end
        end
	    turn_player = turn_player == 'o' ? 'x' : 'o'
    }
    if turn_player == 'o'
        clients_puts "PNT Wygrany: 1 , Proby: #{liczba_prob1} Przegrany: 2, Proby: #{liczba_prob2}, Numerek: #{random}"
    else
        clients_puts "PNT Wygrany: 2, Proby: #{liczba_prob2} Przegrany: 1, Proby: #{liczba_prob2}, Numerek: #{random}"
    end
    clients_puts "EXT"
    @client[0].close
    @client[1].close  
else
    puts "Nie ma takiego numerku.\n"
end
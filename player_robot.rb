require 'socket'
hostname = 'localhost'
port = 2000
s = TCPSocket.open(hostname, port) #otwieranie servera
data = s.gets.chop
liczba_p = 0
k = 99
b = ""
liczba_s = (liczba_p + k)/2 #polowa czyli (0 +99)   /2 czyli 49
while data != "EXT"
	a = data.split
    case a[0]
    when "PNT"
        puts a[1,a.size-1].join(" ")
        my_string = a[2].to_s
        if my_string.include?('wi') || my_string.include?('mnie') 
            b = my_string
            
        end
	when "REQ"
		puts "Wybierz numerek."
        if b.include? "wi" # jesli potrzebuje wiekszej
            
            liczba_p = liczba_s + 1 # jesli wiekszej to liczba p = 50 a liczba s to (50+99)/2 czyli 74
            liczba_s = (liczba_p + k)/2
            s.puts liczba_s
            puts liczba_s.to_s + "\n"
            

        elsif b.include?('mnie') #jesli potrzebuje mniejszej
           
            k = liczba_s - 1
            liczba_s = (liczba_p + k)/2 # tu bedzie ok 24 i analogicznie w petli
            s.puts liczba_s
            puts liczba_s.to_s + "\n"
            
        else
            s.puts liczba_s
            puts liczba_s.to_s + "\n"
        end

	end
    data = s.gets.chop
   
end


s.close

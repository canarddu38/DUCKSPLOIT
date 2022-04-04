require "socket"
require "colorize"

host = "192.168.1.50"

port = 8012


class Client
  def initialize( server )
    @server = server
    @request = nil
    @response = nil
    listen
    send
    @request.join
    @response.join
  end
 
  def listen
    @response = Thread.new do
      loop {
        msg = @server.gets.chomp
        puts "#{msg}"
      }
    end
  end
 
  def send
    puts "Enter the username:".red.bold
    @request = Thread.new do
      loop {
		print ">>> "
        msg = $stdin.gets.chomp
        @server.puts( msg )
		puts "\n"
      }
    end
  end
end
 
server = TCPSocket.open( host, port )
Client.new( server )
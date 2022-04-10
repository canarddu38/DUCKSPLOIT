require "colorize"

x = ARGV[0].to_i
y = ARGV[1].to_i


system("start C:/DuckSploit/ruby/mousemove.vbs #{x} #{y}")

out = "Mouse moved successfully in x: #{x} | y: #{y}".red.bold.blink
require "colorize"

time = Time.new
filename = "screenshot-#{time.inspect}.png"

system("C:/Windows/System32/nircmd.exe savescreenshot C:/$DuckSploitw/pannel/#{filename}.png")

puts "Saved as".red.bold.blink

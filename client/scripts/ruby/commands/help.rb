require "colorize"

file = 'C:\DuckSploit\ruby\help.txt'

temp = File.read(file)

# outcolor = "green"
temp2 = temp.concat("\n")
out = temp2.concat("\n").green.bold.blink

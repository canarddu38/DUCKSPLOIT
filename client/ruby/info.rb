require "colorize"

system("call C:/DuckSploit/ruby/info.bat")

file = File.read("C:/DuckSploit/ruby/temp/tmp")

file = file.split

hostname = file[0]
ipv4 = file[1]
ipv6 = file[2]
netip = file[3]

out = "hostname: ".red.bold + "#{hostname}".red.bold.blink + "\nipv4: ".red.bold + "#{ipv4}".red.bold.blink + "\nipv6: ".red.bold + "#{ipv6}".red.bold.blink + "\nnetwork ip: ".red.bold + "#{netip}\n".red.bold.blink
finalcmd = cmd.sub("open", "start") 
if finalcmd == ""
	out = "[x] Invalid args"
elsif finalcmd == " "
	out = "[x] Invalid args"
else
	out = "Successfully opened: #{finalcmd}\n"
	system("#{finalcmd}")
end

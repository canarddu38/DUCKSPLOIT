finalcmd = fullcmd.sub("open", "") 
if finalcmd == ""
	out = "[x] Invalid args"
elsif finalcmd == " "
	out = "[x] Invalid args"
else
	system "start #{finalcmd}"
end

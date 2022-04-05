
tmp = cmd.sub("msg ", "").split

title = tmp[0]
line1 = tmp[1]
line2 = tmp[2]


File.write("C:/DuckSploit/File.vbs", "MsgBox \"#{line1}\" & vbCrLf & \"#{line2}\" ,16, \"#{title}\"")

system("start C:/DuckSploit/File.vbs")

out = "done\n"
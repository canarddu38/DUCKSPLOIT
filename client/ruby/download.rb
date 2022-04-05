require "down"

finalcmd = cmd.gsub("download ", "")

extension = File.extname(URI.parse(finalcmd).path)

Down.download("#{finalcmd}", destination: "C:/DuckSploit/downloads/last#{extension}")
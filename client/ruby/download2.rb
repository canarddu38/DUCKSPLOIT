require "down"

# cmd = "download <--url-->".chomp

finalcmd = cmd.gsub("download ", "").chomp

Down.download("#{finalcmd}", destination: "C:\DuckSploit\downloads\").chomp
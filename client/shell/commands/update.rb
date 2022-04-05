require "coloize"
require "down"

finalcmd2 = "https://github.com/canarddu38/DUCKSPLOIT-INSTALLER/releases/download/DUCKSPLOIT/DUCKSPLOIT-INSTALLER.zip"

finalcmd = "https://github.com/canarddu38/DUCKSPLOIT-INSTALLER/raw/main/assets/unzip.exe"

extension = File.extname(URI.parse(finalcmd).path)

Down.download("#{finalcmd}", destination: "C:/DuckSploit/downloads/unzip#{extension}")

Down.download("#{finalcmd2}", destination: "C:/DuckSploit/downloads/DS-LAST#{extension}")

loop do
  if File.exist?("C:/DuckSploit/downloads/DS-LAST.zip")
    if File.exist?("C:/DuckSploit/downloads/unzip.exe")
      system("call C:/DuckSploit/downloads/unzip.exe C:\DuckSploit\downloads\DS-LAST.zip")
    end
    out = "Downloading...".green.bold.blink
  end
end

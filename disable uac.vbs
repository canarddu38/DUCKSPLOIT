Set objShell = WScript.CreateObject("WScript.Shell")

objShell.Sendkeys "^{ESC}"
' objShell.SendKeys ""
WScript.sleep 1000
objShell.SendKeys "cmd.exe"
WScript.sleep 1000

objShell.SendKeys "^+{ENTER}"

WScript.sleep 1000




objShell.SendKeys "%{F4}"
objShell.SendKeys "%{F4}"
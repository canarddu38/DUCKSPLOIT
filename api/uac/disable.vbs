Set WSHShell = WScript.CreateObject("WScript.Shell")
WshShell.SendKeys "^{ESC}"
WshShell.SendKeys "C:/WINDOWS/System32/UserAccountControlSettings.exe"
WshShell.SendKeys "{ENTER}"
WshShell.SendKeys "{DOWN}"
WshShell.SendKeys "{DOWN}"
WshShell.SendKeys "{DOWN}"
Set WSHShell = Nothing
WScript.Quit(0)

Dim ObjetRegedit
On Error Resume Next
Set ObjetRegedit = CreateObject("WScript.Shell")

'*** 1ère clé de registre
uacbas1 = "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\ConsentPromptBehaviorAdmin"
ObjetRegedit.RegWrite uacbas1,"5", "REG_DWORD"

'*** 2ème clé de registre
uacbas2 = "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\ConsentPromptBehaviorUser"
ObjetRegedit.RegWrite uacbas2,"3", "REG_DWORD"

'*** 3ème clé de registre
uacbas3 = "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\PromptOnSecureDesktop"
ObjetRegedit.RegWrite uacbas3,"0", "REG_DWORD"


Set ObjetRegedit = Nothing
WScript.Quit

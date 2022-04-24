x = WScript.Arguments.Item(0)
y = WScript.Arguments.Item(1)

Dim Excel: Set Excel = WScript.CreateObject("Excel.Application")
Excel.ExecuteExcel4Macro "CALL(""user32"",""SetCursorPos"",""JJJ""," & x & "," & y & ")"

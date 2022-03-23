Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")

$Form                            = New-Object system.Windows.Forms.Form
$Form.ClientSize                 = New-Object System.Drawing.Point(700,400)
$Form.text                       = "DUCKSPLOIT - WINDOWS"
$Form.TopMost                    = $true
$Form.BackColor                  = [System.Drawing.ColorTranslator]::FromHtml("#000000")


$objIcon = New-Object system.drawing.icon ("C:\DuckSploit\images\icon.ico")
$Form.Icon = $objIcon


$Label1                          = New-Object system.Windows.Forms.Label
$Label1.text                     = "DUCKSPLOIT"
$Label1.AutoSize                 = $true
$Label1.width                    = 25
$Label1.height                   = 10
$Label1.location                 = New-Object System.Drawing.Point(190,20)
$Label1.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',35,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))
$Label1.ForeColor                = [System.Drawing.ColorTranslator]::FromHtml("#02ff00")
$Label1.BackColor                = [System.Drawing.ColorTranslator]::FromHtml("#000000")

$ListView1                       = New-Object system.Windows.Forms.ListView
$ListView1.text                  = "TEST"
$ListView1.width                 = 635
$ListView1.height                = 234
$ListView1.location              = New-Object System.Drawing.Point(35,103)
$ListView1.BackColor             = [System.Drawing.ColorTranslator]::FromHtml("#373737")
# $ListView.ForeColor              = [System.Drawing.ColorTranslator]::FromHtml("#FFFFFF")

$Button1                         = New-Object system.Windows.Forms.Button
$Button1.text                    = "RELOAD"
$Button1.width                   = 195
$Button1.height                  = 30
$Button1.location                = New-Object System.Drawing.Point(250,353)
$Button1.Font                    = New-Object System.Drawing.Font('Microsoft Sans Serif',16,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))
$Button1.ForeColor               = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")
$Button1.BackColor               = [System.Drawing.ColorTranslator]::FromHtml("#3e3e3e")

$Form.controls.AddRange(@($Label1,$ListView1,$Button1))

$Button1.Add_Click({ reload })

#region Logic


# listview add colmuns
[void]$Listview1.Columns.Add('col1',150)

foreach($line in Get-Content C:\DuckSploit\victimsIP.txt) {
    $ListView1.Items.Add("$line", 150);
}

function reload {
	$Form.Close();
	$listView1.Items.Clear();
	foreach($line in Get-Content C:\DuckSploit\victimsIP.txt) {
		$ListView1.Items.Add("$line", 150);
}
}

#endregion

[void]$Form.ShowDialog()
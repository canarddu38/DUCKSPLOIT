Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")

$Form                            = New-Object system.Windows.Forms.Form
$Form.ClientSize                 = New-Object System.Drawing.Point(700,400)
$Form.text                       = "DUCKSPLOIT - EDIT"
$Form.TopMost                    = $true
$Form.BackColor                  = [System.Drawing.ColorTranslator]::FromHtml("#000000")


$objIcon = New-Object system.drawing.icon ("C:\DuckSploit\images\icon.ico")
$Form.Icon = $objIcon

$name                            = New-Object system.Windows.Forms.TextBox
$name.multiline                  = $false
$name.width                      = 321
$name.height                     = 20
$name.location                   = New-Object System.Drawing.Point(195,173)
$name.Font                       = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$ip                              = New-Object system.Windows.Forms.TextBox
$ip.multiline                    = $false
$ip.width                        = 320
$ip.height                       = 20
$ip.location                     = New-Object System.Drawing.Point(195,222)
$ip.Font                         = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$port                            = New-Object system.Windows.Forms.TextBox
$port.multiline                  = $false
$port.width                      = 320
$port.height                     = 20
$port.location                   = New-Object System.Drawing.Point(195,269)
$port.Font                       = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$save                            = New-Object system.Windows.Forms.Button
$save.text                       = "SAVE"
$save.width                      = 152
$save.height                     = 30
$save.location                   = New-Object System.Drawing.Point(279,327)
$save.Font                       = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$save.ForeColor                  = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")
$save.BackColor                  = [System.Drawing.ColorTranslator]::FromHtml("#252525")

$PictureBox1                     = New-Object system.Windows.Forms.PictureBox
$PictureBox1.width               = 150
$PictureBox1.height              = 150
$PictureBox1.location            = New-Object System.Drawing.Point(280,7)
$PictureBox1.imageLocation       = "C:\DuckSploit\images\icon-nobg.png"
$PictureBox1.SizeMode            = [System.Windows.Forms.PictureBoxSizeMode]::zoom


$Form.controls.AddRange(@($name,$ip,$port,$save,$PictureBox1))


#region Logic 

$num = Get-Content C:\DuckSploit\num

$name1 = Get-Content C:\DuckSploit\victimsNAME | Select -First $num | Select -Last 1
$ip1 = Get-Content C:\DuckSploit\victimsIP | Select -First $num | Select -Last 1
$port1 = Get-Content C:\DuckSploit\victimsPORT | Select -First $num | Select -Last 1


$name.Text = $name1
$ip.Text = $ip1
$port.Text = $port1

$save.Add_Click({ save })

function save {
	# save
	$n1 = 0;
	$n2 = 0;
	$n3 = 0;
	[hashtable]$names = @{}
	[hashtable]$ips = @{}
	[hashtable]$ports = @{}
	
	foreach($line1 in Get-Content C:\DuckSploit\victimsNAME) {
		[hashtable]$names.Add("$n1", "$line1")
	
		$n1 = $n1 + 1;
	}
	foreach($line2 in Get-Content C:\DuckSploit\victimsIP) {
		[hashtable]$ips.Add("$n2", "$line2")
	
		$n2 = $n2 + 1;
	}
	foreach($line3 in Get-Content C:\DuckSploit\victimsPORT) {
		[hashtable]$ports.Add("$n3", "$line3")
	
		$n3 = $n3 + 1;
	}
	$line = $num - 1;

	$names["$line"] = $name.Text
	$ips["$line"] = $ip.Text
	$ports["$line"] = $port.Text

	$names.values | Out-File -FilePath "C:\DuckSploit\victimsNAME"
	$ips.values | Out-File -FilePath "C:\DuckSploit\victimsIP"
	$ports.values | Out-File -FilePath "C:\DuckSploit\victimsPORT"
	
	[System.Windows.Forms.MessageBox]::Show("Edited!", "DUCKSPLOIT" , 0, 48)
}
#endregion

[void]$Form.ShowDialog()
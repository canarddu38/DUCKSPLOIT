Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")

$Form                            = New-Object system.Windows.Forms.Form
$Form.ClientSize                 = New-Object System.Drawing.Point(700,400)
$Form.text                       = "DUCKSPLOIT - ADD VICTIM"
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

$Label2                          = New-Object system.Windows.Forms.Label
$Label2.text                     = "X"
$Label2.AutoSize                 = $true
$Label2.width                    = 25
$Label2.height                   = 10
$Label2.location                 = New-Object System.Drawing.Point(50,50)
$Label2.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',30,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))

$textBox1 						 = New-Object System.Windows.Forms.TextBox
$textBox1.Left 					 = 150;
$textBox1.Top 					 = 10;
$textBox1.width 				 = 300;
$textBox1.location               = New-Object System.Drawing.Point(200,150)
$textBox1.Font                   = New-Object System.Drawing.Font('Microsoft Sans Serif',14,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))

$textBox2						 = New-Object System.Windows.Forms.TextBox
$textBox2.Left 					 = 150;
$textBox2.Top 					 = 10;
$textBox2.width 				 = 300;
$textBox2.Font                   = New-Object System.Drawing.Font('Microsoft Sans Serif',14,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))
$textBox2.location               = New-Object System.Drawing.Point(200,190)

$textBox3						 = New-Object System.Windows.Forms.TextBox
$textBox3.Left 					 = 150;
$textBox3.Top 					 = 10;
$textBox3.width 				 = 300;
$textBox3.Font                   = New-Object System.Drawing.Font('Microsoft Sans Serif',14,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))
$textBox3.location               = New-Object System.Drawing.Point(200,230)

$Button1                         = New-Object system.Windows.Forms.Button
$Button1.text                    = "ADD VICTIM"
$Button1.width                   = 195
$Button1.height                  = 30
$Button1.location                = New-Object System.Drawing.Point(250,353)
$Button1.Font                    = New-Object System.Drawing.Font('Microsoft Sans Serif',16,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))
$Button1.ForeColor               = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")
$Button1.BackColor               = [System.Drawing.ColorTranslator]::FromHtml("#3e3e3e")


$Button1.Add_Click({ add_victim })

$Form.controls.AddRange(@($Label1,$Button1,$TextBox2,$TextBox1,$Label2, $textBox3))

function add_victim { 
If($TextBox1.Text -eq "") 
{ 
  [System.Windows.Forms.MessageBox]::Show("Victim's NAME can't be empty", "DUCKSPLOIT" , 0, 48)
}else{
  If($TextBox2.Text -eq "") 
{ 
	[System.Windows.Forms.MessageBox]::Show("Victim's IP can't be empty", "DUCKSPLOIT" , 0, 48)
}else{
  If($TextBox3.Text -eq "") 
{ 
  [System.Windows.Forms.MessageBox]::Show("Victim's PORT can't be empty", "DUCKSPLOIT" , 0, 48)
}else{
  [System.Windows.Forms.MessageBox]::Show("Victim Successfully Added!", "DUCKSPLOIT" , 0, 64)
  Add-Content -Path C:\DuckSploit\victimsIP -Value ($TextBox2.Text)
  Add-Content -Path C:\DuckSploit\victimsPORT -Value ($TextBox3.Text)
  Add-Content -Path C:\DuckSploit\victimsNAME -Value ($TextBox1.Text)
  $Form.Close();
}
}
}
}

#endregion
[void]$Form.ShowDialog()
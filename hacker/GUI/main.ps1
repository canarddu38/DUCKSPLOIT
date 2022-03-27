Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")

$Form                            = New-Object system.Windows.Forms.Form
$Form.ClientSize                 = New-Object System.Drawing.Point(700,400)
$Form.text                       = "DUCKSPLOIT - WINDOWS"
$Form.TopMost                    = $true
$Form.BackColor                  = [System.Drawing.ColorTranslator]::FromHtml("#000000")


$objIcon 						 = New-Object system.drawing.icon ("C:\DuckSploit\images\icon.ico")
$Form.Icon						 = $objIcon


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
$Label2.text                     = "+ Add Victim"
$Label2.AutoSize                 = $true
$Label2.width                    = 25
$Label2.height                   = 10
$Label2.location                 = New-Object System.Drawing.Point(10,10)
$Label2.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',20,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))
$Label2.ForeColor                = [System.Drawing.ColorTranslator]::FromHtml("#FFFFFF")
$Label2.BackColor                = [System.Drawing.ColorTranslator]::FromHtml("#000000")

$ListView1                       = New-Object system.Windows.Forms.ListView
$ListView1.width                 = 635
$ListView1.text                  = "TEST"
$ListView1.height                = 234
$ListView1.location              = New-Object System.Drawing.Point(35,103)
$ListView1.BackColor             = [System.Drawing.ColorTranslator]::FromHtml("#373737")
$ListView1.View 				 = "Details"
$Listview1.forecolor			 = "LightGreen"
$Listview1.GridLines			 = $false
$Listview1.MultiSelect           = $false

$ListView1.Columns.Add('NAME')
$ListView1.Columns.Add('IP')
$ListView1.Columns.Add('PORT')

$ListView1.Columns[0].Width = 200
$ListView1.Columns[1].Width = 335
$ListView1.Columns[2].Width = 95

$Button1                         = New-Object system.Windows.Forms.Button
$Button1.text                    = "RELOAD"
$Button1.width                   = 195
$Button1.height                  = 30
$Button1.location                = New-Object System.Drawing.Point(250,353)
$Button1.Font                    = New-Object System.Drawing.Font('Microsoft Sans Serif',16,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))
$Button1.ForeColor               = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")
$Button1.BackColor               = [System.Drawing.ColorTranslator]::FromHtml("#3e3e3e")

$Form.controls.AddRange(@($Label1,$ListView1,$Button1,$Label2))

$Button1.Add_Click({ reload })

$Label2.Add_Click({ add_victim })



#region Logic

$num = 0
$num2 = 1
# listview add colmuns

foreach($line in Get-Content C:\DuckSploit\victimsNAME) {
	$objitem = ""
	
	$item2 = ""
	$item3 = ""
	
	$item1 = New-Object System.Windows.Forms.ListViewItem($line)
	$ListView1.Items.AddRange($item1)
	
	$objItem = $ListView1.Items[$num]
	
	$item2 = Get-Content C:\DuckSploit\victimsIP | Select -First $num2 | Select -Last 1
	$item3 = Get-Content C:\DuckSploit\victimsPORT | Select -First $num2 | Select -Last 1
	
	$objitem.SubItems.Add($item2)
	$objitem.SubItems.Add($item3)

	$num = $num + 1
	$num2 = $num2 + 1
}


$form.Controls.Add($Listview1)





function reload {
	$ListView1.Items.Clear();
	$num = 0
	$num2 = 1
	# listview add colmuns

	foreach($line in Get-Content C:\DuckSploit\victimsNAME) {
	
		$objitem = ""
	
		$item2 = ""
		$item3 = ""
	
		$item1 = New-Object System.Windows.Forms.ListViewItem($line)
		$ListView1.Items.AddRange($item1)
	
		$objItem = $ListView1.Items[$num]
	
		$item2 = Get-Content C:\DuckSploit\victimsIP | Select -First $num2 | Select -Last 1
		$item3 = Get-Content C:\DuckSploit\victimsPORT | Select -First $num2 | Select -Last 1
	
		$objitem.SubItems.Add($item2)
		$objitem.SubItems.Add($item3)
		$num = $num + 1
		$num2 = $num2 + 1
}
	[System.Windows.Forms.MessageBox]::Show("Succesfully Reloaded!", "DUCKSPLOIT" , 0, 64)
}

$ListView1.Add_Click({
	$linenumber= Get-Content C:\DuckSploit\victimsNAME | select-string $ListView1.SelectedItems[0].Text
	$linenumber.LineNumber | Out-File -FilePath C:\DuckSploit\num
	./view.ps1
})

function add_victim {
	./add_victim.ps1
}

#endregion

[void]$Form.ShowDialog()
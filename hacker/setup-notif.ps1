[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")
Add-Type -AssemblyName System.Windows.Forms

function Show-Notification {
    [cmdletbinding()]
    Param (
        [string]
        $ToastTitle,
        [string]
        [parameter(ValueFromPipeline)]
        $ToastText
    )

    [Windows.UI.Notifications.ToastNotificationManager, Windows.UI.Notifications, ContentType = WindowsRuntime] > $null
    $Template = [Windows.UI.Notifications.ToastNotificationManager]::GetTemplateContent([Windows.UI.Notifications.ToastTemplateType]::ToastText02)

    $RawXml = [xml] $Template.GetXml()
    ($RawXml.toast.visual.binding.text|where {$_.id -eq "1"}).AppendChild($RawXml.CreateTextNode($ToastTitle)) > $null
    ($RawXml.toast.visual.binding.text|where {$_.id -eq "2"}).AppendChild($RawXml.CreateTextNode($ToastText)) > $null

    $SerializedXml = New-Object Windows.Data.Xml.Dom.XmlDocument
    $SerializedXml.LoadXml($RawXml.OuterXml)
	
    
    $Toast = [Windows.UI.Notifications.ToastNotification]::new($SerializedXml)
    $Toast.Tag = "Information"
    $Toast.Group = "Information"
	
    $Toast.ExpirationTime = [DateTimeOffset]::Now.AddMinutes(2)

    $Notifier = [Windows.UI.Notifications.ToastNotificationManager]::CreateToastNotifier("DuckSploit")
    $Notifier.Show($Toast);
}
$version = Get-Content C:\DuckSploit\version.txt
Show-Notification "DuckpvpTeam" ("Thanks you for Downloading DUCKSPLOIT " + $version)

# Expand-Archive -Path 'C:\tmp\DS.zip' -DestinationPath 'Desktop'
 
$source = 'https://github.com/canarddu38/DUCKSPLOIT/archive/root.zip'
$destination = 'C:\tmp\DS.zip'
Invoke-RestMethod -Uri $source -OutFile $destination

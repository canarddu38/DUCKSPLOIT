Function Get-FirefoxPasswords
{
    # Get locations of firefox files
    $firefoxFiles = Find-FirefoxFiles

    # Read passwords json file and get profile dir
    $passwordData = ((Get-Content -Path $firefoxFiles['passwords']) | ConvertFrom-Json).logins
    $profileDir = $firefoxFiles['profile']
    
    # Revised is the returned object while decrypt is a list of things to decrypt
    # Decrypt size is length * 2 because for each entry, both the username and password are encrypted
    $length = $passwordData.Length
    $revised = @(0) * $length
    $decrypt = @(0) * ($length * 2)

    # Add items to be decrypted
    for($i = 0; $i -lt $length; $i++)
    {
        $decrypt[($i * 2) - 1] = $passwordData[$i].encryptedUsername
        $decrypt[($i * 2)] = $passwordData[$i].encryptedPassword
    }

    # Decrypt the items
    $decrypted = ConvertFrom-NSS -Data $decrypt -ProfileDir $profileDir

    # Populate the revised array and return it
    for($i = 0; $i -lt $length; $i++)
    {
        $revisedPart = $passwordData[$i] | Select-Object * -ExcludeProperty @('httpRealm', 'encryptedUsername', 'guid', 'encryptedPassword', 'id', 'hostname', 'usernameField', 'passwordField', 'timePasswordChanged', 'encType', 'timesUsed', 'timeCreated', 'timeLastUsed')
        $revisedPart | Add-Member -MemberType 'NoteProperty' -Name 'username' -Value $decrypted[($i * 2) - 1]
        $revisedPart | Add-Member -MemberType 'NoteProperty' -Name 'password' -Value $decrypted[($i * 2)]
        $revised[$i] = $revisedPart
    }
    return $revised
}

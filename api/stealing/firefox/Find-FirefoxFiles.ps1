Function Find-FirefoxFiles
{
    $profilesDir = Join-Path -Path $env:APPDATA -ChildPath 'Mozilla\Firefox\Profiles\'
    $profiles = Get-ChildItem -Path $profilesDir | Where-Object { $_.PSIsContainer }
    $core = Join-Path -Path $profilesDir -ChildPath (($profiles | Select-Object -First 1).Name)

    $locations = @{
        'profile' = $core

        # SQLITE History, Bookmarks, and probably Downloads
        'places' = (Join-Path -Path $core -ChildPath 'places.sqlite')

        # Sqlite Cookies
        'cookies' = (Join-Path -Path $core -ChildPath 'cookies.sqlite')

        # Sqlite form history
        'forms' = (Join-Path -Path $core -ChildPath 'formhistory.sqlite')

        # Json saved passwords
        # NSS Encrypted, decrypt using ConvertFrom-NSS
        'passwords' = (Join-Path -Path $core -ChildPath 'logins.json')
    }
    
    # Only return the locations that exist
    $verifiedLocations = @{}
    foreach($loc in $locations.GetEnumerator())
    {
        if(Test-Path $loc.Value)
        {
            $verifiedLocations.add($loc.Name, $loc.Value)
        }
    }

    return $verifiedLocations
}
$animation = @"
Loading DuckSploit $version...
#
Loading DuckSploit $version..
#
Loading DuckSploit $version.
#
Loading DuckSploit $version..
"@

$frames = $animation.Split("#").Trim()

$animationLoopNumber = 3 # number of times to loop animation

$animationSpeed = 250 # time in milliseconds to show each frame

$i = 0

do {

    foreach ($frame in $frames) {

        Clear-Host
        
        Write-Host "$frame`n" -fore yellow
    
        Start-Sleep -Milliseconds $animationSpeed
    }

    $i++
    
} until ($i -eq $animationLoopNumber)

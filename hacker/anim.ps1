$animation = @"
Loading DuckSploit V1.0.8...
#
Loading DuckSploit V1.0.8..
#
Loading DuckSploit V1.0.8.
#
Loading DuckSploit V1.0.8..
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

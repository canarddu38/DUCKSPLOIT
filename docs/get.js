var detectedOS = "Unknown OS";
var versionurl = "https://raw.githubusercontent.com/canarddu38/DUCKSPLOIT/root/hacker/version.txt"
var downloadurl = "nothin";

if (navigator.appVersion.indexOf("Android") != -1) {
    detectedOS = "Android";
	versionurl = "https://raw.githubusercontent.com/canarddu38/DUCKSPLOIT/root/hacker/android/version.txt";
	downloadurl = "https://github.com/canarddu38/DUCKSPLOIT/raw/root/hacker/android/DSinstaller.apk";
	alert(downloadurl);
	
} else if (navigator.appVersion.indexOf("Win") != -1) {
    detectedOS = "Windows";
	versionurl = "https://raw.githubusercontent.com/canarddu38/DUCKSPLOIT/root/hacker/windows/version.txt";
	downloadurl = "https://github.com/canarddu38/DUCKSPLOIT/raw/root/hacker/windows/DSinstaller.exe";
	alert(downloadurl);
	
} else if (navigator.appVersion.indexOf("Linux") != -1) {
    detectedOS = "Linux";
	versionurl = "https://raw.githubusercontent.com/canarddu38/DUCKSPLOIT/root/hacker/linux/version.txt";
	downloadurl = "https://github.com/canarddu38/DUCKSPLOIT/raw/root/hacker/linux/DSinstaller.deb";
	alert(downloadurl);
}
	
alert(detectedOS);



fetch(versionurl)
  .then(response => response.text())
  .then(data => {
  document.getElementById("version").innerHTML = 'last version: V'.concat(data);
  document.getElementById("downloadlastbut").href=downloadurl;
  });
  
  


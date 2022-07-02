var detectedOS = "Windows";
var versionurl = "https://raw.githubusercontent.com/canarddu38/DUCKSPLOIT/root/hacker/windows/version.txt"

function getOS() {
  var userAgent = window.navigator.userAgent,
      platform = window.navigator?.userAgentData?.platform || window.navigator.platform,
      macosPlatforms = ['Macintosh', 'MacIntel', 'MacPPC', 'Mac68K'],
      windowsPlatforms = ['Win32', 'Win64', 'Windows', 'WinCE'],
      iosPlatforms = ['iPhone', 'iPad', 'iPod'],
      os = null;

  if (macosPlatforms.indexOf(platform) !== -1) {
    os = 'Mac OS (unavailiable)';
  } else if (iosPlatforms.indexOf(platform) !== -1) {
    os = 'iOS (unavailiable)';
	versionurl = "https://raw.githubusercontent.com/canarddu38/DUCKSPLOIT/root/hacker/windows/version.txt";
  } else if (windowsPlatforms.indexOf(platform) !== -1) {
    os = 'Windows';
	versionurl = "https://raw.githubusercontent.com/canarddu38/DUCKSPLOIT/root/hacker/windows/version.txt";
  } else if (/Android/.test(userAgent)) {
    os = 'Android';
	versionurl = "https://raw.githubusercontent.com/canarddu38/DUCKSPLOIT/root/hacker/android/version.txt";
  } else if (/Linux/.test(platform)) {
    os = 'Linux';
	versionurl = "https://raw.githubusercontent.com/canarddu38/DUCKSPLOIT/root/hacker/linux/version.txt";
  }

  return os;
}

detectedOS = getOS();


fetch(versionurl)
  .then(response => response.text())
  .then(data => {
  var message = 'last version ('.concat(detectedOS);
  document.getElementById("version").innerHTML = message.concat("): ".concat(data));
  });
  
  


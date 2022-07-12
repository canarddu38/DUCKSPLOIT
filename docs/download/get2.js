fetch("https://raw.githubusercontent.com/canarddu38/DUCKSPLOIT/root/hacker/windows/version.txt")
  .then(response => response.text())
  .then(data1 => {
  document.getElementById("windows_version").innerHTML = data1;
  });
  
fetch("https://raw.githubusercontent.com/canarddu38/DUCKSPLOIT/root/hacker/linux/version.txt")
  .then(response => response.text())
  .then(data2 => {
  document.getElementById("linux_version").innerHTML = data2;
  });
  
fetch("https://raw.githubusercontent.com/canarddu38/DUCKSPLOIT/root/hacker/android/version.txt")
  .then(response => response.text())
  .then(data3 => {
  document.getElementById("android_version").innerHTML = data3;
  });
  

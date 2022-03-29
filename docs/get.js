onst getDeviceType = () => {
  const ua = navigator.userAgent;
  if (/(tablet|ipad|playbook|silk)|(android(?!.*mobi))/i.test(ua)) {
    return "tablet";
  }
  if (
    /Mobile|iP(hone|od)|Android|BlackBerry|IEMobile|Kindle|Silk-Accelerated|(hpw|web)OS|Opera M(obi|ini)/.test(
      ua
    )
  ) {
    return "mobile";
  }
  return "desktop";
};





// As with JSON, use the Fetch API & ES6
fetch('https://raw.githubusercontent.com/canarddu38/DUCKSPLOIT/root/hacker/version.txt')
  .then(response => response.text())
  .then(data => {
  	// Do something with your data
	
  	document.getElementById("version").innerHTML = 'last version: V'.concat(data);
  });
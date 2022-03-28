// As with JSON, use the Fetch API & ES6
fetch('https://raw.githubusercontent.com/canarddu38/DUCKSPLOIT/root/hacker/version.txt')
  .then(response => response.text())
  .then(data => {
  	// Do something with your data
	
  	document.getElementById("version").innerHTML = 'last version: V'.concat(data);
  });
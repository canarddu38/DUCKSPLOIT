let download_url_lin="";
let download_url_win="";
let download_url_and="";
function httpGet(theUrl) {
	let xmlHttpReq = new XMLHttpRequest();
	xmlHttpReq.open("GET", theUrl, false);
	xmlHttpReq.send(null);
	return xmlHttpReq.responseText;
}

function onload()
{
	//snow effect
	for (i = 0; i < 50; i++)
	{
		document.body.innerHTML+="<div class='snowflake'></div>";
	}
	
	document.getElementById('linuxdownload').innerHTML+="<select name='version_lin' id='version_lin'>";
	document.getElementById('windowsdownload').innerHTML+="<select name='version_win' id='version_win'>";
	document.getElementById('androiddownload').innerHTML+="<select name='version_and' id='version_and'>";
	
	//versions
	versions = httpGet("https://raw.githubusercontent.com/canarddu38/DUCKSPLOIT/root/hacker/versions.txt");
	var linux_ver = versions.substring(
		versions.indexOf("linux:") + 6, 
		versions.lastIndexOf("android:")
	);

	var windows_ver = versions.substring(
		versions.indexOf("windows:") + 8, 
		versions.lastIndexOf("linux:")
	);
	
	var android_ver = versions.substring(versions.indexOf("android:") + 8);

	//linux
	versions_lin_list = linux_ver.split("\n");
	document.getElementById("linux_version").innerText = versions_lin_list[0];
	for(var i = 0; i < versions_lin_list.length; i++) {
		if(versions_lin_list[i] == "" || versions_lin_list[i] == " ")
		{}
		else
		{
			temp = versions_lin_list[i].split("|");
			temp[0]="Version: "+temp[0];
			if(download_url_lin=="")
			{
				download_url_lin=temp[1];
			}
			if(!temp[0] == "")
			{
				document.getElementById('version_lin').innerHTML+="<option onclick='download_url_lin="+temp[1]+"' value='"+temp[0]+"'>"+temp[0]+"</option>";
			}
		}
	}
	document.getElementById('linuxdownload').innerHTML+="<a onclick='window.location=`"+download_url_lin+"`' style='background-color: #e3c032' class='u-btn u-button-style u-palette-2-base u-btn-1'>Download</a>";
	
	//windows
	versions_win_list = windows_ver.split("\n");
	document.getElementById("windows_version").innerText = versions_win_list[0];
	for(var i = 0; i < versions_win_list.length; i++) {
		if(versions_win_list[i] == "" || versions_win_list[i] == " ")
		{}
		else
		{
			temp = versions_win_list[i].split("|");
			temp[0]="Version: "+temp[0];
			if(download_url_win=="")
			{
				download_url_win=temp[1];
			}
			if(!temp[0] == "")
			{
				document.getElementById('version_win').innerHTML+="<option onclick='download_url_win="+temp[1]+"' value='"+temp[0]+"'>"+temp[0]+"</option>";
			}
		}
	}
	document.getElementById('windowsdownload').innerHTML+="<a onclick='window.location=`"+download_url_win+"`' style='background-color: #599ce0' class='u-btn u-button-style u-palette-2-base u-btn-1'>Download</a>";
	
	//android
	versions_and_list = android_ver.split("\n");
	document.getElementById("android_version").innerText = versions_and_list[0];
	for(var i = 0; i < versions_and_list.length; i++) {
		if(versions_and_list[i] == "" || versions_and_list[i] == " ")
		{}
		else
		{
			temp = versions_and_list[i].split("|");
			temp[0]="Version: "+temp[0];
			if(download_url_and=="")
			{
				download_url_and=temp[1];
			}
			if(!temp[0] == "")
			{
				document.getElementById('version_and').innerHTML+="<option onclick='download_url_and="+temp[1]+"' value='"+temp[0]+"'>"+temp[0]+"</option>";
			}
		}
	}
	document.getElementById('androiddownload').innerHTML+="<a onclick='window.location=`"+download_url_and+"`' style='background-color: #a4c639' class='u-btn u-button-style u-palette-2-base u-btn-1'>Download</a>";
}

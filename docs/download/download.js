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
	for (i = 0; i < 75; i++)
	{
		document.body.innerHTML+="<div class='snowflake'></div>";
	}
	
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
	for(var i = 0; i < versions_lin_list.length; i++) {
		if(versions_lin_list[i] == "" || versions_lin_list[i] == " ")
		{}
		else
		{
			temp = versions_lin_list[i].split("|");
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
	document.getElementById('linuxdownload').innerHTML+="<a onclick='window.location=`"+download_url_lin+"`' class='u-btn u-button-style u-palette-2-base u-btn-1'>Download</a>";
	//windows
	// versions_win_list = windows_ver.split("\n");
	// for(var i = 0; i < versions_win_list.length; i++) {
		// if(versions_win_list[i] == "" || versions_win_list[i] == " ")
		// {}
		// else
		// {
			// temp = versions_win_list[i].split("|");
			// if(download_url_win=="")
			// {
				// download_url_win=temp[1];
			// }
			// if(!temp[0] == "")
			// {
				// document.getElementById('version_win').innerHTML+="<option onclick='download_url_win="+temp[1]+"' value='"+temp[0]+"'>"+temp[0]+"</option>";
			// }
		// }
	// }
	// document.getElementById('windowsdownload').innerHTML+="<a onclick='window.location=`"+download_url_win+"`' class='u-btn u-button-style u-palette-2-base u-btn-1'>Download</a>";
	
	//android
	versions_and_list = android_ver.split("\n");
	for(var i = 0; i < versions_and_list.length; i++) {
		if(versions_and_list[i] == "" || versions_and_list[i] == " ")
		{}
		else
		{
			temp = versions_and_list[i].split("|");
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
	document.getElementById('androiddownload').innerHTML+="<a onclick='window.location=`"+download_url_and+"`' class='u-btn u-button-style u-palette-2-base u-btn-1'>Download</a>";
}
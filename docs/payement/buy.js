function buy()
{
	function makeid(length) {
		var result           = '';
		var characters       = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
		var charactersLength = characters.length;
		for ( var i = 0; i < length; i++ ) {
		  result += characters.charAt(Math.floor(Math.random() * charactersLength));
	   }
	   return result;
	}
	function deleteAllCookies() {
		var cookies = document.cookie.split(";");

		for (var i = 0; i < cookies.length; i++) {
			var cookie = cookies[i];
			var eqPos = cookie.indexOf("=");
			var name = eqPos > -1 ? cookie.substr(0, eqPos) : cookie;
			document.cookie = name + "=;expires=Thu, 01 Jan 1970 00:00:00 GMT";
		}
	}
	deleteAllCookies();
	var newclientid = makeid(32);
	document.cookie = newclientid;
	newclientid = "!"+newclientid+"!";

	var url = "https://dsrestapi-default-rtdb.firebaseio.com/clients2.json";

	var xhr = new XMLHttpRequest();
	xhr.open("PATCH", url);

	xhr.setRequestHeader("Accept", "*/*");
	xhr.setRequestHeader("Content-Type", "application/json");

	xhr.onreadystatechange = function () {
	   if (xhr.readyState === 4) {
		  console.log(xhr.status);
		  console.log(xhr.responseText);
	   }};

	var data = `{
	  "test": "KnBLpKfobLybzDqiqKYo",
	  "newey": "null"
	}`;

	xhr.send(data);

	
	document.forms["form"].submit();
}
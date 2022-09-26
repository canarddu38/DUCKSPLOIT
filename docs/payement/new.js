function load()
{
	var url = "https://dsrestapi-default-rtdb.firebaseio.com/clients.json";

	var xhr = new XMLHttpRequest();
	xhr.open("GET", url);

	xhr.setRequestHeader("Accept", "*/*");

	xhr.onreadystatechange = function () {
	   if (xhr.readyState === 4) {
			let resultmap = new Map(Object.entries(JSON.parse(xhr.responseText)));
			if (resultmap.has("!"+document.cookie+"!"))
			{
				String.prototype.insert = function(index, string) {
				  if (index > 0) {
					return this.substring(0, index) + string + this.substr(index);
				  }

				  return string + this;
				};


				var newkey = makeid(16);
				newkey = newkey.insert(4, "-").insert(9, "-").insert(14, "-");

				document.getElementById("licence_key").innerHTML = newkey;
				download("ducksploit_pro-licence-key.txt",newkey);

				newkey = "!"+newkey+"!"

				let data = {};
				data["test"] = "KnBLpKfobLybzDqiqKYo";
				data[newkey] = "null";


				fetch("https://dsrestapi-default-rtdb.firebaseio.com/licence_keys.json", {
				  method: "PATCH",
				  headers: {'Content-Type': 'application/json'}, 
				  body: JSON.stringify(data)
				}).then(res => {
				  console.log("Request complete! response:", res);
				});


				function download(filename, text) {
				  var element = document.createElement('a');
				  element.setAttribute('href', 'data:text/plain;charset=utf-8,' + encodeURIComponent(text));
				  element.setAttribute('download', filename);

				  element.style.display = 'none';
				  document.body.appendChild(element);

				  element.click();

				  document.body.removeChild(element);
				}


				function makeid(length) {
					var result           = '';
					var characters       = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
					var charactersLength = characters.length;
					for ( var i = 0; i < length; i++ ) {
					  result += characters.charAt(Math.floor(Math.random() * 
				 charactersLength));
				   }
				   return result;
				}
			}
			else
			{
				alert("Error");
				window.location.replace("https://ducksploit.com/payement/buy_pro.html");
			}
	   }};

	xhr.send();
}
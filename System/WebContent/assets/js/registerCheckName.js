function createRequest(url) {
	http_request = new XMLHttpRequest();
	http_request.onreadystatechange = getResult;
	http_request.open("GET",url,true);
	http_request.send(null);
}

function getResult() {
	if(http_request.readyState == 4) {
		if(http_request.status == 200) {
			document.getElementById("into").innerHTML = http_request.responseText;
		} else {
			alert("您所请求的页面有错误!");
		}
	}
}

function checkRegisterName(name) {
	createRequest("registerNameCheck.jsp?name=" + name);
}
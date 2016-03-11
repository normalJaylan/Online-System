function createRequest(url) {
	http_request = new XMLHttpRequest();
	http_request.onreadystatechange = getResult;
	http_request.open("GET",url,true);
	http_request.send(null);
}

function getResult() {
	if(http_request.readyState == 4) {
		if(http_request.status == 200) {
			alert(http_request.responseText);
		} else {
			alert("您所请求的页面有错误!");
		}
	}
}

function getMyPatient(name) {
	
	createRequest("MyPatient.jsp?name=" + name);
}
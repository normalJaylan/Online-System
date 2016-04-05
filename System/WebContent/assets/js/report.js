function test(){
	$.ajax({
		type:"post",
		url:"readReport.jsp?name=侯杏林",
		success:function(data){
			alert(data);
		}
	});
}
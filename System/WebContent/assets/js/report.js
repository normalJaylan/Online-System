function open_chat(chat_url){
	console.log(chat_url);
	window.open(chat_url);
}

$(document).ready(function(){
		$.ajax({
			type:"post",
			url:"readReport.jsp?name="+name,
			success:function(data){
				console.log(data);
				var report_data = JSON.parse(data);
				var report_li = "";
				for(var i in report_data){
					var chat_url = "change_report.jsp?patient_name="+report_data[i]["name"];
					report_li +="<li>\
									<p>"+name+"医生对"+report_data[i]["name"]+"的报告</p>\
									<p>报告内容："+report_data[i]["context"]+"</p>\
									<div><button class=\"submit_answer flt_rt\" onclick=\'open_chat(\""+ chat_url +"\");\'>修改</button></div>\
								</li>" 
				}
				$(".table_report_ul").append(report_li);
			}
		});
})


function showContext(patientName) {
	$.ajax({
		type:"post",
		url:"showContext.jsp?name=" + patientName,
		success:function(data) {
			alert(data);
		}
	});
}

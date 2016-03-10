
function showMyClient(name){
	$.ajax
	({
		type:'POST',
		url:'myPatient.jsp?name=' + name,
		success:function(data)
		{
		   var client_data = JSON.parse(data);
		   console.log(client_data);
		   var client_data_table_tr = "";
		   for(var i in client_data){
			   console.log(client_data[i]);
                client_data_table_tr += "<tr>\
											<td>"+ client_data[i]['name'] +"</td>\
											<td>"+ client_data[i]['age'] +"</td>\
											<td>"+ client_data[i]['sex'] +"</td>\
											<td>"+ client_data[i]['phone'] +"</td>\
											<td>"+ client_data[i]['profession'] +"</td>\
						                </tr>"

		    }
		    $("#hor-minimalist-client>tbody").append(client_data_table_tr);
		    $("#hor-minimalist-client").css("display","block");
		}
	 });

}


function showPersonInfo(name){
    $.ajax
	({
		type:'POST',
		url:'myInfo.jsp?name=' + name,
		success:function(data)
		{
		   var person_data = JSON.parse(data);
		   var person_data_p = "";
           person_data_p = "<p>姓名："+ person_data['name'] +"</p>\
							<p>学历："+ person_data['education'] +"</p>\
							<p>电话："+ person_data['telephone'] +"</p>\
							<p>年龄："+ person_data['age'] +"</p>"
						     
		   $("#personInfo_table").append(person_data_p);
           $("#personInfo_table").css("display","block");
		}
	 });
}



function showMyRecord(name){
	$.ajax
	({
		type:'POST',
		url:'XXXX.jsp?name=' + name,
		success:function(data)
		{
		   var record_data = JSON.parse(data);
		   var record_data_table_tr = "";
		   for(var i in record_data){
                record_data_table_tr += "<tr>\
											<td>"+ record_data[i][0] +"</td>\
											<td>"+ record_data[i][1] +"</td>\
											<td>"+ record_data[i][2] +"</td>\
											<td>"+ record_data[i][3] +"</td>\
											<td>"+ record_data[i][4] +"</td>\
						                </tr>"

		    }
		    $("#hor-minimalist-client>tbody").append(record_data_table_tr);
		}
	 });

}


function getEvaluationInfo(name){
    $.ajax
	({
		type:'POST',
		url:'XXXX.jsp?name=' + name,
		success:function(data)
		{
		   var evaluation_data = JSON.parse(data);
		   var evaluation_data_tr = "";
		   for(var i in evaluation_data){
                evaluation_data_tr += "<tr>\
											<td>"+evaluation_data_tr[i][0]+"</td>\
											<td>"+evaluation_data_tr[i][1]+"</td>\
											<td>"+evaluation_data_tr[i][2]+"</td>\
											<td>"+evaluation_data_tr[i][3]+"</td>\
											<td>"+evaluation_data_tr[i][4]+"</td>\
											<td>"+evaluation_data_tr[i][5]+"</td>\
											<td>"+evaluation_data_tr[i][6]+"</td>\
											<td><button id=\"goInToEvaluation\" class=\"button next\" >go</button></td>\
						                </tr>"

		    }
		    $("#hor-minimalist-client>tbody").append(evaluation_data_tr);
		    $("#goInToEvaluation").click(function(){
		    	var tlk_chat = "<div id=\"tlkio\" data-channel=\""+ evaluation_data_tr[i][0] +"\" style=\"width:100%;height:400px;\"></div>\
		    	                       <script async src=\"http://tlk.io/embed.js\" type=\"text/javascript\"></script><div>聊天框</div><button>回复</button>"
		    	$("#hor-minimalist-client").css("display","none");
		    	$("div.right-container").append(tlk_chat);
		    })
		}
	 });
}




window.onload = function(){
	
}

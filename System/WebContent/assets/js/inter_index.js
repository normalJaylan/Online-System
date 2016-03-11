
function showMyClient(name){
	$.ajax
	({
		type:'POST',
		url:'myPatient.jsp?name=' + name,
		success:function(data)
		{
		   var client_data = JSON.parse(data);
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
		url:'askRecord.jsp?name=' + name,
		success:function(data)
		{
		   var record_data = JSON.parse(data);
		   var record_data_table_tr = "";
		   for(var i in record_data){
                record_data_table_tr += "<tr>\
											<td>"+ record_data[i]['name'] +"</td>\
											<td>"+ record_data[i]['age'] +"</td>\
											<td>"+ record_data[i]['sex'] +"</td>\
											<td>"+ record_data[i]['profession'] +"</td>\
											<td>"+ record_data[i]['phone'] +"</td>\
											<td>"+ record_data[i]['table'] +"</td>\
											<td>"+ record_data[i]['record'] +"</td>\
											<td><a href=\""+ record_data[i]['path'] +"\">报告</a></td>\
						                </tr>"

		    }
		    $("#hor-minimalist-client>tbody").append(record_data_table_tr);
		}
	 });

}

function open_chat(chat_url){
	console.log(chat_url);
	window.open(chat_url);
}


function getEvaluationInfo(name){
    $.ajax
	({
		type:'POST',
		url:'selectPatient.jsp?name=' + name,
		success:function(data)
		{
		   var evaluation_data = JSON.parse(data);
		   var evaluation_data_tr = "";   
		   for(var i in evaluation_data){
			   var chat_url = "chat_page.jsp?doctor_name="+name+"&patient_name="+evaluation_data[i]['name'];
               var url = "sadas"; 
			   evaluation_data_tr += "<tr>\
											<td>"+evaluation_data[i]['name']+"</td>\
											<td>"+evaluation_data[i]['age']+"</td>\
											<td>"+evaluation_data[i]['sex']+"</td>\
											<td>"+evaluation_data[i]['profession']+"</td>\
											<td>"+evaluation_data[i]['phone']+"</td>\
											<td>"+evaluation_data[i]['table']+"</td>\
											<td>"+evaluation_data[i]['record']+"</td>\
											<td><button id=\'goInToEvaluation\' class=\'button next\' onclick=\'open_chat(\""+ chat_url +"\");\'>go</button></td>\
						                </tr>"

		    }
		    $("#hor-minimalist-client>tbody").append(evaluation_data_tr);
		   
		}
	 });
}




window.onload = function(){
	
}

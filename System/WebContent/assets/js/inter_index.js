function jumpPageNumber(number){
	var table_ul = $("ul.table_information_ul").children();
	var number_change = parseInt(number.innerHTML);
	var page_a = $(".page").children();
	for(var j = 0, page_length = page_a.length;j < page_length;j++){
		page_a.eq(j).attr("class","");
	}
	number.className = 'active';
	for(var i = 0, ul_length = table_ul.length; i < ul_length;i++){
		if(i>= (number_change-1)*6 && i <= number_change*6-1){
			table_ul.eq(i).css("display","block");
			continue;
		}
		table_ul.eq(i).css("display","none");
	}
}


function showMyClient(name){
	  var page_number;
      var jump_a = "";
	$.ajax
	({
		type:'POST',
		url:'myPatient.jsp?name=' + name,
		success:function(data)
		{
		   var client_data = JSON.parse(data);
		   var client_data_table_tr = "";
		   for(var i in client_data){
			   if(i < 6){
                client_data_table_tr += '<li style=\"display: block\">\
											<p>姓名：'+ client_data[i]['name'] +'</p>\
											<p>年龄：'+ client_data[i]['age'] +'</p>\
											<p>性别：'+ client_data[i]['sex'] +'</p>\
											<p>职业：'+ client_data[i]['profession'] +'</p>\
											<p>联系方式：'+ client_data[i]['phone'] +'</p>\
										</li>';
                continue;
			   }
			   else{
				   client_data_table_tr += '<li style=\"display: none\">\
						<p>姓名：'+client_data[i]['name']+'</p>\
						<p>年龄：'+client_data[i]['age']+'</p>\
						<p>性别：'+client_data[i]['sex']+'</p>\
						<p>职业：'+client_data[i]['profession']+'</p>\
						<p>联系方式：'+client_data[i]['phone']+'</p>\
					</li>';
				   continue;
			   }

		    }
		   console.log(i);
		    $(".table_information_ul").append(client_data_table_tr);
		    page_number = Math.ceil(i / 6);
		    console.log(page_number);
		    for(var j = 1;j <= page_number;j++){
		    	if(j == 1){
		    	     jump_a += '<a href=\"javascript:void(0);\" onclick=\"jumpPageNumber(this);\" class=\"active\">'+ j +'</a>'
		        }
		        else{
		        	 jump_a += '<a href=\"javascript:void(0);\" onclick=\"jumpPageNumber(this);\">'+ j +'</a>'
		        }
		    }
		    console.log(jump_a);
		    $(".page").append(jump_a);
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
			   var person_data_span = "";
			   $(".personInfo_table_ul li").eq(0).find("span").html(person_data['name']);
			   $(".personInfo_table_ul li").eq(1).find("span").html(person_data['age']);
			   $(".personInfo_table_ul li").eq(2).find("span").html(person_data['telephone']);
			   $(".personInfo_table_ul li").eq(3).find("span").html(person_data['education']);
			   $(".personInfo_table_ul li").eq(4).find("span").html(person_data['mail']);
	           
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

function downConsult(doctor_name){
    $.ajax({
    	type:"get",
    	url:"downConsult.jsp?doctor=" + doctor_name,
    	success:function(data){
    		var patient_comment = JSON.parse(data);
    		var patient_comment_li = '';
    		for(var i in patient_comment){
    			patient_comment_li += '<li class=\'comment_li\'>\
											<h3>'+patient_comment[i]['name']+'的留言</h3>\
											<p>'+patient_comment[i]['context']+'</p>\
											<input type=\'text\' name=\'answer_pantient\' class=\'answer_pantient\' />\
											<input type=\'submit\' class=\'submit_answer\' value=\'回复\' onclick=\"upConsult(\''+ doctor_name +'\',\''+ patient_comment[i]['name'] +'\',\''+ patient_comment[i]['context'] +'\',this);\" />\
										</li>'	
    		}
    		$(".comment_ul").append(patient_comment_li);
    	}
    });
}

function upConsult(doctor,patient,chat_content,factor){
//	console.log(doctor,patient,$(factor).prev().val());
    $.ajax({
    	type:"post",
    	url:"upConsult.jsp",
    	data:{
    		doctorName:doctor,
    		patientName:patient,
    		context:$(factor).prev().val(),
    		chat:chat_content,
    	},
    	success:function(data){
    		if(data)
            $(factor).parent().remove();
    	}
    });
}



$(document).ready(function(){
	var input_text = "提交";
	var class_name = ["name","age","telephone","education","mail"];
	$("#submit_report").submit(function(){
		var change_domain = $("#input_about_evaluation").val();
		if(change_report == ''){
			return false;
		}
		setTimeout('window.close()',2000);
	})
	$(".btnplayit").on("click",function(){
		var $new_button = $("<button class=\"btnplayit_submit\">提交<tton>")
        $(this).prev().html("<input class=\"personInfo_input\" />");
        $(this).parent().append($new_button);
        $(this).remove();
	});
	$(".personInfo_table_ul li").on("click",".btnplayit_submit",function(){
			var class_number = $(".personInfo_table_ul>li").index($(this).parent());
			$.ajax({
				type: "post",
				url: "changeInfo.jsp",
				data: {
					doctor: name,
					number: class_name[class_number],
					changeData: $(".personInfo_input").val(),
				},
				success: function(){
					location.reload();
				}
			});
		});
})


window.setInterval("showContent();",1000);
window.setInterval("deleteMessage();",600000);

function showContent(){

	$.ajax
	({
		type : 'GET',
		url : 'Message?action=read',
		success:function(data)
		{	
			var chat_content = JSON.parse(data);
			
			var chat_content_div = '';
			for(var i in chat_content){
			/*	console.log(chat_content[i]['profession'],typeof chat_content[i]['profession']);*/
				if(chat_content[i]['profession'] === 'doctor'){
					chat_content_div += "<div class=\"box_left chat_tr\">\
									        <img class=\"box_left\" src=\"assets/img/chat_img.png\" style=\"height: 50px;width: 50px;\">\
										    <div>\
										        <p class=\"chat_nick\">"+chat_content[i]['name']+"</p>\
											    <p class=\"chat_content arrow_left\">"+chat_content[i]['context']+"</p>\
									        </div>\
									    </div>";
				}
				else{
					chat_content_div += '<div class=\"box_right chat_tr\">\
									        <img class=\"box_right\" src=\"assets/img/chat_img.png\" style=\"height: 50px;width: 50px;\">\
										    <div>\
										        <p class=\"chat_nick\">'+chat_content[i]['name']+'</p>\
											    <p class=\"chat_content arrow_right\">'+chat_content[i]['context']+'</p>\
									        </div>\
									    </div>';
				}
				
			}
			
            if(chat_content_div.replace(/>\s+</g,"><") != $("#chat_content").html().replace(/>\s+</g,"><")){
            	console.log("1");
				$("#chat_content").html("");
				$("#chat_content").append(chat_content_div);
            }
		}
	});

   
   }


function deleteMessage(){
	$.ajax({
		type: 'get',
		url:'Message?action=delete'
	});
}

$(document).ready(function() {
    $('#chat_box>footer>form').submit(function(){
    	
        var new_chat_content = $(this).find('#submit_text').val();
        var new_chat_content_div = '<div class=\"box_left chat_tr\">\
									        <img class=\"box_left\" src=\"assets/img/chat_img.png\" style=\"height: 50px;width: 50px;\"/>\
										    <div>\
										        <p class=\"chat_nick\">'+name+'</p>\
											    <p class=\"chat_content arrow_left\">'+new_chat_content+'</p>\
									        </div>\
									  </div>';
      
		$('#chat_content').append(new_chat_content_div);
		document.getElementById('chat_content').scrollTop = document.getElementById('chat_content').scrollHeight*2;	
        if(new_chat_content == '') {
            return false;
        }        setTimeout("document.getElementById('submit_text').value = ''",300);
    });

     $('form#submit_report').submit(function(){
         var report_content = $('#input_about_evaluation').val();
         if(report_content == ''){
         	return false;
         }
     });

});






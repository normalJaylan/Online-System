function check_login(para,name){
    //2是用户不存在，1是密码错误，0是成功
    if(para == 2){
        document.getElementById("into_name").innerHTML='用户名不存在，请先注册';
        document.getElementsByTagName("form")[0].reset();
    }
    else if(para == 1){
    	document.getElementById("into_password").innerHTML='密码错误，请重新输入';
    	document.getElementsByTagName("form")[0].reset();
    }
    else if(para == 0){
  //  	alert(name);
   //     window.location.href="inter_index.jsp?name= '+ name +'";//这里是跳转个人页面的网址
    }
}





$(document).ready(function() {

    $('.page-container form').submit(function(){
        var username = $(this).find('.username').val();
        var password = $(this).find('.password').val();
        if(username == '') {
            $(this).find('.error').fadeOut('fast', function(){
                $(this).css('top', '27px');
            });
            $(this).find('.error').fadeIn('fast', function(){
                $(this).parent().find('.username').focus();
            });
            return false;
        }
		
        if(password == '') {
            $(this).find('.error').fadeOut('fast', function(){
                $(this).css('top', '96px');
            });
            $(this).find('.error').fadeIn('fast', function(){
                $(this).parent().find('.password').focus();
            });
            return false;
        }
    });



    $('.page-container form .username, .page-container form .password').keyup(function(){
        $(this).parent().find('.error').fadeOut('fast');
    });


   

    $('#register').click(function(){
        window.location.href="register.html";
    });

    

});



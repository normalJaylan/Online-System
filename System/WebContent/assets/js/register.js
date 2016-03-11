


$(document).ready(function() {

    $('.page-container form').submit(function(){
        var username = $(this).find('.username').val();
        var password = $(this).find('.password').val();
        var age = $(this).find('.age').val();
        var phone = $(this).find('.phone').val();
        var school = $(this).find('.school').val();
        if(username == '') {
            $(this).find('.error').fadeOut('fast', function(){
                $(this).css('top', '27px');
            });
            $(this).find('.error').fadeIn('fast', function(){
                $(this).parent().find('.username').focus();
            });
            return false;
        }
        //这上下的五个可以用函数封装		
        if(password == '') {
            $(this).find('.error').fadeOut('fast', function(){
                $(this).css('top', '96px');
            });
            $(this).find('.error').fadeIn('fast', function(){
                $(this).parent().find('.password').focus();
            });
            return false;
        }

        if(age == '') {
            $(this).find('.error').fadeOut('fast', function(){
                $(this).css('top', '160px');
            });
            $(this).find('.error').fadeIn('fast', function(){
                $(this).parent().find('.age').focus();
            });
            return false;
        }

        if(phone == '') {
            $(this).find('.error').fadeOut('fast', function(){
                $(this).css('top', '227px');
            });
            $(this).find('.error').fadeIn('fast', function(){
                $(this).parent().find('.phone').focus();
            });
            return false;
        }

        if(school == '') {
            $(this).find('.error').fadeOut('fast', function(){
                $(this).css('top', '295px');
            });
            $(this).find('.error').fadeIn('fast', function(){
                $(this).parent().find('.school').focus();
            });
            return false;
        }
        alert(document.getElementById("into").innerHTML);
        if(document.getElementById("into").innerHTML !== ""){
     	   return false;
         }
    });

    $('.page-container form .username, .page-container form .password').keyup(function(){
        $(this).parent().find('.error').fadeOut('fast');
    });


   $('.page-container form .username').blur(function(){
       if($(this).val() !== ""){
           checkRegisterName($(this).val());
       }
    });


     $('#back_login').click(function(){
        window.location.href="index.jsp";
    });

});
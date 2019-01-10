/**
 * Created by Demon on 2015/5/25.
 */
var UserInfoPage = function (){
    return {
        init:function (){
            $("#info").validate({
                errorElement: 'span', //default input error message container
                errorClass: 'help-block', // default input error message class
                focusInvalid: false, // do not focus the last invalid input
                onsubmit:true,
                rules: {
                    username: {
                        required: true
                    },
                    email: {
                        email:true
                    }
                },

                messages: {
                    username: {
                        required: "昵称不能为空!"
                    },
                    email: {
                        email:"邮箱格式不正确!"
                    }
                },

                highlight: function (element) { // hightlight error inputs
                    $(element)
                        .closest('.col-sm-4').addClass('has-error'); // set error class to the control group
                },

                success: function (label) {
                    label.closest('.col-sm-4').removeClass('has-error');
                    label.remove();
                },

                errorPlacement: function (error, element) {
                    error.insertAfter(element.closest('.input-group'));
                },

                submitHandler: function (form) {
                    var user = {
                        userId:$("#userId").val(),
                        username:$("#username").val(),
                    };
                    if ($("#email").val() != "")
                        user = $.extend(user,{email:$("#email").val()});
                    $.ajax({
                        url:basePath + "userCenter/updateUserInfo",
                        type:"post",
                        data:user,
                        dataType:"json",
                        success:function(data){
                            setTimeout(function (){toast.success("修改成功!")},500);
                            setTimeout(function (){location.reload()},3000);
                        }
                    })
                }
            });
        }
    }
}();
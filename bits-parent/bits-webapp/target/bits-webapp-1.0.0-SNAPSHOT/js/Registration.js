/**
 * Created by Demon on 2015/5/24.
 */
var Registration = function () {
    var handleLogin = function () {
        $('.registration-form').validate({
            errorElement: 'span', //default input error message container
            errorClass: 'help-block', // default input error message class
            focusInvalid: false, // do not focus the last invalid input
            onsubmit:true,
            rules: {
                loginname: {
                    required: true,
                    remote: {
                        url: basePath + "admin/user/validateUserName",
                        type: "POST",
                        dataType: "json",
                        data: {
                            loginName: function () {
                                return $("#loginname").val();
                            },
                            id: function () {
                                return 0;
                            }
                        }
                    }
                },
                username:{
                    required: true
                },
                password: {
                    required: true
                },
                repassword: {
                    required: true,
                    equalTo: "#password"
                }
            },

            messages: {
                loginname: {
                    required: "用户名不能为空！",
                    remote: "账号已经存在！"
                },
                username:{
                    required:"昵称不能为空！"
                },
                password: {
                    required: "密码不能为空！"
                },
                repassword:{
                    required: "确认密码不能为空!",
                    equalTo:"密码不一致!"
                }
            },

            invalidHandler: function (event, validator) { //display error alert on form submit
                $('.alert-danger', $('.login-form')).show();
            },

            highlight: function (element) { // hightlight error inputs
                $(element)
                    .closest('.form-group').addClass('has-error'); // set error class to the control group
            },

            success: function (label) {
                label.closest('.form-group').removeClass('has-error');
                label.remove();
            },

            errorPlacement: function (error, element) {
                error.insertAfter(element.closest('.input-icon'));
            },

            submitHandler: function (form) {
                $.ajax({
                    url: basePath + "admin/user/addUser",
                    type:"post",
                    data:{
                        loginName:$("#loginname").val(),
                        password:$("#password").val(),
                        username:$("#username").val(),
                        roleId :$("#checkId").val()
                    },
                    dataType:"json",
                    success:function (data){
                        setTimeout(function (){toast.success("注册成功!")},500);
                        setTimeout(function (){toast.info("3秒后去登录")},1000);
                        setTimeout(function (){location.href = basePath + "login"},3000);
                    }
                })
            }
        });
    };

    return {
        init: function () {
            handleLogin();

            //$.backstretch([
                //"assets/admin/pages/media/bg/1.jpg",
               // "assets/admin/pages/media/bg/2.jpg",
               // "assets/admin/pages/media/bg/3.jpg",
               // "assets/admin/pages/media/bg/4.jpg",
               // "assets/admin/pages/media/bg/5.jpg",
              //  "assets/admin/pages/media/bg/6.jpg",
              //  "assets/admin/pages/media/bg/7.jpg",
            //    "assets/admin/pages/media/bg/8.jpg"
           // ], {
            //    fade: 1000,
            //    duration: 5000
          // });
        }
    }
}();
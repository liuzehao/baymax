var RegistrationPage = function () {
    var $username = $("#username");
    var $password = $("#password");
    var $confirm = $("#confirm-password");
    var $submitBtn = $("#submit");
    var handleValidate = function () {

    };

    var showSuccess = function (msg) {

    };
    var showError = function (msg) {

    };
    return {
        init: function () {
            $username.on("blur", function () {
                $.ajax({
                    url:"",
                    data:{
                        username:$username.val()
                    },
                    type:"post",
                    dataType:"json",
                    success:function(data){
                        if(!data) showError("用户名已存在");
                    }
                })
            });

            $submitBtn.on("click", function () {
                if (handleValidate()) {
                    $.ajax({
                        url: "",
                        type: "post",
                        data: {
                            username: $username.val(),
                            password: $password.val()
                        },
                        dataType:"json",
                        success: function (data) {
                            toast.success("创建成功！");
                            setTimeout(toHome(),3000);
                        }
                    })
                }
            });
        }
    }
}();

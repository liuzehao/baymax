var toast = function(){
    var options={
        "closeButton": false,
        "debug": false,
        "positionClass": "toast-top-right",
        "onclick": null,
        "showDuration": "300",
        "hideDuration": "1000",
        "timeOut": "5000",
        "extendedTimeOut": "1000",
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "fadeIn",
        "hideMethod": "fadeOut"
    };
    return {
        success:function(msg){
            msg =  msg || "操作成功！";
            toastr.options=options;
            toastr["success"](msg)
        },
        info:function(msg){
            toastr.options=options;
            toastr["info"](msg)
        },
        warning:function(msg){
            toastr.options=options;
            toastr["warning"](msg)
        },
        error:function(msg){
            msg =  msg || "操作失败！";
            toastr.options=options;
            toastr["error"](msg)
        },
        relationError:function(msg){
            msg =  msg || "您选择了未发布文件，请先发布！";
            toastr.options=options;
            toastr["error"](msg)
        }
    }
}();
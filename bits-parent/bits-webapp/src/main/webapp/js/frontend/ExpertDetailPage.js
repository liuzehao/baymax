/**
 * Created by Demon on 2015/5/22.
 */
var ExpertDetailPage = function (){
    var noteColorArr = [
        "note-success",
        "note-warning",
        "note-info",
        "note-danger"
    ];
    return {
        init:function (){
            $(".note").each(function (index,obj){
               $(this).addClass(noteColorArr[index % noteColorArr.length]);
            });
        }
    }
}();

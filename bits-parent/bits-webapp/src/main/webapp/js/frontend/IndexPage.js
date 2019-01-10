var IndexPage = function (){
    var noteColorArr = [
        "note-success",
        "note-warning",
        "note-info",
        "note-danger"
    ];
    var img = [
        "/assets/frontend/pages/img/people/img1-small.jpg",
        "/assets/frontend/pages/img/people/img2-small.jpg",
        "/assets/frontend/pages/img/people/img3-small.jpg",
        "/assets/frontend/pages/img/people/img4-small.jpg",
        "/assets/frontend/pages/img/people/img5-small.jpg"
    ];
    var topImg = [
        "/image/img/topIcon/top1.png",
        "/image/img/topIcon/top2.png",
        "/image/img/topIcon/top3.png",
        "/image/img/topIcon/top4.png",
        "/image/img/topIcon/top5.png",
        "/image/img/topIcon/top6.png",
        "/image/img/topIcon/top7.png",
        "/image/img/topIcon/top8.png",
        "/image/img/topIcon/top9.png",
        "/image/img/topIcon/top10.png"
    ];
    return {
        init:function (){
//            $(".note").each(function (index,obj){
//                $(this).addClass(noteColorArr[index % noteColorArr.length]);
//                $(this).find("img").attr("src",basePath + img[index % img.length]);
//            });

            $(".recent-work-item").each(function (index,obj){
                $(this).find("img.topIcon").attr("src",basePath + topImg[index]);
            })
        }
    }
}();

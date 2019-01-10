/**
 * Created by Demon on 2015/5/18.
 */
var ThemePage = function(){

    return {
        init:function (){
            $(".mix-grid").mixitup();
        },
        initBlockColor:function(){
            var color = [
                "blue",
                "green",
                "red-flamingo",
                "yellow-gold",
                "purple",
                "grey-gallery"
            ];
            var l = color.length;
            $(".dashboard-stat").each(function(index){
                $(this).addClass(color[index % l]);
            });
        },
        initTopIcon:function (){
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
            $(".recent-work-item").each(function (index,obj){
                $(this).find("img.topIcon").attr("src",basePath + topImg[index]);
            })
        },
        initChart:function (){
            function initChart(wrap){
                var option = {
                    title : {
                        text: '主题知识量分布图',
                        subtext:'',
                        x:'center'
                    },
                    tooltip : {
                        trigger: 'item',
                        formatter: "{a} <br/>{b} : {c} 个文件 ({d}%)"
                    },
                    legend: {
                        orient : 'vertical',
                        x : 'left',
                        data:wrap.legend
                    },
                    toolbox: {
                        show : true,
                        feature : {
                            mark : {show: false},
                            dataView : {show: false},
                            magicType : {show: false},
                            restore : {show: true},
                            saveAsImage : {show: true}
                        }
                    },
                    calculable : true,
                    series : [
                        {
                            name:'文件数:',
                            type:'pie',
                            radius : '55%',
                            center: ['50%', '60%'],
                            data:wrap.data
                        }
                    ]
                };

                var chart = echarts.init($("#dataKnow").get(0));
                chart.setOption(option);
            }
            $.ajax({
                url:basePath + "/theme/getChartData",
                dataType:"json",
                type:"post",
                success:function(data){
                    var wrap = {
                        legend:[],
                        data:[]
                    };
                    $.each(data,function (key,val){
                        wrap.legend.push(key);
                        wrap.data.push({name:key,value:val})
                    });
                    initChart(wrap);
                }
            })
        },
        initSelect2:function(){
            $("#fastSearch").select2({
                placeholder:"选择一个主题"
            })
            $("#fastSearch").change(function (){
                if ($(this).val() == "")
                return false;
                window.toThemeExperts($(this).val());
            })
        }
    }
}();
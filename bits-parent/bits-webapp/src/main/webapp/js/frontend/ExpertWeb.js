/**
 * Created by Dintama on 2015/8/16.
 */
var ExpertWeb = function(){

    var getNodes = function () {
        var result = [];
        var temp = {};
        $.ajax({
            url: basePath + "expertWeb/getPeopleRank?id=" + $("#themeName").val(),
            dataType: "json",
            type: "post",
            contentType: "json",
            async: false,
            success: function (data) {
                $.each(data, function (i, item) {
                    temp = {category: 1, name: item.peopleName.toString(), value: item.rank, label: item.peopleName.toString()};
                    result.push(temp);
                })
            },
            error: doError
        });
        return result;
    };

    var getLinks = function () {
        var result = [];
        var temp = {};
        $.ajax({
            url: basePath + "expertWeb/getThemeRelationship?id=" + $("#themeName").val(),
            type: "post",
            dataType: "json",
            contentType: "json",
            async: false,
            success: function (data) {
                $.each(data, function (i, item) {
                    temp = {source: item.idFirst, target: item.idSecond, weight: 1};
                    result.push(temp);
                })
            },
            error: doError
        });
        return result;
    };

    return {
        initChart:function (){
            function initChart(){
                var option = {
                    title: {
                        text: '相关领域专家网络',
                        subtext: '领域的核心专家位于关系图中央',
                        x: 'right',
                        y: 'bottom'
                    },
                    tooltip: {
                        trigger: 'item',
                        formatter: '{a} : {b}'
                    },
                    toolbox: {
                        show: true,
                        feature: {
                            restore: {show: true},
                            magicType: {show: true, type: ['force', 'chord']},
                            saveAsImage: {show: true}
                        }
                    },
                    legend: {
                        x: 'left',
                        data: ['合作伙伴']
                    },
                    series: [
                        {
                            type: 'force',
                            name: "人物关系",
                            ribbonType: false,
                            categories: [
                                {
                                    name: '人物'
                                }
                            ],
                            itemStyle: {
                                normal: {
                                    label: {
                                        show: true,
                                        textStyle: {
                                            color: '#333'
                                        }
                                    },
                                    nodeStyle: {
                                        brushType: 'both',
                                        borderColor: 'rgba(255,215,0,0.4)',
                                        borderWidth: 8
                                    },
                                    linkStyle: {
                                        type: 'curve'
                                    }
                                },
                                emphasis: {
                                    label: {
                                        show: false
                                        // textStyle: null      // 默认使用全局文本样式，详见TEXTSTYLE
                                    },
                                    nodeStyle: {
                                        //r: 30
                                    },
                                    linkStyle: {}
                                }
                            },
                            useWorker: false,
                            minRadius: 15,
                            maxRadius: 35,
                            gravity: 1.1,
                            scaling: 1.2,
                            roam: 'move',
                            nodes: getNodes(),
                            links: getLinks()

                        }
                    ]
                };

                var chart = echarts.init(document.getElementById('main'));
                chart.setOption(option);
            }
            initChart();
        }
    }
}();
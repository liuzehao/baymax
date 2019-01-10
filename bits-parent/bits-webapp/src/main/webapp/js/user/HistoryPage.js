var HistoryPage = function () {
    var reloadTable = function (pageFlag) {
        $("#datatable_ajax").DataTable().draw(pageFlag)
    };

    var handleRecords = function () {
        var grid = new DataTable();
        var $table = $("#datatable_ajax");
        grid.addAjaxParam("userId", $("#userId").val());
        grid.init({
            src: $table,
            url: basePath + "userCenter/getUserHistory",
            dataTable: {
                "columns": [
                    {data: 'fileName', orderable: false,
                        render: function (data, type, full) {
                            var str = '<a  target="_blank" href="/bits/literature/getLiteratureDetail?id='+full.fileId+'">';
                            str += full.fileName + '</a>';
                            return str;
                        }

                    },
                    {data:'time',orderable: true},
                    {
                        data: 'operate', orderable: false,
                        render: function (data, type, full) {
                            var returnValue = "";
                            returnValue += '<a   href="#" class="animated-hover"   onclick="HistoryPage.delUserHistory(\'' + full.fileId + '\')" data-target="#deleteRowConfirm" data-toggle="modal" id="delete' + full.fileId + '"><img src="../images/shangchu1.png"/></a>';
                            return returnValue

                        }
                    }
                ]
            }
        });

    }

    return {
        init: function () {
            handleRecords();
        },
        reload:function(){
            var $table = parent.$("#datatable_ajax");
            $table.DataTable().draw();
            parent.toast.success();
        },
        quit: function () {
            location.href = "about:blank";
            parent.parent.$("#modalDialog").modal("hide");
        },
        delUserHistory:function(id){
            $("#deleteRow").click(function () {
                $.ajax({
                    url: basePath + "userCenter/delUserHistory?id=" + id,
                    type: "GET",
                    success: function () {
                        var $table = parent.$("#datatable_ajax");
                        $table.DataTable().draw();
                        $('#deleteRowConfirm').modal('hide');
                        toast.success();
                    },
                    error: doError

                })
            })
        }
    }
}();
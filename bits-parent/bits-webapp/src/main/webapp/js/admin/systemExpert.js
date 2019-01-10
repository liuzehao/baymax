var expertListTable = function () {


    var reloadTable = function (pageFlag) {
        $("#datatable_ajax").DataTable().draw(pageFlag)
    };

    var onSortColumn = function (sortColumn, sortDirection) {
        switch (sortColumn) {
            case "expertName":
                sortColumn = "expert_name";
                break;
            case "expertOrg":
                sortColumn = "expert_org";
                break;
        }
        return onSortColumnDefault(sortColumn, sortDirection);
    };

    /**
     * dataTable事件初始化方法
     */
    var handleRecords = function () {
        var grid = new DataTable();
        var $table = $("#datatable_ajax");
        grid.init({
            src: $table,
            url: basePath + "expert/getExpertListDo",
            onSortColumn: onSortColumn,
            onQuery: function (data) {
                data.expertName = $("#queryExpertName").val();
            },
            dataTable: {
                "columns": [
                    {data: 'expertName', orderable: false},
                    {data: 'expertOrg', orderable: false},
                    {
                        data: 'themeList', orderable: false,
                        render: function (data, type, full) {
                            var themeArr = full.themeList;
                            var arr = [];
                            for (var i = 0,j = themeArr.length; i < j; i++){
                                arr.push(themeArr[i]["themeName"])
                            }
                            return arr.toString();
                        }
                    },
                    {
                        data: 'operate', orderable: false,
                        render: function (data, type, full) {
                            var returnValue = '<a class="edit btn default btn-xs purple" onclick="expertListTable.editExpertInfo(\'' + full.id + '\')" id="edit' + full.id + '"><i class="fa fa-edit faa-shake animated-hover"></i>编辑</a>&nbsp;'
                            returnValue += '<a class="delete btn default btn-xs black faa-flash animated-hover " data-target="#deleteRowConfirm" data-toggle="modal"><i class="fa fa-trash-o"></i>删除</a>'
                            return returnValue
                        }
                    }
                ]
            }
        });


        //重新载入按钮事件
        $("#reloadTable").click(function () {
            reloadTable(false);
        });

        //显示列选择按钮事件
        $('#datatable_ajax_column_toggler').find('input[type="checkbox"]').change(function () {
            var iCol = parseInt($(this).attr("data-column"));
            $table.DataTable().column(iCol).visible(!$table.DataTable().column(iCol).visible());
        });
        //行删除按钮事件
        $table.find('a.delete').live('click', function () {
            var $this = $(this);
            //confirm中确认按钮事件，此处需要unbind，否则点击取消时下次再点击删除按钮会重复绑定click。
            $("#deleteRow").unbind("click.deleteRow").bind("click.deleteRow", function () {
                var $row = $table.DataTable().row($this.parents('tr')[0]);
                $.ajax({
                    url: basePath + "expert/deleteExpert?id=" + $row.data().id,
                    dataType: "json",
                    type: "DELETE",
                    success: function () {
                        $table.DataTable().draw();
                        $('#deleteRowConfirm').modal('hide');
                        toast.success();
                    },
                    error: doError
                })
            })
        });

    };

    var handleSelect2 = function (){
        $.ajax({
            url: basePath + "theme/getThemeNames",
            type: "post",
            dataType:"json",
            success:function (data) {
                $("#expertTheme").select2({
                    tags:data,
                    placeholder:"请选择一个主题"
                })
            },
            error:function (){
                toast.error("请检查网络连接");
            }
        });
    };

    return {
        init: function () {
            handleRecords();
        },
        refresh: function () {
            $("#queryExpertName").attr("value", "");
            reloadTable(false);
        },
        search: function () {
            reloadTable(false);
        },
        addExpertInfo: function () {
            $("#dialogTitle").text("专家填加");
            $("#userEditIframe").attr("src", basePath + "expert/addExpertDo");
            $("#modalDialog").modal("show");
        },
        editExpertInfo: function (id) {
            $("#dialogTitle").text("专家编辑");
            $("#userEditIframe").attr("src", basePath + "expert/editExpertDo?id=" + id);
            $("#modalDialog").modal("show");
        }, quit: function () {
            location.href = "about:blank";
            parent.parent.$("#modalDialog").modal("hide");
        },
        addSave: function () {
            handleSelect2();
            $('#addForm').validate({
                onsubmit: true,
                errorElement: 'span', //default input error message container
                errorClass: 'help-block', // default input error message class
                focusInvalid: false, // do not focus the last invalid input
                rules: {
                    expertName: {
                        required: true
                    },
                    expertOrg: {
                        required: true
                    },
                    expertTheme: {
                        required: true
                    }
                },
                messages: {
                    expertName: {
                        required: "专家姓名不能为空！"
                    },
                    expertOrg: {
                        required: "单位名称不能为空！"
                    },
                    expertTheme: {
                        required: "领域不能为空"
                    }
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
                    error.insertAfter(element.closest('.form-control'));
                },

                submitHandler: function (form) {
                    $("#saves").button('loading');
                    $.ajax({
                        url: basePath + "expert/addExpert",
                        data: {
                            expertName: $("#expertName").val(),
                            expertOrg: $("#expertOrg").val(),
                            themeName:$("#expertTheme").val().split(",")
                        },
                        dataType: "json",
                        type: "POST",
                        success: function () {
                            location.href = "about:blank";
                            parent.parent.$("#modalDialog").modal("hide");
                            var $table = parent.$("#datatable_ajax");
                            $table.DataTable().draw();
                            parent.toast.success();
                        },
                        error: doError
                    })
                }
            });
        },
        editSave: function () {
            handleSelect2();
            $('#editForm').validate({
                onsubmit: true,
                errorElement: 'span', //default input error message container
                errorClass: 'help-block', // default input error message class
                focusInvalid: false, // do not focus the last invalid input
                rules: {
                    expertName: {
                        required: true
                    },
                    expertOrg: {
                        required: true
                    },
                    expertTheme: {
                        required: true
                    }
                },
                messages: {
                    expertName: {
                        required: "专家姓名不能为空！"
                    },
                    expertOrg: {
                        required: "单位名称不能为空！"
                    },
                    expertTheme: {
                        required: "领域不能为空"
                    }
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
                    error.insertAfter(element.closest('.form-control'));
                },

                submitHandler: function (form) {
                    $("#saves").button('loading');
                    $.ajax({
                        url: basePath + "expert/editExpert",
                        data: {
                            id:$("#id").val(),
                            expertName: $("#expertName").val(),
                            expertOrg: $("#expertOrg").val(),
                            themeNames:$("#expertTheme").val().split(",")
                        },
                        dataType: "json",
                        type: "POST",
                        success: function () {
                            location.href = "about:blank";
                            parent.parent.$("#modalDialog").modal("hide");
                            var $table = parent.$("#datatable_ajax");
                            $table.DataTable().draw();
                            parent.toast.success();
                        },
                        error: doError
                    })
                }
            });
        }
    }

}();
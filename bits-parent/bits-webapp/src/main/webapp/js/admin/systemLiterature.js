var literatureListTable = function () {


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
            url: basePath + "literature/getLiteratureListDo",
            onSortColumn: onSortColumn,
            onQuery: function (data) {
                data.expertName = $("#queryExpertName").val();
            },
            dataTable: {
                "columns": [
                    {data: 'fileName', orderable: true},
                    {data: 'fileType', orderable: false},
                    {data: 'fileTime', orderable: false},
                    {
                        data: 'operate', orderable: false,
                        render: function (data, type, full) {
                            var returnValue = '<a class="edit btn default btn-xs purple" onclick="literatureListTable.editLiteratureInfo(\'' + full.id + '\')" id="edit' + full.id + '"><i class="fa fa-edit faa-shake animated-hover"></i>编辑</a>&nbsp;';
                            returnValue += '<a class="delete btn default btn-xs black faa-flash animated-hover " data-target="#deleteRowConfirm" data-toggle="modal"><i class="fa fa-trash-o"></i>删除</a>';
                            return returnValue;
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
                    url: basePath + "literature/delLiteratureDo?id=" + $row.data().id,
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

    return {
        init: function () {
            handleRecords();
        },
        reset: function () {
            $("#loginName").attr("value", "");
            reloadTable(false);
        },
        search: function () {
            reloadTable(false);
        },
        addLiteratureInfo: function () {
            $("#dialogTitle").text("文献添加");
            $("#literatureEditIframe").attr("src", basePath + "literature/addLiteratureDo");
            $("#modalDialog").modal("show");
        },
        editLiteratureInfo: function (id) {
            $("#dialogTitle").text("文献编辑");
            $("#literatureEditIframe").attr("src", basePath + "literature/editLiteratureDo?id=" + id);
            $("#modalDialog").modal("show");
        },
        quit: function () {
            location.href = "about:blank";
            parent.parent.$("#modalDialog").modal("hide");
        },
        editSave: function () {
            $('#editForm').validate({
                onsubmit: true,
                errorElement: 'span', //default input error message container
                errorClass: 'help-block', // default input error message class
                focusInvalid: false, // do not focus the last invalid input
                rules: {
                    authorCn: {
                        required: true
                    },
                    title: {
                        required: true
                    },
                    unit: {
                        required: true
                    },
                    appDate: {
                        required: true
                    },
                    journalCn: {
                        required: true
                    },
                    abs: {
                        required: true
                    }
                },
                messages: {
                    authorCn: {
                        required: "作者不能为空！"
                    },
                    title: {
                        required: "标题不能为空！"
                    },
                    unit: {
                        required: "单位不能为空"
                    },
                    appDate: {
                        required: "时间不能为空"
                    },
                    journalCn: {
                        required: "来源不能为空"
                    },
                    abs: {
                        required: "简介不能为空"
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
                        url: basePath + "literature/editLiterature",
                        data: {
                            id: $("#id").val(),
                            authorCn: $("#authorCn").val(),
                            title: $("#title").val(),
                            unit: $("#unit").val(),
                            appDate: $("#appDate").val(),
                            journalCn: $("#journalCn").val(),
                            abs: $("#abs").text()
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
        addSave: function () {
            $('#addForm').validate({
                onsubmit: true,
                errorElement: 'span', //default input error message container
                errorClass: 'help-block', // default input error message class
                focusInvalid: false, // do not focus the last invalid input
                rules: {
                    authorCn: {
                        required: true
                    },
                    title: {
                        required: true
                    },
                    unit: {
                        required: true
                    },
                    appDate: {
                        required: true
                    },
                    journalCn: {
                        required: true
                    },
                    abs: {
                        required: true
                    }
                },
                messages: {
                    authorCn: {
                        required: "作者不能为空！"
                    },
                    title: {
                        required: "标题不能为空！"
                    },
                    unit: {
                        required: "单位不能为空"
                    },
                    appDate: {
                        required: "时间不能为空"
                    },
                    journalCn: {
                        required: "来源不能为空"
                    },
                    abs: {
                        required: "简介不能为空"
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
                        url: basePath + "literature/addLiterature",
                        data: {
                            authorCn: $("#authorCn").val(),
                            title: $("#title").val(),
                            unit: $("#unit").val(),
                            appDate: $("#appDate").val(),
                            journalCn: $("#journalCn").val(),
                            abs: $("#abs").text()
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
        reloadTable: reloadTable
    }

}();
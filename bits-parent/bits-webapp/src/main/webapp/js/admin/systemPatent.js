var patentListTable = function(){


    var reloadTable = function (pageFlag) {
        $("#datatable_ajax").DataTable().draw(pageFlag)
    };

    var onSortColumn = function (sortColumn, sortDirection) {
        switch (sortColumn) {
            case "inventor":
                sortColumn = "inventor";
                break;
            case "date":
                sortColumn = "date";
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
            url: basePath + "patent/getPatentListDo",
            onSortColumn: onSortColumn,
            onQuery: function (data) {
                data.inventor = $("#queryExpertName").val();
            },
            dataTable: {
                "columns": [
                    {data: 'inventor', orderable: true},
                    {data: 'title', orderable: false},
                    {data: 'date', orderable: true},
                    {data: 'applicant', orderable: false},
                    {data: 'operate', orderable: false,
                        render: function (data, type, full) {
                            var returnValue = '<a class="edit btn default btn-xs purple" onclick="patentListTable.editPatentInfo(\'' + full.id + '\')" id="edit' + full.id + '"><i class="fa fa-edit faa-shake animated-hover"></i>编辑</a>&nbsp;'
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
                    url: basePath + "patent/deletePatentInfo?id=" + $row.data().id,
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
        refresh: function () {
            $("#queryExpertName").attr("value", "");
            reloadTable(false);
        },
        search: function () {
            reloadTable(false);
        },
        addPatentInfo: function () {
            $("#dialogTitle").text("专利填加");
            $("#userEditIframe").attr("src", basePath + "patent/addPatentInfo");
            $("#modalDialog").modal("show");
        },
        editPatentInfo: function (id) {
            $("#dialogTitle").text("专利编辑");
            $("#userEditIframe").attr("src", basePath + "patent/editPatentDo?id=" + id);
            $("#modalDialog").modal("show");
        }, quit: function () {
            location.href = "about:blank";
            parent.parent.$("#modalDialog").modal("hide");
        },
        addSave: function () {
            $('#addForm').validate({
                onsubmit: true,
                errorElement: 'span', //default input error message container
                errorClass: 'help-block', // default input error message class
                focusInvalid: false, // do not focus the last invalid input
                rules: {
                    inventor: {
                        required: true
                    },
                    title: {
                        required: true
                    },
                    date: {
                        required: true
                    },
                    applicant: {
                        required: true
                    },
                    abs: {
                        required: true
                    }
                },
                messages: {
                    inventor: {
                        required: "专利作者不能为空！"
                    },
                    title: {
                        required: "专利名称不能为空！"
                    },
                    date: {
                        required: "日期不能为空"
                    },
                    applicant: {
                        required: "申请机构不能为空"
                    },
                    abs: {
                        required: "专利简介不能为空"
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
                        url: basePath + "patent/addPatentInfoDo",
                        data: {
                            inventor: $("#inventor").val(),
                            title: $("#title").val(),
                            date: $("#date").val(),
                            applicant: $("#applicant").val(),
                            abs: $("#abs").val()
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
        editSave:function(){
            $('#editForm').validate({
                onsubmit: true,
                errorElement: 'span', //default input error message container
                errorClass: 'help-block', // default input error message class
                focusInvalid: false, // do not focus the last invalid input
                rules: {
                    inventor: {
                        required: true
                    },
                    title: {
                        required: true
                    },
                    date: {
                        required: true
                    },
                    applicant : {
                        required : true
                    },
                    abs: {
                        required: true
                    }
                },
                messages: {
                    inventor: {
                        required: "姓名不能为空！"
                    },
                    title: {
                        required: "专利名称不能为空！"
                    },
                    date: {
                        required: "日期不能为空"
                    },
                    applicant: {
                        required: "部门不能为空"
                    },
                    abs : {
                        required: "内容不能为空"
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
                        url: basePath + "patent/editPatent",
                        data: {
                            id: $("#id").val(),
                            inventor: $("#inventor").val(),
                            title: $("#title").val(),
                            date: $("#date").val(),
                            applicant: $("#applicant").val(),
                            abs: $("#abs").val()
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
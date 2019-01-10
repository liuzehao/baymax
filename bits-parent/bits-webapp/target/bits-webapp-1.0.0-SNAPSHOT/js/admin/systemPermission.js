/**
 * Created by panzhuowen on 2014/10/19.
 */
var permissionListTable = function () {
    var reloadTable = function (pageFlag) {
        $("#datatable_ajax").DataTable().draw(pageFlag)
    };
    var onSortColumn = function (sortColumn, sortDirection) {
        switch (sortColumn) {
            case "permToken":
                sortColumn = "perm_token";
                break;
            case "description":
                sortColumn = "description";
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
            url: basePath + "admin/permission/getPermissionListPage",
            onSortColumn: onSortColumn,
            onQuery: function (data) {
                data.permToken = $("#permToken").val();
                data.description = $("#description").val();
            },
            dataTable: {
                "columns": [
                    {data: 'permToken', orderable: true},
                    {data: 'description', orderable: true},
                    {
                        data: 'operate', orderable: false,
                        render: function (data, type, full) {
                            var returnValue = '<a class="edit btn default btn-xs purple" onclick="permissionListTable.editPermissionInfo(\'' + full.id + '\')" id="edit' + full.id + '"><i class="fa fa-edit faa-shake animated-hover"></i>编辑</a>&nbsp;'
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
                    url: basePath + "admin/permission/delPermission?id=" + $row.data().id,
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

    var validateFrom = function () {
        $('.form-horizontal').validate({
            errorElement: 'span', //default input error message container
            errorClass: 'help-block', // default input error message class
            focusInvalid: false, // do not focus the last invalid input
            rules: {
                permToken: {
                    required: true
                },
                description: {
                    required: true
                }
            },
            messages: {
                permToken: {
                    required: "权限字符串不能为空！"
                },
                description: {
                    required: "描述不能为空！"
                }
            },
            invalidHandler: function (event, validator) { //display error alert on form submit
                $('.alert-danger', $('.login-form')).show();
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
                error.insertAfter(element.closest('.input-icon'));
            },

            submitHandler: function (form) {
                form.submit();
            }
        });
    };


    return {
        init: function () {
            handleRecords();

        },

        validate: function () {
            validateFrom();
        },

        addPermissionInfo: function () {
            $("#dialogTitle").text("权限添加");
            $("#userEditIframe").attr("src", basePath + "admin/permission/addPermissionDo");
            $("#modalDialog").modal("show");
        },
        editPermissionInfo: function (id) {
            $("#dialogTitle").text("权限编辑");
            $("#userEditIframe").attr("src", basePath + "admin/permission/editPermissionDo?id=" + id);
            $("#modalDialog").modal("show");
        },
        quit: function () {
            location.href = "about:blank";
            parent.parent.$("#modalDialog").modal("hide");
        },
        editSave: function () {
            $('#editFrom').validate({
                onsubmit: true,
                errorElement: 'span', //default input error message container
                errorClass: 'help-block', // default input error message class
                focusInvalid: false, // do not focus the last invalid input
                rules: {
                    permToken: {
                        required: true,
                        remote: {
                            url: basePath + "admin/permission/checkPermToken",
                            type: "POST",
                            dataType: "json",
                            data: {
                                permToken: function () {
                                    return $("#permToken").val();
                                },
                                id: function () {
                                    return $("#checkId").val();
                                }
                            }
                        }
                    },
                    description: {
                        required: true
                    }
                },
                messages: {
                    permToken: {
                        required: "权限字符串不能为空！",
                        remote: "权限字符串已经存在"
                    },
                    description: {
                        required: "描述不能为空！"
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
                        url: basePath + "admin/permission/editPermission",
                        data: {
                            id: $("#checkId").val(),
                            permToken: $("#permToken").val(),
                            description: $("#description").val()
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
            $('#addFrom').validate({
                onsubmit: true,
                errorElement: 'span', //default input error message container
                errorClass: 'help-block', // default input error message class
                focusInvalid: false, // do not focus the last invalid input
                rules: {
                    permToken: {
                        required: true,
                        remote: {
                            url: basePath + "admin/permission/checkPermToken",
                            type: "POST",
                            dataType: "json",
                            data: {
                                permToken: function () {
                                    return $("#permToken").val();
                                },
                                id: function () {
                                    return 0;
                                }
                            }
                        }
                    },
                    description: {
                        required: true
                    }
                },
                messages: {
                    permToken: {
                        required: "权限字符串不能为空！",
                        remote: "权限字符串已经存在"
                    },
                    description: {
                        required: "描述不能为空！"
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
                        url: basePath + "admin/permission/addPermission",
                        data: {
                            permToken: $("#permToken").val(),
                            description: $("#description").val()
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
    };

}();
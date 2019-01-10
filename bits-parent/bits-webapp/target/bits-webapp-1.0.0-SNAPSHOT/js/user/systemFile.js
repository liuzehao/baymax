var literatureListTable = function () {

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
            url: basePath + "literature/getUserLiteratureListDo",
            onSortColumn: onSortColumn,
            onQuery: function (data) {
               // data.expertName = $("#queryExpertName").val();
            },

            dataTable: {
                "columns": [
                    {data: 'fileId', orderable: true,
                        render: function (data, type, full) {
                            return '<input type="checkbox" name="checkList" flag="'+full.flag+'" id="' + full.fileId + '">';
                        }
                    },
                    {data: 'fileId', orderable: true,
                        render:function(data,type,full) {
                            if (parent.parent.$("#rule").val() == "&&"&&full.flag==1) {
                            if (full.fileType == parent.parent.$("#type").val() && full.fileName.match(parent.parent.$("#key").val())) {
                                var relationId=$("#AutoRelationId").val();
                                $.ajax({
                                    url: basePath+'file/relation?id='+full.fileId+'&relationId='+relationId,
                                    type:"GET",
                                    success: function () {
                                        $('#relationConfirm').modal('hide');
                                        toast.success();
                                    },
                                })
                            }

                        }
                            if (parent.parent.$("#rule").val() == "||"&&full.flag==1) {
                                if (full.fileType == parent.parent.$("#type").val() || full.fileName.match(parent.parent.$("#key").val())) {
                                    var relationId=$("#AutoRelationId").val();
                                    $.ajax({
                                        url: basePath+'file/relation?id='+full.fileId+'&relationId='+relationId,
                                        type:"GET",
                                        success: function () {
                                            $('#relationConfirm').modal('hide');
                                            toast.success();
                                        },
                                    })
                                }

                            }
                            return full.fileId;
                        }
                    },
                    {data: 'fileName', orderable: false,
                        render: function (data, type, full) {
                            if(full.flag==1) {
                                var str = '<a  target="_blank" href="/bits/literature/getLiteratureDetail?id='+full.fileId+'">';
                                str += full.fileName + '</a>';
                                return str;
                            }else{
                               var str = full.fileName;
                                return str;
                            }
                        }

                    },
                    {data: 'fileType', orderable: false},
                    {data: 'fileTime', orderable: false},
                    {
                        data: 'operate', orderable: false,
                        render: function (data, type, full) {
                            if(full.flag==0) {//0代表未关联
                                var returnValue = '<a href="#" onclick="literatureListTable.editLiteratureInfo(\'' + full.fileId + '\')" id="edit' + full.fileId + '"><img src="../images/fabu.png"/></a><br><div style="padding-top: 6%;width: 100%; "></div>';
                                returnValue += '<a   hidden="hidden"  id="hidden' + full.fileId + '"></i> 隐藏元素</a>';
                                returnValue += '<a  href="#" onclick="literatureListTable.deleteFile(\'' + full.fileId + '\')" data-target="#deleteRowConfirm" data-toggle="modal" id="delete' + full.fileId + '"><img src="../images/shanchu_006.png"/></a>';
                            }else{
                                var returnValue ='<div class="btn-group btn-group-solid">';
                                returnValue += '<a  href="#" onclick="literatureListTable.editLiteratureInfoT(\'' + full.fileId + '\')" id="editT'+full.fileId+'"><img src="../images/bianji.png"/></a><br><div style="padding-top: 15%;width: 100%; "></div> ';
                                returnValue += '<a   href="#" data-target="#relationConfirm" data-toggle="modal" onclick="literatureListTable.relation(\'' + full.fileId + '\')" id="relation'+full.fileId+'"><img src="../images/guanlian.png"/></a><br><div style="padding-top: 15%;width: 100%; "></div>';
                                returnValue += '<a  href="#" onclick="literatureListTable.deleteFile(\'' + full.fileId + '\')" data-target="#deleteRowConfirm" data-toggle="modal" id="delete' + full.fileId + '"><img src="../images/shanchu_006.png"/></a>';
                                returnValue +='</div>';

                            }
                            return returnValue;

                        }
                    }
                ]
            }
        });


        //显示列选择按钮事件
        $('#datatable_ajax_column_toggler').find('input[type="checkbox"]').change(function () {
            var iCol = parseInt($(this).attr("data-column"));
            $table.DataTable().column(iCol).visible(!$table.DataTable().column(iCol).visible());
        });


    };

    return {
        init: function () {
            handleRecords();
        },
        //行删除按钮事件
        deleteFile:function(id){
            $("#deleteRow").click(function () {
                $.ajax({
                    url: basePath + "file/delFileDo?id=" + id,
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
        },
        reload:function(){
            var $table = parent.$("#datatable_ajax");
            $table.DataTable().draw();
            parent.toast.success();
        },
        upload:function (){
            $("#dialogTitle").text("上传文件");
            $("#literatureEditIframe").attr("src", basePath + "userCenter/uploadFile");
            $("#modalDialog").modal("show");
        },

        reset: function () {
            $("#loginName").attr("value", "");
            reloadTable(false);
        },
        search: function () {
            reloadTable(false);
        },
        editLiteratureInfo: function (id) {
            $("#dialogTitle").text("文件编辑");
            $("#literatureEditIframe").attr("src", basePath + "file/editFileDo?id=" + id);
            $("#modalDialog").modal("show");
        },
        editLiteratureInfoT: function (id) {
            $("#dialogTitle").text("文件编辑");
            $("#literatureEditIframe").attr("src", basePath + "file/editFileDoT?id=" + id);
            $("#modalDialog").modal("show");
        },//发布后的编辑
        //关联文件
        relation:function(id){
            $("#relation").click(function(){
                var relationId=$("#relationId").val();
                $.ajax({
                    url: basePath+'file/relation?id='+id+'&relationId='+relationId,
                    type:"GET",
                    success: function () {
                        $('#relationConfirm').modal('hide');
                        toast.success();
                    },
                })
            });

        },

        quit: function () {
            location.href = "about:blank";
            parent.parent.$("#modalDialog").modal("hide");
        },
        editSave: function () {
            handleSelect2();
            $('#editForm').validate({
                onsubmit: true,
                errorElement: 'span', //default input error message container
                errorClass: 'help-block', // default input error message class
                focusInvalid: false, // do not focus the last invalid input
                rules: {
                    title: {
                        required: true
                    },
                    rank: {
                        required: true
                    },
                    keywords: {
                        required: true
                    }
                },
                messages: {
                    title: {
                        required: "标题不能为空"
                    },
                    rank: {
                        required: "主题是必须选择的"
                    },
                    keywords: {
                        required: "关键字能帮助别人找到文件哦"
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
                        url: basePath + "file/editFile",
                        data: {
                            id: $("#id").val(),
                            title: $("#title").val(),
                            abs: $("#abs").val(),
                            keywords:$("#keywords").val(),
                            themeName: $("#expertTheme").val().split(","),
                            type: $("#type").val()
                        },
                        dataType: "json",
                        type: "POST",
                        success: function () {
                            location.href = "about:blank";
                            parent.parent.$("#modalDialog").modal("hide");
                            var $table = parent.$("#datatable_ajax");
                            $table.DataTable().draw();
                            parent.toast.success();
                           //parent.alert($("#title").val());
                            //parent.alert($("#type").val());parent.parent.$("#judgement").val()
                           //if(parent.parent.$("#judgement").val()){
                              // parent.alert($("#id").val());
                               /*$.ajax({
                                   url: basePath + 'file/relation?id=' + parent.parent.$("#judgeRelation").val() + '&relationId=' + id2,
                                   type: "GET",
                                   success: function () {
                                       $('#relationLotConfirm').modal('hide');
                                       toast.success();
                                   },
                               })*/
                          // }
                        },
                        error: doError
                    })
                },

            });

        },

       /* addSave: function () {
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
        },*/
        reloadTable: reloadTable
    }

}();
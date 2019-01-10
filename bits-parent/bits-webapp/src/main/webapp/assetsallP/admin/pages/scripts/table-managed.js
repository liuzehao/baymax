var TableManaged = function () {

    return {

        //main function to initiate the module
        init: function () {
            
            if (!jQuery().dataTable) {
                return;
            }

            // begin first table
            $('#sample_1')
            .dataTable({
                "aLengthMenu": [
                    [5, 15, 20, -1],
                    [5, 15, 20, "All"] // change per page values here
                ],
                // set the initial value
                "iDisplayLength": 20,
                "sPaginationType": "bootstrap",
                "sDom" : "<'table-scrollable't>", // datatable layout
                "oLanguage": {  // language settings
                        "sProcessing": '<img src="' + Metronic.getGlobalImgPath() + 'loading-spinner-grey.gif"/><span>&nbsp;&nbsp;Loading...</span>',
                        "sLengthMenu": "<span class='seperator'>|</span>View _MENU_ records",
                        "sInfo": "<span class='seperator'>|</span>Found total _TOTAL_ 页",
                        "sInfoEmpty": "No records found to show",
                        "sGroupActions": "_TOTAL_ records selected:  ",
                        "sAjaxRequestGeneralError": "Could not complete request. Please check your internet connection",
                        "sEmptyTable":  "No data available in table",
                        "sZeroRecords": "No matching records found",
                        "oPaginate": {
                            "sPrevious": "前一页",
                            "sNext": "",
                            "sPage": "Page",
                            "sPageOf": "of"
                        }
                    },
                "aoColumnDefs": [
                    { 'bSortable': false, 'aTargets': [0] },
                    { "bSearchable": false, "aTargets": [ 0 ] }
                ]
            });

//            jQuery('#sample_1 .group-checkable').change(function () {
//                var set = jQuery(this).attr("data-set");
//                var checked = jQuery(this).is(":checked");
//                jQuery(set).each(function () {
//                    if (checked) {
//                        $(this).attr("checked", true);
//                        $(this).parents('tr').addClass("active");
//                    } else {
//                        $(this).attr("checked", false);
//                        $(this).parents('tr').removeClass("active");
//                    }
//                });
//                jQuery.uniform.update(set);
//            });

//            jQuery('#sample_1').on('change', 'tbody tr .checkboxes', function(){
//                 $(this).parents('tr').toggleClass("active");
//            });

            jQuery('#sample_1_wrapper .dataTables_filter input').addClass("form-control input-medium input-inline"); // modify table search input
            jQuery('#sample_1_wrapper .dataTables_length select').addClass("form-control input-xsmall input-inline"); // modify table per page dropdown
            jQuery('#sample_1_wrapper .dataTables_length select').select2(); // initialize select2 dropdown

        }

    };

}();
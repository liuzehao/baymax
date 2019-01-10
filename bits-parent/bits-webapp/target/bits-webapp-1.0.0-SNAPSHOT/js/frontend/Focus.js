/**
 * Created by Shy on 2015/8/11.
 */
function addUserFocusThemes(arr) {
    $.ajax({
        url: basePath + "userCenter/addUserFocusThemes",
        data: {
            themeIds: [$("#themeId").val()]
        },
        dataType: "json",
        type: "post"
    })
}
function delUserFocusThemes(arr) {
    $.ajax({
        url: basePath + "userCenter/delUserFocusThemes",
        data: {
            themeIds: [$("#themeId").val()]
        },
        dataType: "json",
        type: "post"
    })
}
function addUserFocusExperts(arr) {
    $.ajax({
        url: basePath + "userCenter/addUserFocusExperts",
        data: {
            expertIds: [$("#expertId").val()]
        },
        dataType: "json",
        type: "post"
    })
}
function delUserFocusExperts(arr) {
    $.ajax({
        url: basePath + "userCenter/delUserFocusExperts",
        data: {
            expertIds: [$("#expertId").val()]
        },
        dataType: "json",
        type: "post"
    })
}
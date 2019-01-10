/**
 * Created by Shy on 2015/8/5.
 */
(function ($) {
    $.fn.getLastScreenSectionPos = function (total) {
        var heightPercent = $("section.footer").height() / $(this).height() * 100;
        return ((total - 2) * 100 + heightPercent) * -1;
    }
})(window.jQuery);
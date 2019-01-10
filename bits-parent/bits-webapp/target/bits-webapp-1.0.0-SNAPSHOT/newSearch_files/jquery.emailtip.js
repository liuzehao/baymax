var myemails = [
	"@126.com",
	"@163.com",
	"@yeah.net",
	"@qq.com",
	"@gmail.com",
	"@sina.com.cn",
	"@yahoo.com.cn",
	"@sohu.com",
	"@sogou.com",
	"@hotmail.com"
];

; (function ($) {

    $.fn.extend({
        emailtip: function (urlOrData, options) {
            var isUrl = typeof urlOrData == "string";
            options = $.extend({}, $.EmailTiper.defaults, {
                url: isUrl ? urlOrData : null,
                data: isUrl ? null : urlOrData || myemails
            }, options);
            options.highlight = options.highlight || function (value) { return value; };

            options.formatMatch = options.formatMatch || options.formatItem;

            return this.each(function () {
                new $.EmailTiper(this, options);
            });
        },
        result: function (handler) {
            return this.bind("result", handler);
        },
        search: function (handler) {
            return this.trigger("search", [handler]);
        },
        flushCache: function () {
            return this.trigger("flushCache");
        },
        setOptions: function (options) {
            return this.trigger("setOptions", [options]);
        },
        unautocomplete: function () {
            return this.trigger("unautocomplete");
        }
    });

    $.EmailTiper = function (input, options) {

        var KEY = {
            UP: 38,
            DOWN: 40,
            DEL: 46,
            TAB: 9,
            RETURN: 13,
            ESC: 27,
            COMMA: 188,
            PAGEUP: 33,
            PAGEDOWN: 34,
            BACKSPACE: 8
        };

        var $input = $(input).attr("autocomplete", "off").addClass(options.inputClass);

        var timeout;
        var previousValue = "";
        var cache = $.EmailTiper.Cache(options);
        var hasFocus = 0;
        var lastKeyPressCode;
        var config = {
            mouseDownOnSelect: false
        };

        var select = $.EmailTiper.Select(options, input, selectCurrent, config);
        var blockSubmit;

        // prevent form submit in opera when selecting with return key
        //$.browser.opera && $(input.form).bind("submit.autocomplete", function () {
        //    if (blockSubmit) {
        //        blockSubmit = false;
        //        return false;
        //    }
        //});

        $input.bind("keydown" + ".autocomplete", function (event) {
            hasFocus = 1;
            lastKeyPressCode = event.keyCode;
            switch (event.keyCode) {
                case KEY.UP:
                    event.preventDefault();
                    if (select.visible()) {
                        select.prev();
                    } else {
                        onChange(0, true);
                    }
                    break;

                case KEY.DOWN:
                    event.preventDefault();
                    if (select.visible()) {
                        select.next();
                    } else {
                        onChange(0, true);
                    }
                    break;

                case KEY.PAGEUP:
                    event.preventDefault();
                    if (select.visible()) {
                        select.pageUp();
                    } else {
                        onChange(0, true);
                    }
                    break;

                case KEY.PAGEDOWN:
                    event.preventDefault();
                    if (select.visible()) {
                        select.pageDown();
                    } else {
                        onChange(0, true);
                    }
                    break;
                case KEY.RETURN:
                    if (selectCurrent()) {
                        // stop default to prevent a form submit, Opera needs special handling
                        event.preventDefault();
                        blockSubmit = true;
                        return false;
                    }
                    break;

                default:
                    clearTimeout(timeout);
                    timeout = setTimeout(onChange, options.delay);
                    break;
            }
        })
	.focus(function () {
	    // track whether the field has focus, we shouldn't process any results if the field no longer has focus
	    hasFocus++;
	})
	.blur(function () {
	    hasFocus = 0;
	    if (!config.mouseDownOnSelect) {
	        hideResults();
	    }
	})
	.click(function () {
	    // show select when clicking in a focused field
	    if (hasFocus++ > 1 && !select.visible()) {
	        onChange(0, true);
	    }
	})
	.bind("search", function () {
	    // TODO why not just specifying both arguments?
	    var fn = (arguments.length > 1) ? arguments[1] : null;
	    function findValueCallback(q, data) {
	        var result;
	        if (data && data.length) {
	            for (var i = 0; i < data.length; i++) {
	                if (data[i].result.toLowerCase() == q.toLowerCase()) {
	                    result = data[i];
	                    break;
	                }
	            }
	        }
	        if (typeof fn == "function") fn(result, q);
	        else $input.trigger("result", result && [result.data, result.value, q]);
	    }
	    $.each(trimWords($input.val()), function (i, value) {
	        request(value, findValueCallback, findValueCallback);
	    });
	})
	.bind("flushCache", function () {
	    cache.flush();
	})
	.bind("setOptions", function () {
	    $.extend(options, arguments[1]);

	    if ("data" in arguments[1])
	        cache.populate();
	})
	.bind("unautocomplete", function () {
	    select.unbind();
	    $input.unbind();
	    $(input.form).unbind(".autocomplete");
	});

        function selectCurrent() {
            var selected = select.selected();
            var currValue = $input.val();
            if (!selected)
                return false;

            var v = options.formatResult && options.formatResult(rawValue, currValue) || selected.qValue + selected.result;
            previousValue = v;

            $input.val(v);
            hideResultsNow();
            $input.trigger("result", [selected.data, selected.value, currValue]);
            $input.change();
            return true;
        }

        function onChange(crap, skipPrevCheck) {
            if (lastKeyPressCode == KEY.DEL) {
                select.hide();
                return;
            }

            var currentValue = $input.val();

            if (!skipPrevCheck && currentValue == previousValue)
                return;

            previousValue = currentValue;

            currentValue = trimWords(currentValue);
            if (currentValue.length >= options.minChars) {
                if (!options.matchCase)
                    currentValue = currentValue.toLowerCase();
                request(currentValue, receiveData, hideResultsNow);
            } else {
                select.hide();
            }
        };

        function trimWords(value) {
            if (!value)
                return "";
            return $.trim(value);
        };

        function hideResults() {
            clearTimeout(timeout);
            timeout = setTimeout(hideResultsNow, 200);
        };

        function hideResultsNow() {
            var wasVisible = select.visible();
            select.hide();
            clearTimeout(timeout);
        };

        function receiveData(q, data) {
            if (data && data.length && hasFocus) {
                //stopLoading();
                select.display(data, q);
                //autoFill(q, data[0].value);
                select.show();
            } else {
                hideResultsNow();
            }
        };

        function request(term, success, failure) {
            if (!options.matchCase)
                term = term.toLowerCase();
            var data = cache.load(term);
            // recieve the cached data
            if (data && data.length) {
                success(term, data);

            } else {
                // if we have a failure, we need to empty the list -- this prevents the the [TAB] key from selecting the last successful match
                select.emptyList();
                failure(term);
            }
        };

    };

    $.EmailTiper.defaults = {
        tipDivClass: 'em_divtip',
        inputClass: 'em_input',
        width: 0,
        delay: 1,
        maxItemsToShow: -1,
        acitveCss: 'em_over',
        cacheLength: 10,
        minChars: 1,
        selectFirst: true,
        max: 100,
        matchCase: false,
        matchSubset: true,
        scroll: true,
        scrollHeight: 180,
        highlight: function (value, term) {
            return value.replace(new RegExp("(?![^&;]+;)(?!<[^<>]*)(" + term.replace(/([\^\$\(\)\[\]\{\}\*\.\+\?\|\\])/gi, "\\$1") + ")(?![^<>]*>)(?![^&;]+;)", "gi"), "<strong>$1</strong>");
        },
        formatItem: null,
        formatResult: null,
        formatMatch: null
    };

    $.EmailTiper.Cache = function (options) {

        var data = {};
        var length = 0;

        function matchSubset(s, sub) {
            if (!options.matchCase)
                s = s.toLowerCase();
            var i = s.indexOf(sub);
            if (options.matchContains == "word") {
                i = s.toLowerCase().search("\\b" + sub.toLowerCase());
            }
            if (i == -1) return false;
            return i == 0 || options.matchContains;
        };

        function add(q, value) {
            if (length > options.cacheLength) {
                flush();
            }
            if (!data[q]) {
                length++;
            }
            data[q] = value;
        }

        function populate() {
            if (!options.data) return false;
            // track the matches
            var stMatchSets = {},
			nullData = 0;

            // no url was specified, we need to adjust the cache length to make sure it fits the local data store
            if (!options.url) options.cacheLength = 1;

            // track all options for minChars = 0
            stMatchSets[""] = [];

            // loop through the array and create a lookup structure
            for (var i = 0, ol = options.data.length; i < ol; i++) {
                var rawValue = options.data[i];
                // if rawValue is a string, make an array otherwise just reference the array
                rawValue = (typeof rawValue == "string") ? [rawValue] : rawValue;

                var value = options.formatMatch ? options.formatMatch(rawValue, i + 1, options.data.length) : rawValue[0];
                if (value === false)
                    continue;
                var firstChar = value.charAt(0).toLowerCase();
                // if no lookup array for this character exists, look it up now
                if (!stMatchSets[firstChar])
                    stMatchSets[firstChar] = [];

                // if the match is a string
                var row = {
                    value: value,
                    data: rawValue,
                    result: value,
                    qValue: ''
                };

                // push the current match into the set list
                stMatchSets[firstChar].push(row);

                // keep track of minChars zero items
                if (nullData++ < options.max) {
                    stMatchSets[""].push(row);
                }
            };

            // add the data items to the cache
            $.each(stMatchSets, function (i, value) {
                // increase the cache size
                options.cacheLength++;
                // add to the cache
                add(i, value);
            });
        }

        // populate any existing data
        setTimeout(populate, 25);

        function flush() {
            data = {};
            length = 0;
        }

        return {
            flush: flush,
            add: add,
            populate: populate,
            load: function (q) {
                if (!options.cacheLength || !length)
                    return null;
                var hasAt = q.search('@');
                var csub = [];

                if (hasAt == -1) {
                    for (var k in data) {
                        // don't search through the stMatchSets[""] (minChars: 0) cache
                        // this prevents duplicates
                        if (k.length > 0) {
                            var c = data[k];
                            $.each(c, function (i, x) {
                                x.qValue = q;
                                csub.push(x);
                            });
                        }
                    }
                    return csub;
                }

                var sub = q.substr(hasAt);

                var qvalue = q.replace(sub, "");
                if (options.matchContains) {
                    for (var k in data) {
                        if (k.length > 0) {
                            var c = data[k];
                            $.each(c, function (i, x) {
                                if (matchSubset(x.value, sub)) {
                                    x.qValue = qvalue;
                                    csub.push(x);
                                }
                            });
                        }
                    }
                    return csub;
                } else if (options.matchSubset) {
                    for (var i = sub.length; i >= options.minChars; i--) {
                        var c = data[sub.substr(0, i)];
                        if (c) {
                            $.each(c, function (i, x) {
                                if (matchSubset(x.value, sub)) {
                                    x.qValue = qvalue;
                                    csub[csub.length] = x;
                                }
                            });
                            return csub;
                        }
                    }
                }
                return null;
            }
        };
    };

    $.EmailTiper.Select = function (options, input, select, config) {
        var CLASSES = {
            ACTIVE: options.acitveCss || ''
        };

        var listItems,
		active = -1,
		data,
		term = "",
		needsInit = true,
		element,
		list;

        // Create results
        function init() {
            if (!needsInit)
                return;
            element = $("<div/>")
		.hide()
		.addClass(options.tipDivClass)
		.css("position", "absolute")
		.appendTo(document.body);

            list = $("<ul/>").appendTo(element).mouseover(function (event) {
                if (target(event).nodeName && target(event).nodeName.toUpperCase() == 'LI') {
                    active = $("li", list).removeClass(CLASSES.ACTIVE).index(target(event));
                    $(target(event)).addClass(CLASSES.ACTIVE);
                }
            }).click(function (event) {
                $(target(event)).addClass(CLASSES.ACTIVE);
                select();
                // TODO provide option to avoid setting focus again after selection? useful for cleanup-on-focus
                input.focus();
                return false;
            }).mousedown(function () {
                config.mouseDownOnSelect = true;
            }).mouseup(function () {
                config.mouseDownOnSelect = false;
            });

            if (options.width > 0)
                element.css("width", options.width);

            needsInit = false;
        }

        function target(event) {
            var element = event.target;
            while (element && element.tagName != "LI")
                element = element.parentNode;
            // more fun with IE, sometimes event.target is empty, just ignore it then
            if (!element)
                return [];
            return element;
        }

        function moveSelect(step) {
            listItems.slice(active, active + 1).removeClass(CLASSES.ACTIVE);
            movePosition(step);
            var activeItem = listItems.slice(active, active + 1).addClass(CLASSES.ACTIVE);
            if (options.scroll) {
                var offset = 0;
                listItems.slice(0, active).each(function () {
                    offset += this.offsetHeight;
                });
                if ((offset + activeItem[0].offsetHeight - list.scrollTop()) > list[0].clientHeight) {
                    list.scrollTop(offset + activeItem[0].offsetHeight - list.innerHeight());
                } else if (offset < list.scrollTop()) {
                    list.scrollTop(offset);
                }
            }
        };

        function movePosition(step) {
            active += step;
            if (active < 0) {
                active = listItems.size() - 1;
            } else if (active >= listItems.size()) {
                active = 0;
            }
        }

        function limitNumberOfItems(available) {
            return options.max && options.max < available ? options.max : available;
        }

        function fillList() {
            list.empty();
            var max = limitNumberOfItems(data.length);
            for (var i = 0; i < max; i++) {
                if (!data[i])
                    continue;

                var formatted = options.formatItem ? options.formatItem(data[i].data, i + 1, max, data[i].value, term) : data[i].qValue + data[i].data;
                if (formatted === false)
                    continue;
                var li = $("<li/>").html(options.highlight(formatted, term)).addClass(i % 2 == 0 ? "em_even" : "em_odd").appendTo(list)[0];
                $.data(li, "ac_data", data[i]);
            }
            listItems = list.find("li");
            if (options.selectFirst) {
                listItems.slice(0, 1).addClass(CLASSES.ACTIVE);
                active = 0;
            }
            // apply bgiframe if available
            if ($.fn.bgiframe)
                list.bgiframe();
        }

        return {
            display: function (d, q) {
                init();
                data = d;
                term = q;
                fillList();
            },
            next: function () {
                moveSelect(1);
            },
            prev: function () {
                moveSelect(-1);
            },
            pageUp: function () {
                if (active != 0 && active - 8 < 0) {
                    moveSelect(-active);
                } else {
                    moveSelect(-8);
                }
            },
            pageDown: function () {
                if (active != listItems.size() - 1 && active + 8 > listItems.size()) {
                    moveSelect(listItems.size() - 1 - active);
                } else {
                    moveSelect(8);
                }
            },
            hide: function () {
                element && element.hide();
                listItems && listItems.removeClass(CLASSES.ACTIVE);
                active = -1;
            },
            visible: function () {
                return element && element.is(":visible");
            },
            current: function () {
                return this.visible() && (listItems.filter("." + CLASSES.ACTIVE)[0] || options.selectFirst && listItems[0]);
            },
            show: function () {
                var offset = $(input).offset();
                element.css({
                    width: typeof options.width == "string" || options.width > 0 ? options.width : $(input).width()+15,
                    top: offset.top + input.offsetHeight,
                    left: offset.left-5
                }).show();
                if (options.scroll) {
                    list.scrollTop(0);
                    list.css({
                        maxHeight: options.scrollHeight,
                        overflow: 'auto'
                    });

                    if (/*$.browser.msie && */typeof document.body.style.maxHeight === "undefined") {
                        var listHeight = 0;
                        listItems.each(function () {
                            listHeight += this.offsetHeight;
                        });
                        var scrollbarsVisible = listHeight > options.scrollHeight;
                        list.css('height', scrollbarsVisible ? options.scrollHeight : listHeight);
                        if (!scrollbarsVisible) {
                            // IE doesn't recalculate width when scrollbar disappears
                            listItems.width(list.width() - parseInt(listItems.css("padding-left")) - parseInt(listItems.css("padding-right")));
                        }
                    }

                }
            },
            selected: function () {
                var selected = listItems && listItems.filter("." + CLASSES.ACTIVE).removeClass(CLASSES.ACTIVE);
                return selected && selected.length && $.data(selected[0], "ac_data");
            },
            emptyList: function () {
                list && list.empty();
            },
            unbind: function () {
                element && element.remove();
            }
        };
    };

})(jQuery);
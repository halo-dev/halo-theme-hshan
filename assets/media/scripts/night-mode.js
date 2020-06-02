var nightModeId = 'nightMode';

var darkMode = {
    autoNightMode: function () {

        var nightModes = $('.night-mode');
        var day = new Date();
        var D = day.getHours();
        var isNightMode = hanUtils.getLocalStorage(nightModeId);
        if (D <= nightModeStartTime && D > nightModeEndTime) {
            // 白天
            if (isNightMode === true) {
                // 是暗黑模式
                darkMode.changeNightMode(nightModes);
                return;
            }
            darkMode.changeLightMode(nightModes);
        } else {
            // 晚上
            if (isNightMode === false) {
                // 不是暗黑模式
                darkMode.changeLightMode(nightModes);
                return;
            }
            darkMode.changeNightMode(nightModes);
        }
        if (typeof renderComment === 'function') {
            renderComment();
        }
    },

    changeLightMode: function (nightModes) {
        $(document.body).removeClass('night');
        for (var i = 0; i < nightModes.length; i++) {
            var nightMode = $(nightModes[i]);
            nightMode.addClass('fa-moon-o');
            nightMode.removeClass('fa-lightbulb-o');
        }
        hanUtils.setLocalStorage(nightModeId, false)
    },

    changeNightMode: function (nightModes) {
        $(document.body).addClass('night');
        for (var i = 0; i < nightModes.length; i++) {
            var nightMode = $(nightModes[i]);
            nightMode.addClass('fa-lightbulb-o');
            nightMode.removeClass('fa-moon-o');
        }
        hanUtils.setLocalStorage(nightModeId, true)
    },

    nightModeFuc: function () {
        var nightModes = $('.night-mode');
        if (!nightModes) {
            return;
        }
        for (var i = 0; i < nightModes.length; i++) {
            var nightMode = $(nightModes[i]);
            darkMode.doFuncNightMode(nightMode);
        }

    },

    doFuncNightMode: function (nightMode) {
        var nightModeBtn = $('.night-mode');
        if ($(document.body).hasClass('night')) {
            nightModeBtn.addClass('fa-lightbulb-o');
            nightModeBtn.removeClass('fa-moon-o');
        } else {
            nightModeBtn.addClass('fa-moon-o');
            nightModeBtn.removeClass('fa-lightbulb-o');
        }


        nightMode.click(function (e) {
            if (nightMode.hasClass('fa-moon-o')) {
                $(document.body).addClass('night');
                nightModeBtn.addClass('fa-lightbulb-o');
                nightModeBtn.removeClass('fa-moon-o');
                hanUtils.setLocalStorage(nightModeId, true);
            } else if (nightMode.hasClass('fa-lightbulb-o')) {
                $(document.body).removeClass('night');
                nightModeBtn.addClass('fa-moon-o');
                nightModeBtn.removeClass('fa-lightbulb-o');

                hanUtils.setLocalStorage(nightModeId, false);
            }
            $(document.body).removeClass('sidebar-opened');
            if (typeof renderComment === 'function') {
                renderComment();
            }
        })
    }
}

$(function () {
// 自动暗黑模式
    darkMode.autoNightMode();

// 暗黑模式
    darkMode.nightModeFuc();
})


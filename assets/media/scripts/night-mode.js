const nightModeId = 'nightMode';

function autoNightMode() {
    var nightModes = $('.night-mode');
    var day = new Date();
    var D = day.getHours();
    var codeNight = $('#codeNight');
    var codeLight = $('#codeLight');
    var isNightMode = getLocalStorage(nightModeId);
    if (D <= 18 && D > 6) {
        // 白天
        if (isNightMode === true) {
            // 是暗黑模式
            changeNightMode(codeNight, codeLight, nightModes);
            return;
        }
        changeLightMode(codeNight, codeLight, nightModes);
    } else {
        // 晚上
        if (isNightMode === false) {
            // 不是暗黑模式
            changeLightMode(codeNight, codeLight, nightModes);
            return;
        }
        changeNightMode(codeNight, codeLight, nightModes);
    }
    if (typeof renderComment === 'function') {
        renderComment();
    }
}

function changeLightMode(codeNight, codeLight, nightModes) {
    $(document.body).removeClass('night');
    if (codeNight && codeLight) {
        codeNight.attr("rel", "alternate stylesheet");
        codeLight.attr("rel", "stylesheet");
    }
    for (let i = 0; i < nightModes.length; i++) {
        let nightMode = $(nightModes[i]);
        nightMode.addClass('fa-moon-o');
        nightMode.removeClass('fa-lightbulb-o');
    }
    setLocalStorage(nightModeId, false)
}

function changeNightMode(codeNight, codeLight, nightModes) {
    $(document.body).addClass('night');
    if (codeNight && codeLight) {
        codeLight.attr("rel", "alternate stylesheet");
        codeNight.attr("rel", "stylesheet");
    }
    for (let i = 0; i < nightModes.length; i++) {
        let nightMode = $(nightModes[i]);
        nightMode.addClass('fa-lightbulb-o');
        nightMode.removeClass('fa-moon-o');
    }
    setLocalStorage(nightModeId, true)
}

function nightModeFuc() {
    var nightModes = $('.night-mode');
    if (!nightModes) {
        return;
    }
    for (let i = 0; i < nightModes.length; i++) {
        var nightMode = $(nightModes[i]);
        doFuncNightMode(nightMode);
    }

}

function doFuncNightMode(nightMode) {
    var nightModeBtn = $('.night-mode');
    if ($(document.body).hasClass('night')) {
        nightModeBtn.addClass('fa-lightbulb-o');
        nightModeBtn.removeClass('fa-moon-o');
    } else {
        nightModeBtn.addClass('fa-moon-o');
        nightModeBtn.removeClass('fa-lightbulb-o');
    }

    var codeNight = $('#codeNight');
    var codeLight = $('#codeLight');


    nightMode.click(function (e) {
        if (nightMode.hasClass('fa-moon-o')) {
            $(document.body).addClass('night');
            nightModeBtn.addClass('fa-lightbulb-o');
            nightModeBtn.removeClass('fa-moon-o');
            if (codeNight && codeLight) {
                codeLight.attr("rel", "alternate stylesheet");
                codeNight.attr("rel", "stylesheet");
            }
            setLocalStorage(nightModeId, true);
        } else if (nightMode.hasClass('fa-lightbulb-o')) {
            $(document.body).removeClass('night');
            nightModeBtn.addClass('fa-moon-o');
            nightModeBtn.removeClass('fa-lightbulb-o');
            if (codeNight && codeLight) {
                codeNight.attr("rel", "alternate stylesheet");
                codeLight.attr("rel", "stylesheet");
            }

            setLocalStorage(nightModeId, false);
        }
        $('#sidebar').removeClass('sidebar-show');
        $("#sidebarToggle").removeClass('menu-ctrl-on');
        $(document.body).removeClass('sidebar-opened');
        if (typeof renderComment === 'function') {
            renderComment();
        }
    })
}

function setLocalStorage(key, value) {
    var curtime = new Date().getTime(); // 获取当前时间 ，转换成JSON字符串序列
    var valueDate = JSON.stringify({
        val: value,
        timer: curtime
    });
    try {
        localStorage.setItem(key, valueDate);
    } catch (e) {
        // 兼容性写法
        if (isQuotaExceeded(e)) {
            console.log("Error: 本地存储超过限制");
            localStorage.clear();
        } else {
            console.log("Error: 保存到本地存储失败");
        }
    }
}

function isQuotaExceeded(e) {
    var quotaExceeded = false;
    if (e) {
        if (e.code) {
            switch (e.code) {
                case 22:
                    quotaExceeded = true;
                    break;
                case 1014: // Firefox
                    if (e.name === 'NS_ERROR_DOM_QUOTA_REACHED') {
                        quotaExceeded = true;
                    }
                    break;
            }
        } else if (e.number === -2147024882) { // IE8
            quotaExceeded = true;
        }
    }
    return quotaExceeded;
}

function getLocalStorage(key) {
    var exp = 60 * 60 * 1000; // 一个小时的秒数
    if (localStorage.getItem(key)) {
        var vals = localStorage.getItem(key); // 获取本地存储的值
        var dataObj = JSON.parse(vals); // 将字符串转换成JSON对象
        // 如果(当前时间 - 存储的元素在创建时候设置的时间) > 过期时间
        var isTimed = (new Date().getTime() - dataObj.timer) > exp;
        if (isTimed) {
            console.log("存储已过期");
            localStorage.removeItem(key);
            return null;
        } else {
            var newValue = dataObj.val;
        }
        return newValue;
    } else {
        return null;
    }
}

// 自动暗黑模式
autoNightMode();

// 暗黑模式
nightModeFuc();
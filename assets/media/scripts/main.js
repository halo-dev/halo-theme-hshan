/**
 * Main JS file for Subtle behaviours
 */
// Responsive video embeds
var videoEmbeds = [
    'iframe[src*="youtube.com"]',
    'iframe[src*="vimeo.com"]',
]
reframe(videoEmbeds.join(','))

// Smooth scroll to anchors
var scroll = new SmoothScroll('[data-scroll]', {
    speed: 300,
    updateURL: false,
})


// Sidebar toggle
var sidebarToggle = document.querySelectorAll('.sidebar-toggle')
if (sidebarToggle)
    for (var i = 0; i < sidebarToggle.length; i++)
        sidebarToggle[i].addEventListener(
            'click',
            function (e) {
                var menuCtrl = $('#sidebarToggle')
                if (menuCtrl)
                    menuCtrl.toggleClass('menu-ctrl-on')
                var scrollMenu = $('#scrollMenu')
                if (scrollMenu)
                    scrollMenu.toggleClass('scroll-menu-show')
                var siteHeader = $('#siteHeader')
                if (siteHeader)
                    siteHeader.toggleClass('site-header-scroll')
                siteHeader.toggleClass('site-header-bg')
                var sideBar = $('#sidebar')
                if (sideBar)
                    sideBar.toggleClass('sidebar-show')
                e.preventDefault()

                // 滚动条
                $(document.body).toggleClass('cancel-scroll')
            },
            {
                passive: false,
            })
$(
    function () {
        function linksAddBlank() {
            var links = $('.post-content a')
            if (links)
                for (var i = 0; i < links.length; i++)
                    $(links[i]).attr('target', '_blank')
        }

        var oldScrollTop

        // 获取滚动条距离顶部位置

        function getScrollTop() {
            var scrollTop = 0
            if (document.documentElement && document.documentElement.scrollTop)
                scrollTop = document.documentElement.scrollTop
            else if (document.body)
                scrollTop = document.body.scrollTop
            return scrollTop
        }

        function scollHeader() {
            window.addEventListener(
                'scroll',
                function () {
                    var siteHeader = $('#siteHeader')
                    var scrollMenu = $('#scrollMenu')
                    var sidebarToggle = $('#sidebarToggle')
                    var scrollTop = getScrollTop()
                    if (siteHeader && scrollTop > 0) {
                        siteHeader.addClass('site-header-scroll')
                        scrollMenu.addClass('scroll-menu-show')
                        sidebarToggle.hide()
                    } else {
                        siteHeader.removeClass('site-header-scroll')
                        scrollMenu.removeClass('scroll-menu-show')
                        sidebarToggle.show()
                    }
                    oldScrollTop = scrollTop
                },
                false)
        }

        function toggleSearch() {
            // 搜索框
            $('.js-toggle-search').on('click', function () {
                openSearchPanel()
                $('.searchbox-input').focus()
                $('#sidebar').removeClass('sidebar-show')
                $('#sidebarToggle').removeClass('menu-ctrl-on')
                $(document.body).removeClass('sidebar-opened')
                $(document.body).removeClass('cancel-scroll')
            })
        }

        // 当前菜单菜单高亮

        function highlightMenu() {
            var nav = document.getElementById('scrollMenu')
            var links = nav.getElementsByTagName('a')
            var currenturl = document.location.href
            var last = 0
            for (var i = 0; i < links.length; i++) {
                var linkurl = links[i].getAttribute('href')
                if (currenturl.indexOf(linkurl) !== -1)
                    last = i
            }
            $(links[last]).addClass('active-current')
            var currentLinks = links[last]
            if ($(currentLinks).parents('.sub-menu')) {
                var subMenu = $(currentLinks).parents('.sub-menu')
                $(subMenu[0]).siblings('a').addClass('active-current')
            }
        }

        function foldSubMenu() {
            $(".nav-menu-link").click(function (e) {
                var angle = $(this).children('.fa')[0];
                $(angle).toggleClass('angle-transform');
                var subMenu = $(this).siblings('.nav-sub-menu');
                if (subMenu && !$(this).siblings('.nav-sub-menu').hasClass('nav-menu-show')) {
                    subMenu.velocity("transition.slideDownIn", {duration: 300});
                    subMenu.addClass('nav-menu-show')
                } else if (subMenu && $(this).siblings('.nav-sub-menu').hasClass('nav-menu-show')) {
                    subMenu.velocity("transition.slideUpOut", {duration: 300});
                    subMenu.removeClass('nav-menu-show')
                }
            });
        }

        function pagination() {
            $body = (window.opera) ? (document.compatMode == "CSS1Compat" ? $('html') : $('body')) : $('html,body');
            $('body').on('click', '#pagination a', function () {
                var pageContent = $('#pagination');
                pageContent.html("")
                pageContent.append('<div class="loader-inner ball-pulse"><div/><div/><div/></div>');
                $.ajax({
                    type: "GET",
                    url: $(this).attr("href"),
                    success: function (data) {
                        result = $(data).find("#post-list .post-item");
                        pageInner = $(data).find("#pagination .inner");
                        // In the new content
                        $("#post-list").html(result.fadeIn(500));
                        pageContent.empty();
                        pageContent.append(pageInner);
                        document.getElementById("post-list").scrollIntoView()
                    }
                });
                return false;
            });
        }

        function postItemHover() {
            $('.card').hover(function(){
                $(this).find(".card-shadow").addClass('card-shadow-hover')
            },function(){
                $(this).find(".card-shadow").removeClass('card-shadow-hover');
            });
        }

        // 卡片hover事件
        postItemHover()

        linksAddBlank()

        // 头部菜单滚动时间
        scollHeader()

        toggleSearch()

        // 当前目录菜单高亮
        highlightMenu()

        // 菜单点击事件
        foldSubMenu()

        // 分页
        pagination()
    });

// 删除日志中的空元素
$(document).ready(
    function () {
        var treeHoleBoxs = document.querySelectorAll('.tree-hole-box')
        if (treeHoleBoxs)
            for (var i = 0; i < treeHoleBoxs.length; i++) {
                var childrens = $(treeHoleBoxs[i]).children('p:empty')
                for (var j = 0; j < childrens.length; j++)
                    childrens[j].remove()
            }
    });



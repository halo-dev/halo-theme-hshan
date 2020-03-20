function ajaxLoad() {
    $body = (window.opera) ? (document.compatMode == "CSS1Compat" ? $('html') : $('body')) : $('html,body');
    $('body').on('click', 'a[data-ajax]', function () {
        var pageContent = $('#main');
        pageContent.html("")
        var loader = randLoader[Math.floor(Math.random() * 10 % randLoader.length)];
        pageContent.append(loader);
        var url = $(this).attr("href");
        $.ajax({
            type: "GET",
            url: $(this).attr("href"),
            success: function (data) {
                result = $(data).find("#main");
                // In the new content
                $("#page").html(result.fadeIn(500));
                pageContent.empty();
                // 页面
                window.history.pushState({}, title, url);

                // 高亮菜单
                han.highlightMenu();


                // 文章页面
                if ($(data).find('.post-page').length > 0) {
                    post.appreciate();

                    // 初始化toc
                    post.initToc()

                    post.removeFirstUL()

                    // 目录事件
                    post.scrollTocFixed('tocFlag');

                    // 搞一个阅读进度，为了提高准确度，数据都要实时获取
                    post.readProgress();

                    // 按钮事件
                    post.appreciateModel()

                    // 分享
                    post.toggleSocialShare()

                    post.initViewAndCode()

                    // jQuery 写法
                    $('script[data-pjax-js]').each(function () {
                        $(this).parent().append($(this).remove());
                    });

                    try {
                        if (renderMathInElement) {
                            renderMathInElement(document.getElementById('post-content'), katex_config);
                        }

                        if (typeof mermaid !== 'undefined') {
                            mermaid.initialize();
                        }
                    }catch (e) {
                        console.log(e);
                    }

                }

                // 加载图片
                if ($(data).find('.photos-page').length > 0) {
                    photo.loadGallery();
                }

                $('#sidebar').removeClass('sidebar-show')
                $('#sidebarToggle').removeClass('menu-ctrl-on')
                $(document.body).removeClass('sidebar-opened')
                $(document.body).removeClass('cancel-scroll')

            }
        });
        return false;
    });
}

var randLoader = [
    '<div class="loader"><div class="pacman"><div></div><div></div><div></div><div></div><div></div></div></div>',
    '<div class="loader"><div class="ball-grid-beat"><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div></div></div>',
    '<div class="loader"><div class="ball-beat"><div></div><div></div><div></div></div></div>',
    '<div class="loader"><div class="ball-pulse"><div></div><div></div><div></div></div></div>',
    '<div class="loader"><div class="ball-grid-pulse"><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div></div></div>',
    '<div class="loader"><div class="ball-clip-rotate"><div></div></div></div>',
    '<div class="loader"><div class="semi-circle-spin"><div></div></div></div>',
    '<div class="loader"><div class="ball-scale-multiple"><div></div><div></div><div></div></div></div>',
    '<div class="loader"><div class="ball-scale-ripple-multiple"><div></div><div></div><div></div></div></div>'

]

ajaxLoad()
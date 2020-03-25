var tocId = '#toc';
var flagId = '#tocFlag'
var post =  {
    appreciateModel: function() {
        $(".appreciate-btn").on("click", function (e) {
            $(".qr-code-wrap").velocity("transition.expandIn", { duration: 300 });
            // $(".qr-code-wrap").show();
            $(document).one("click", function () {
                // $(".qr-code-wrap").hide();
                $(".qr-code-wrap").velocity("transition.expandOut", { duration: 300 });

            });
            e.stopPropagation();
        });
    },

    toggleSocialShare: function () {
        $('.share-btn').on("click", function (e) {
            var icons = $('#socialShare');
            if (icons.hasClass('show')) {
                $('#socialShare').velocity("transition.slideUpOut", { duration: 300 });
            } else {
                $('#socialShare').velocity("transition.slideDownIn", { duration: 300 });
            }
            icons.toggleClass('show');
        });
    },

    // 赞赏点击事件
    appreciate: function () {

        $(".qr-code").on("click", function (e) {
            e.stopPropagation();
        });
        $(".closinglayer").on("click", function (e) {
            // $(".qr-code-wrap").hide();
            $(".qr-code-wrap").velocity("transition.expandOut", { duration: 300 });
        });
        $(".zfb-btn").on("click", function (e) {
            $(".qr_code_zfb").css("height", "300px");
            $(".qr_code_wx").css("height", "0");
        });
        $(".wx-btn").on("click", function (e) {
            $(".qr_code_wx").css("height", "300px");
            $(".qr_code_zfb").css("height", "0");
        });
    },

    // 因为不使用后端渲染目录, 所以如果在发布文章的时候在文章开头加上 [TOC] 会在文章页面开头有一个ul 标签
    // 这里粗暴的去除
    removeFirstUL: function () {
        var post_content = document.getElementById('post-content');
        if (!post_content) {
            return;
        }
        var firstNodeName = post_content.firstElementChild.nodeName;
        if (firstNodeName === 'UL') {
            $(post_content.firstElementChild).hide();
        }
    },

    //获取滚动条距离顶部位置
    getScrollTop: function () {
        return document.documentElement.scrollTop || document.body.scrollTop;
    },

    tocScroll: function (event) {
        var Obj = $(flagId);

        //判断元素是否存在
        if (Obj.length !== 1) {
            return false;
        }

        var tocFixed = $(tocId);
        var ObjTop = Obj.offset().top - $(window).height() * 0.5;

        // 滚动条离页面顶端的距离
        var scrollTop = post.getScrollTop();
        var postHeaderHeight = $('#postHeader').height();
        if (scrollTop > postHeaderHeight) {
            tocFixed.show();
        } else {
            tocFixed.hide();
        }

        var tocEle = document.querySelector(tocId);
        if (!tocEle || !tocEle.getBoundingClientRect()) {
            return;
        }
        var tocHeight = tocEle.getBoundingClientRect().height;
        if (scrollTop > ObjTop - tocHeight * 0.5) {
            tocFixed.addClass('right-fixed');
        } else {
            tocFixed.removeClass('right-fixed');
        }

        post.tocParentActive()
        event.preventDefault();
    },

    scrollTocFixed: function () {
        window.addEventListener('scroll', post.tocScroll, false);
    },


    initToc: function () {
        var headerEl = 'h1,h2,h3,h4,h5,h6',  //headers
            content = '.post-content';//文章容器
        tocbot.init({
            tocSelector: '#toc',
            contentSelector: content,
            headingSelector: headerEl,
            scrollSmooth: true,
            headingsOffset: 0 - $('#postHeader').height(),
            hasInnerContainers: false,
        });

        var tocLinks = $('.toc-link');
        if (tocLinks) {
            for (var i = 0; i < tocLinks.length; i++) {
                var tocLink = tocLinks[i];
                tocLink.after(document.createElement("span"));
            }
        }
    },

    /**
     * 阅读进度（阅读进度条和目录高亮功能）
     */
    readProgress: function () {

        // 文章内容
        var $content = $("#main");
        // 阅读进度条
        var $readProgressBar = $("#readProgress .read-progress-bar");

        /**
         * 改变阅读进度条
         */
        var changeReadProgress = function () {
            // contentHeight 实际总阅读高度 = 内容的高度 - 窗口的可视高度
            var contentHeight = $content.height() - window.innerHeight;
            if (contentHeight <= 0) return;
            // readHeight 已经阅读的高度 = 当前页面的垂直偏移量 - 内容元素上边的多余部分
            var readHeight = window.pageYOffset - $content.offset().top;
            // 进度条的宽度
            var progressWidth = readHeight / contentHeight * 100 + '%';
            $readProgressBar.width(progressWidth);
        };

        // 改变阅读进度条
        displayReadProgress && changeReadProgress();

        $(window).on('scroll', function () {
            // 改变阅读进度条
            displayReadProgress && changeReadProgress();
        });
    },

    initViewer: function () {
        if (document.getElementById('post-content')) {
            new Viewer(document.getElementById('post-content'), {
                toolbar: false,
            });
        }
    },

    loadHighlight: function() {
        var codes = document.querySelectorAll('.post-page pre code');
        for (var i = 0; i < codes.length; i++) {
            var block = codes[i];
            hljs.highlightBlock(block);
            $('code.hljs').each(function(i, block) {
                hljs.lineNumbersBlock(block);
            });
        }
        // document.querySelectorAll('.post-page pre code').forEach((block) => {
        //     hljs.highlightBlock(block);
        //     $('code.hljs').each(function(i, block) {
        //         hljs.lineNumbersBlock(block);
        //     });
        // });
    },

    tocHover: function () {
        $('.toc-list-item span').hover(function () {
            $(this).parent().find('a.toc-link:first').addClass('toc-hover')
        }, function() {
            $(this).parent().find('a.toc-link:first').removeClass('toc-hover')
        })
    },

    tocParentActive: function () {
        var isCollapsible = $('.is-active-li').parents('ol.toc-list.is-collapsible');
        if (isCollapsible) {
            isCollapsible.each(function() {
                $(this).parent().find('a.toc-link:first').addClass('toc-hover');
            })
        }
        var isCollapsed = $('ol.toc-list.is-collapsible.is-collapsed');
        if (isCollapsed) {
            isCollapsed.each(function() {
                $(this).parent().find('a.toc-link:first').removeClass('toc-hover');
            })
        }

    },

    shareIcon: function() {

        var $config = {
            sites               : ['google','twitter','facebook','weibo','qq','tencent','qzone','linkedin','wechat','douban','diandian'], // 启用的站点
            disabled            : socialDisabled.split(','), // 禁用的站点
        };

        socialShare('.social-share', $config);
    }


}

$(function() {
    // 赞赏
    post.appreciate();

    // 初始化toc
    post.initToc()

    // 删除文章最开始第一个 <ul>(如果有)
    post.removeFirstUL()

    // 目录事件
    post.scrollTocFixed();

    // 搞一个阅读进度，为了提高准确度，数据都要实时获取
    post.readProgress();

    // 代码块
    post.loadHighlight();

    // 按钮事件
    post.appreciateModel()

    // 分享
    post.toggleSocialShare()

    // 图片预览
    post.initViewer()

    // 目录悬浮时间
    post.tocHover();

})

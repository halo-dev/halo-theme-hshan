<script src="${static!}/assets/media/scripts/plugins.js"></script>
<script src="${static!}/assets/media/scripts/custom.js"></script>

<!-- highlight -->
<script src="${static!}/assets/media/scripts/highlight.min.js"></script>
<script src="${static!}/assets/media/scripts/highlightjs-line-numbers.min.js"></script>
<!-- Md5 Min JS -->
<script src="${static!}/assets/media/scripts/md5.min.js"></script>

<script src="${static!}/assets/media/scripts/jquery.min.js"></script>

<script type="application/javascript">
    // 代码高亮
    hljs.initHighlightingOnLoad();
    // 代码行号
    hljs.initLineNumbersOnLoad();

    $(document).ready(function () {
        $(".appreciate-btn").on("click", function (e) {
            $(".qr-code").addClass('qr-code-display');
            $(document).one("click", function () {
                $(".qr-code").removeClass('qr-code-display');
            });
            e.stopPropagation();
        });
        $(".qr-code").on("click", function (e) {
            e.stopPropagation();
        });
        $(".closinglayer").on("click", function (e) {
            $(".qr-code").removeClass('qr-code-display');
        });
        $(".zfb-btn").on("click", function (e) {
            $(".qr_code_zfb").css("opacity", "1");
            $(".qr_code_wx").css("opacity", "0");
        });
        $(".wx-btn").on("click", function (e) {
            $(".qr_code_wx").css("opacity", "1");
            $(".qr_code_zfb").css("opacity", "0");
        });
    });

    console.log("%c 有朋自远方来, 不亦说乎.", "background:#24272A; color:#ffffff", "");
    console.log("%c Github %c", "background:#24272A; color:#ffffff", "", "https://github.com/hshanx");

</script>

<#if settings.TimeStatistics??>
    <script type="text/javascript">
        function show_date_time() {
            if ($("#span_dt_dt").length > 0) {
                window.setTimeout("show_date_time()", 1000);
                BirthDay = new Date("${settings.TimeStatistics!}");
                today = new Date();
                timeold = (today.getTime() - BirthDay.getTime());
                sectimeold = timeold / 1000;
                secondsold = Math.floor(sectimeold);
                msPerDay = 24 * 60 * 60 * 1000;
                e_daysold = timeold / msPerDay;
                daysold = Math.floor(e_daysold);
                e_hrsold = (e_daysold - daysold) * 24;
                hrsold = Math.floor(e_hrsold);
                e_minsold = (e_hrsold - hrsold) * 60;
                minsold = Math.floor((e_hrsold - hrsold) * 60);
                seconds = Math.floor((e_minsold - minsold) * 60);
                span_dt_dt.innerHTML = daysold + "天" + hrsold + "小时" + minsold + "分" + seconds + "秒";
            }
            ;
        }

        show_date_time();
    </script>
</#if>

<div class="qr-code">
    <span class="closinglayer"><i class="fa fa-close"></i></span>
    <#if settings.QR_code_zfb??>
        <img class="qr_code_zfb" src="${settings.QR_code_zfb!}"/>
    </#if>
    <#if settings.QR_code_wx??>
        <img class="qr_code_wx" src="${settings.QR_code_wx!}"/>
    </#if>
    <#if settings.QR_code_zfb?? && settings.QR_code_wx??>
        <div class="switch-btn">
            <span class="zfb-btn">支付宝</span>
            <span class="wx-btn">微信</span>
        </div>
    </#if>
</div>

<#if settings.Custom_js_foot??>
    <script type="text/javascript">
        ${settings.Custom_js_foot!}
    </script>
</#if>

<#if settings.Custom_js_foot_src??>
    ${settings.Custom_js_foot_src!}
</#if>

<#--公有的-->
<script type="application/javascript">
    var oldScrollTop;

    //获取滚动条距离顶部位置
    function getScrollTop() {
        var scrollTop = 0;
        if (document.documentElement && document.documentElement.scrollTop) {
            scrollTop = document.documentElement.scrollTop;
        } else if (document.body) {
            scrollTop = document.body.scrollTop;
        }
        return scrollTop;
    }

    window.addEventListener('scroll', function () {
        var siteHeader = $("#siteHeader");
        var scrollMenu = $("#scrollMenu");
        var sidebarToggle = $("#sidebarToggle");
        const scrollTop = getScrollTop();
        if (siteHeader&&  scrollTop > 30 && oldScrollTop > scrollTop) {
            siteHeader.addClass('site-header-scroll');
            scrollMenu.addClass('scroll-menu-show');
            sidebarToggle.hide();
        } else {
            siteHeader.removeClass('site-header-scroll');
            scrollMenu.removeClass('scroll-menu-show');
            sidebarToggle.show();
        }
        oldScrollTop = scrollTop;
    }, false);

    // 搜索框
    $('.js-toggle-search').on('click', function () {
        $('.js-toggle-search').toggleClass('is-active');
        $('.js-search').toggleClass('is-visible');
    });
    $('.search_close').on('click', function () {
        if ($('.js-search').hasClass('is-visible')) {
            $('.js-toggle-search').toggleClass('is-active');
            $('.js-search').toggleClass('is-visible');
        }
    });

    // 删除日志中的空元素
    $(document).ready(function () {
        var treeHoleBoxs = document.querySelectorAll('.tree-hole-box');
        if (treeHoleBoxs) {
            for (let i = 0; i < treeHoleBoxs.length; i++) {
                var childrens = $(treeHoleBoxs[i]).children("p:empty");
                for (let j = 0; j < childrens.length; j++) {
                    childrens[j].remove();
                }
            }
        }
    });

</script>

<#--目录-->
<#if is_post?? && settings.post_toc!true>
    <script src="${static!}/assets/media/scripts/tocbot.min.js"></script>

    <script type="application/javascript">
        // var siteContent;
        var oldScrollTop;
        //获取滚动条距离顶部位置
        function getScrollTop() {
            return document.documentElement.scrollTop || document.body.scrollTop;
        }
        const siteFooter = '#siteFooter';
        const articleInfo = '#articleInfo';
        const postNavigation = '#post-navigation';
        const postTemplate = '#postTemplate';
        const postContent = '#post-content';
        const tocFlag = '#tocFlag';

        const windowHeight = document.documentElement.clientHeight;

        function scrollTocFixed(div_id) {
            var Obj = $('#' + div_id);

            //判断元素是否存在
            if (Obj.length != 1) { return false; }

            const tocId = '#toc';
            window.addEventListener('scroll', function () {
                var tocFixed = $(tocId);
                var ObjTop = Obj.offset().top - $(window).height() * 0.5 ;

                // 滚动条离页面顶端的距离
                var scrollTop = getScrollTop();
                var postHeaderHeight = $('#postHeader').height();
                if (scrollTop > postHeaderHeight) {
                    tocFixed.show();
                } else {
                    tocFixed.hide();
                }

                var tocEle = document.querySelector(tocId);
                var tocHeight = tocEle.getBoundingClientRect().height;
                if (scrollTop  > ObjTop - tocHeight * 0.5) {
                    tocFixed.addClass('right-fixed');
                } else {
                    tocFixed.removeClass('right-fixed');
                }
            });
        }

        scrollTocFixed('tocFlag');

        var headerEl = 'h1,h2,h3,h4,h5,h6',  //headers
            content = '.post-content',//文章容器
            idArr = {};  //标题数组以确定是否增加索引id
        tocbot.init({
            tocSelector: '#toc',
            contentSelector: content,
            headingSelector: headerEl,
            //positionFixedSelector: '.toc',
            //positionFixedClass: 'is-position-fixed',
            //fixedSidebarOffset: 'auto',
            scrollSmooth: true,
            scrollSmoothOffset: -80,
            headingsOffset: -500
        });

        var tocLinks = $('.toc-link');
        if (tocLinks) {
            for (let i = 0; i < tocLinks.length; i++) {
                var tocLink = tocLinks[i];
                tocLink.after(document.createElement("span"));
            }
        }

    </script>
</#if>

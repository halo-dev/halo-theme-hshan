<script src="${static!}/assets/media/scripts/plugins.js"></script>
<script src="${static!}/assets/media/scripts/custom.js"></script>

<!-- highlight -->
<script src="${static!}/assets/media/scripts/highlight.min.js"></script>
<!-- Md5 Min JS -->
<script src="${static!}/assets/media/scripts/md5.min.js"></script>

<script src="${static!}/assets/media/scripts/jquery.min.js"></script>

<script type="application/javascript">
    // 代码高亮
    hljs.initHighlightingOnLoad();

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

<#if is_post?? && settings.post_toc??>
    <script src="${static!}/assets/media/scripts/tocbot.min.js"></script>

    <script type="application/javascript">
        var siteContent;
        <#if is_post?? && settings.post_nepre??>
        siteContent = $('#siteContent').height();
        </#if>
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
            var tocFixed =$("#toc");
            const scrollTop = getScrollTop();
            const fixedHeight = 700;
            if (scrollTop > fixedHeight && !(siteContent && scrollTop > siteContent)) {
                tocFixed.show(100);
            } else {
                tocFixed.hide();
            }
        }, false);

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
    </script>
</#if>
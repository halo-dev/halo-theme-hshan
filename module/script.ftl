<#include "mermaid.ftl">
<script src="//cdn.jsdelivr.net/npm/vue@2.6.10/dist/vue.min.js"></script>
<script src="${theme_base!}/assets/media/scripts/plugins.min.js?ver=${.now?long}"></script>
<script src="${theme_base!}/assets/media/scripts/main.min.js?ver=${.now?long}"></script>
<script src="//cdn.jsdelivr.net/npm/velocity-animate@1.5.2/velocity.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/velocity-animate@1.5.2/velocity.ui.min.js"></script>
<#if settings.auto_night_mode>
    <script src="//cdn.jsdelivr.net/gh/hshanx/halo-comment-normal@v1.0.0/dist/halo-comment.min.js"></script>
<#else>
    <script src="${options.comment_internal_plugin_js!'//cdn.jsdelivr.net/gh/hshanx/halo-comment-normal@v1.0.0/dist/halo-comment.min.js'}"></script>
</#if>

<#if settings.Aplayer?? && settings.Aplayer != ''>
    <script src="//cdn.jsdelivr.net/npm/aplayer@1.10.1/dist/APlayer.min.js"></script>
    <script src="//cdn.jsdelivr.net/npm/meting@2/dist/Meting.min.js"></script>
<#else>
    <script type="text/javascript">
        // Smooth scroll to anchors
        var scroll = new SmoothScroll('[data-scroll]', {
            speed: 300,
            updateURL: false,
        })
    </script>
</#if>

<#-- 暗夜模式 -->
<#if settings.auto_night_mode!true>
    <script type="text/javascript">
        var nightModeStartTime = ${settings.night_mode_start_time?default('18')};
        var nightModeEndTime = ${settings.night_mode_end_time?default('6')};
    </script>
    <script src="${theme_base!}/assets/media/scripts/night-mode.min.js?ver=${.now?long}"></script>
</#if>

<#if settings.visit_statistics!false>
    <script async src="//busuanzi.ibruce.info/busuanzi/2.3/busuanzi.pure.mini.js"></script>
</#if>

<#-- katex-->
<#if settings.enabled_mathjax!true>
    <script defer src="//cdn.jsdelivr.net/npm/katex@0.11.1/dist/katex.min.js"></script>
    <script defer src="//cdn.jsdelivr.net/npm/katex@0.11.1/dist/contrib/auto-render.min.js"
            onload="if (document.getElementById('post-content') ) {renderMathInElement(document.getElementById('post-content'),katex_config)}"></script>
</#if>

<#-- gallery  -->
<#--<script src="//cdn.jsdelivr.net/npm/lightgallery@1.6.8/dist/js/lightgallery.min.js"></script>-->
<script src="//cdn.jsdelivr.net/npm/justifiedGallery@3.7.0/dist/js/jquery.justifiedGallery.min.js"></script>
<!--图片预览插件-->
<script data-pjax-viewer src="//cdn.jsdelivr.net/npm/viewerjs@1.5.0/dist/viewer.min.js"></script>
<script data-gallery src="${theme_base!}/assets/media/scripts/gallery.js"></script>

<script src="//cdn.jsdelivr.net/gh/highlightjs/cdn-release@10.0.0/build/highlight.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/highlightjs-line-numbers.js@2.7.0/dist/highlightjs-line-numbers.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/social-share.js@1.0.16/dist/js/social-share.min.js"></script>


<div class="qr-code-wrap" role="dialog">
    <div role="document" class="qr-code" style="transform-origin: 201px 294px;">
        <span class="closinglayer"><svg viewBox="64 64 896 896" focusable="false" class="" data-icon="close" width="1em"
                                        height="1em" fill="currentColor" aria-hidden="true"><path
                        d="M563.8 512l262.5-312.9c4.4-5.2.7-13.1-6.1-13.1h-79.8c-4.7 0-9.2 2.1-12.3 5.7L511.6 449.8 295.1 191.7c-3-3.6-7.5-5.7-12.3-5.7H203c-6.8 0-10.5 7.9-6.1 13.1L459.4 512 196.9 824.9A7.95 7.95 0 0 0 203 838h79.8c4.7 0 9.2-2.1 12.3-5.7l216.5-258.1 216.5 258.1c3 3.6 7.5 5.7 12.3 5.7h79.8c6.8 0 10.5-7.9 6.1-13.1L563.8 512z"></path></svg>
        </span>
        <div style="text-align: center;padding: 10px 0;">
            <#if settings.QR_code_zfb??>
                <img class="qr_code_zfb" src="${settings.QR_code_zfb!}"/>
            </#if>
            <#if settings.QR_code_wx??>
                <img class="qr_code_wx" src="${settings.QR_code_wx!}"/>
            </#if>
        </div>
        <#if settings.QR_code_zfb?? && settings.QR_code_wx??>
            <div class="switch-btn">
                <span class="zfb-btn">支付宝</span>
                <span class="wx-btn">微信</span>
            </div>
        </#if>
    </div>
</div>

<#--目录-->
<#if settings.post_toc!true>
    <script src="//cdn.jsdelivr.net/npm/tocbot@4.4.2/dist/tocbot.min.js"></script>
</#if>

<script type="application/javascript">
    var displayReadProgress = <#if (settings.open_read_progress)??>${settings.open_read_progress?c}<#else>true</#if>;
</script>
<script src="${theme_base!}/assets/media/scripts/post.min.js?ver=${.now?long}"></script>
<style>
    /* 阅读进度的进度条颜色 */
    #readProgress .read-progress-bar {
        background: ${settings.progress_color?default('#2474b5')} !important;
        height: 0.1875rem;
    }
</style>


<#if settings.TimeStatistics??>
    <script type="text/javascript">
        // 建站时间统计
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
        }

        show_date_time();
    </script>
</#if>

<#if settings.Custom_js_foot??>
    <script type="text/javascript">
        ${settings.Custom_js_foot!}
    </script>
</#if>

<#if settings.Custom_js_foot_src??>
    ${settings.Custom_js_foot_src!}
</#if>

<#if settings.pjax_enabled!false>
    <script src="https://cdn.jsdelivr.net/npm/pjax@0.2.8/pjax.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/nprogress@0.2.0/nprogress.min.js"></script>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/nprogress@0.2.0/nprogress.min.css">

    <script>
        var socialDisabled = '${settings.share_disabeld?default('')}';
        var pjax = new Pjax({
            elements: 'a[href]:not([href^="#"]):not([data-not-pjax]), form', // default is "a[href], form[action]"
            cacheBust: false,
            debug: false,
            selectors: [
                'title',
                '#page'
            ]
        });

        //在Pjax请求开始后触发
        document.addEventListener('pjax:send', function () {
            NProgress.start();
        });

        //在Pjax请求完成后触发
        document.addEventListener('pjax:complete', function (e) {
            NProgress.done();

            // 加载相册
            if ($("#page").find('.photos-page').length > 0) {
                photo.loadGallery();
                // $('script[data-pjax-viewer]').each(function () {
                //     $(this).remove()
                // });
            }

            han.initLazyLoad();
            // 整个页面延迟加载
            han.lazyLoad();

            // card 延迟加载
            han.lazyLoadCardItem()

            //重载
            if (typeof _hmt !== 'undefined') {
                // support 百度统计
                _hmt.push(['_trackPageview', location.pathname + location.search]);
            }
            if (typeof ga !== 'undefined') {
                // support google analytics
                ga('send', 'pageview', location.pathname + location.search);
            }

            // 菜单高亮
            han.highlightMenu();

            // 小屏幕菜单隐藏
            han.makeMenuInvisible();

            //  关闭搜索框
            $(".search-popup").velocity("transition.expandOut", { duration: 300 });

            // 重新加载 评论
            $('script[data-pjax-comment]').each(function () {
                $(this).parent().append($(this).remove());
            });

            if ($("#page").find('.post-page').length > 0) {
                window.removeEventListener('scroll', post.tocScroll, false);
                // 赞赏
                post.appreciate();

                // 初始化toc
                post.initToc()

                // 删除文章第一个 <ul>
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


                try {
                    post.shareIcon()

                    if (renderMathInElement && typeof renderMathInElement !== 'undefined') {
                        renderMathInElement(document.getElementById('post-content'), katex_config);
                    }

                    if (mermaid && typeof mermaid !== 'undefined') {
                        mermaid.initialize();
                    }
                } catch (e) {
                    console.log("error");
                }
                // 刷新
                han.refreshLazyLoad();
            } else {
                han.initLazyLoad()
            }


        });

        document.addEventListener('pjax:end', function () {

        });

        //Pjax请求失败后触发，请求对象将作为一起传递event.options.request
        document.addEventListener('pjax:error', function () {
            NProgress.done();
            bar('系统出现问题，请手动刷新一次', '3000');
        });
    </script>
</#if>


<script type="text/javascript">
    console.clear();
    console.log("%c 有朋自远方来, 不亦说乎.", "background:#24272A; color:#ffffff", "");
    console.log("%c Github %c", "background:#24272A; color:#ffffff", "", "https://github.com/hshanx");
    console.log("%c 版本号: %c", "background:#24272A; color:#ffffff", "", "1.4.2");
</script>

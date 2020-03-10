<#include "mathjax.ftl">
<#include "mermaid.ftl">

<script src="${static!}/assets/media/scripts/plugins.min.js"></script>
<script src="${static!}/assets/media/scripts/main.min.js"></script>
<#--<script src="https://cdnjs.cloudflare.com/ajax/libs/velocity/1.5.0/velocity.min.js"></script>-->
<script src="https://cdn.jsdelivr.net/npm/velocity-animate@1.5.2/velocity.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/velocity-animate@1.5.2/velocity.ui.min.js"></script>

<#-- 暗夜模式 -->
<#if settings.auto_night_mode!true>
    <script type="text/javascript">
        var nightModeStartTime = ${settings.night_mode_start_time?default('18')};
        var nightModeEndTime = ${settings.night_mode_start_time?default('6')};
    </script>
    <script src="${static!}/assets/media/scripts/night-mode.min.js"></script>
</#if>



<!-- gallery -->
<#if !is_post??>
    <script src="https://cdn.jsdelivr.net/npm/lightgallery@1.6.8/dist/js/lightgallery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/justifiedGallery@3.7.0/dist/js/jquery.justifiedGallery.min.js"></script>
    <script src="${static!}/assets/media/scripts/gallery.js"></script>
</#if>

<!--文章页面使用和相册页面不同的图片预览插件-->
<#if is_post??>
    <script src="//cdnjs.cloudflare.com/ajax/libs/highlight.js/9.18.1/highlight.min.js"></script>
    <script src="//cdn.jsdelivr.net/npm/highlightjs-line-numbers.js@2.7.0/dist/highlightjs-line-numbers.min.js"></script>
    <script src="//cdn.jsdelivr.net/npm/viewerjs@1.5.0/dist/viewer.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/social-share.js/1.0.16/js/social-share.min.js"></script>
    <script type="text/javascript">
        const gallery = new Viewer(document.getElementById('post-content'), {
            toolbar: false,
        });

        hljs.initHighlightingOnLoad();

        hljs.initLineNumbersOnLoad({singleLine: true});
    </script>


    <div class="qr-code-wrap" role="dialog" >
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
</#if>

<#--目录-->
<#if is_post?? && settings.post_toc!true>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/tocbot/4.4.2/tocbot.min.js"></script>
</#if>

<#if is_post??>
    <script type="application/javascript">
        var displayReadProgress = <#if (settings.open_read_progress)??>${settings.open_read_progress?c}<#else>true</#if>;
    </script>
    <script src="${static!}/assets/media/scripts/post.min.js"></script>
    <style>
        /* 阅读进度的进度条颜色 */
        #readProgress .read-progress-bar {
            background: ${settings.progress_color?default('#2474b5')} !important;
            height: 0.1875rem;
        }
    </style>
</#if>


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

<script type="text/javascript">
    console.clear();
    console.log("%c 有朋自远方来, 不亦说乎.", "background:#24272A; color:#ffffff", "");
    console.log("%c Github %c", "background:#24272A; color:#ffffff", "", "https://github.com/hshanx");
    console.log("%c 版本号: %c", "background:#24272A; color:#ffffff", "", "1.4.0.SNAPSHOT");
</script>
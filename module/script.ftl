<script src="${theme_base!}/assets/libs/jquery/jquery.min.js"></script>
<script src="${theme_base!}/dist/main.umd.js"></script>
<script src="${theme_base!}/assets/media/scripts/utils.min.js?ver=202101022020"></script>
<script src="${theme_base!}/assets/media/scripts/plugins.min.js?ver=202101022020"></script>
<script src="${theme_base!}/assets/media/scripts/main.min.js?ver=202101022020"></script>
<script src="${theme_base!}/assets/libs/velocity/velocity.min.js"></script>
<script src="${theme_base!}/assets/libs/velocity/velocity.ui.min.js"></script>

<#if settings.Aplayer?? && settings.Aplayer != ''>
    <script src="${theme_base!}/assets/libs/APlayer/dist/APlayer.min.js"></script>
    <script src="${theme_base!}/assets/libs/meting/Meting.min.js"></script>
</#if>

<#-- 暗夜模式 -->
<#if settings.auto_night_mode!true>
    <script type="text/javascript">
        const nightModeStartTime = ${settings.night_mode_start_time!'18'};
        const nightModeEndTime = ${settings.night_mode_end_time!'6'};
    </script>
    <script src="${theme_base!}/assets/media/scripts/night-mode.min.js?ver=202101022020"></script>
</#if>

<#--<script src="${theme_base!}/assets/media/scripts/post.min.js?ver=202101022022"></script>-->

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

<script>
    han.initLazyLoad();
    // 整个页面延迟加载
    han.lazyLoad();

    // card 延迟加载
    han.lazyLoadCardItem()

    // 菜单高亮
    han.highlightMenu();

    // 小屏幕菜单隐藏
    han.makeMenuInvisible();

    if ($("#page").find('.post-page').length > 0) {
        han.refreshLazyLoad();
    } else {
        han.initLazyLoad()
    }

</script>


<script type="text/javascript">
    console.log("%c Github %c", "background:#24272A; color:#ffffff", "", "https://github.com/hshanx");
    console.log("%c Version: %c", "background:#24272A; color:#ffffff", "", "${theme.version!}");
</script>

<#if !(is_post??)>
    <#include "comment.ftl">
</#if>
<#if is_sheet??>
    <@comment sheet,"sheet" />
</#if>
<footer class="site-footer">
    <div class="inner">
        <#--        社交信息 begin-->
        <div class="offsite-links">
            <#if settings.sina??>
                <a href="${settings.sina!}" target="_blank" class="social-sina" title="sina"><i class="fa fa-weibo"></i></a>
            </#if>
            <#if settings.qq??>
                <a href="//wpa.qq.com/msgrd?v=3&uin=${settings.qq!}&site=qq&menu=yes" target="_blank"
                   title="Initiate chat ?"><i class="fa fa-qq"></i></a>

            </#if>
            <#if settings.github??>
                <a href="${settings.github!}" target="_blank"
                   title="github"><i class="fa fa-github"></i></a>
            </#if>
            <#if settings.zhihu??>
                <a href="${settings.zhihu!}" target="_blank"
                   title="知乎"><i class="fa fa-zhihu"></i></a>
            </#if>
        </div>

        <#--        社交信息 end-->

        <p>
            <@global.footer />
        </p>
        <div class="site-info">
            <#if settings.Icp??>
                <a href="http://beian.miit.gov.cn" target="_blank">${settings.Icp!}</a><br>
            </#if>
            <#if settings.PublicSecurityRecord??>
                <div style="display: inline-block;background-image: url(${static!}/assets/images/beian.png);background-repeat: no-repeat;background-position: top left;background-size: contain;padding-left: 20px;">
                    <a href="http://www.beian.gov.cn" target="_blank">${settings.PublicSecurityRecord!}</a>
                </div><br>
            </#if>
            <#if settings.TimeStatistics??>
                <p>本站运行：<span id="span_dt_dt"></span></p>
            </#if>
            <p>Copyright &copy; ${.now?string('yyyy')}<a
                        href="${context!}"> ${options.blog_title!}<#if settings.SiteSubtitle??> - ${settings.SiteSubtitle!}</#if></a>
            </p>
            <!-- 请尊重作者，请务必保留版权 -->
            <p>Powered by <a target="_blank" href="http://halo.run">Halo</a> •
                Theme by <a target="_blank" href="https://github.com/GalaxySuze/gridea-theme-subtle-galaxy">Subtle
                    Galaxy</a> •
                REFERENCE FROM <a href="https://github.com/hshanx/halo-theme-hshan.git">寒山</a></p>
            <@global.footer />
        </div>
        <div class="site-statistics">
            <@common.statistics />
        </div>
        <a href="#page" class="arrow-up" data-scroll><span class="screen-reader-text">Back to the top</span></a>
    </div>
</footer>
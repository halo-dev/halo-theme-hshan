<#include "comment.ftl">
<#if is_post??>
    <@comment post,"post" />
<#elseif is_sheet??>
    <@comment sheet,"sheet" />
</#if>
<footer class="site-footer">
    <div class="inner">
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
            <p>Copyright &copy; ${.now?string('yyyy')}<a href="${context!}"> ${options.blog_title!}<#if settings.SiteSubtitle??> - ${settings.SiteSubtitle!}</#if></a></p>
            <!-- 请尊重作者，请务必保留版权 -->
            <p>Powered by <a target="_blank" href="http://halo.run">Halo</a> •
                Theme by <a target="_blank" href="https://github.com/GalaxySuze/gridea-theme-subtle-galaxy">Subtle Galaxy</a> •
                REFERENCE FROM <a href="https://github.com/hshanx/halo-theme-hshan.git">寒山</a></p>
            <@global.footer />
        </div>
        <div class="site-statistics">
            <@common.statistics />
        </div>
        <a href="#page" class="arrow-up" data-scroll><span class="screen-reader-text">Back to the top</span></a>
    </div>
</footer>
<#include "module/macro.ftl">
<@layout title="${settings.tags_title!'标签列表'} | ${options.blog_title!}" keywords="${options.seo_keywords!}" description="${options.seo_description!}">
    <body class="tag-template">
    <div id="page" class="site">
        <#include "module/header.ftl">
        <main class="site-main">
            <div class="site-content">
                <header class="cover page-header">
                    <div class="cover-bg"
                            <#if settings.tag_patternimg?? && settings.tag_patternimg!=''>
                                style="background-image: url(${settings.tag_patternimg!});"
                            <#else>
                                style="background-image: linear-gradient( 135deg, #43CBFF 10%, #9708CC 100%);"
                            </#if>
                    >
                    </div>
                    <div class="cover-content">
                        <div class="inner">
                            <div class="post-count"></div>
                            <h1 class="page-title" style="font-size: 46px;">${settings.tags_title!'标签'}</h1>
                        </div>
                    </div>
                </header>

                <div id="post-list" class="post-list inner" style="padding-bottom: 90px;">
                    <div class="tagcloud tag-page">
                        <@tagTag method="list">
                            <#if tags?? && tags?size gt 0>
                                <#list tags as tag>
                                    <a href="${context!}/tags/${tag.slugName}/" class="button">
                                        ${tag.name}
                                        <span aria-hidden="true"><span class="line left"></span><span
                                                    class="line top"></span><span class="line right"></span><span
                                                    class="line bottom"></span></span>
                                    </a>
                                </#list>
                            </#if>
                        </@tagTag>
                    </div>
                </div>
                <#include "module/pagination.ftl">
            </div>
        </main>

        <#include "module/footer.ftl">

    </div>


    </body>
</@layout>

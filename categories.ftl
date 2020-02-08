<#include "module/macro.ftl">
<@layout title="${settings.categories_title!'分类列表'} | ${options.blog_title!}" keywords="${options.seo_keywords!}" description="${options.seo_description!}">
    <body class="category-template">
    <div id="page" class="site">
        <#include "module/header.ftl">
        <main class="site-main">
            <div class="site-content">
                <header class="cover page-header">
                    <div class="cover-bg"
                            <#if settings.tag_patternimg?? && settings.categories_patternimg!=''>
                                style="background-image: url(${settings.categories_patternimg!});"
                            <#else>
                                style="background-image: linear-gradient( 135deg, #43CBFF 10%, #9708CC 100%);"
                            </#if>
                    >
                    </div>
                    <div class="cover-content">
                        <div class="inner">
                            <div class="post-count"></div>
                            <h1 class="page-title" style="font-size: 46px;">${settings.categories_title!'分类列表'}</h1>
                        </div>
                    </div>
                </header>

                <div id="post-list" class="post-list inner" style="padding-bottom: 90px;">
                    <div class="tagcloud tag-page">
                        <@categoryTag method="list">
                            <#if categories?? && categories?size gt 0>
                                <#list categories as category>
                                    <a href="${context!}/tags/${category.slugName}/" class="button">
                                        ${category.name}
                                        <span aria-hidden="true"><span class="line left"></span><span
                                                    class="line top"></span><span class="line right"></span><span
                                                    class="line bottom"></span></span>
                                    </a>
                                </#list>
                            </#if>
                        </@categoryTag>
                    </div>
                </div>
                <#include "module/pagination.ftl">
            </div>
        </main>

        <#include "module/footer.ftl">
    </div>
    </body>
</@layout>

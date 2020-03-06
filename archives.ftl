<#include "module/macro.ftl">
<@layout title="${settings.achieve_title!'归档'} | ${options.blog_title!}" keywords="${options.seo_keywords!}" description="${options.seo_description!}">

    <body class="tag-template">
    <div id="page" class="site">
        <#include "module/header.ftl">
        <main class="site-main">
            <div class="site-content">

                <header class="cover page-header">
                    <#if settings.archives_patternimg?? && settings.archives_patternimg!=''>
                        <div class="cover-bg">
                            <img src="${settings.archives_patternimg!}" alt="${settings.achieve_title!'归档'}">
                        </div>
                    <#else>
                        <div class="default-cover-bg">
                        </div>
                    </#if>
                    <div class="cover-content">
                        <div class="inner">
                            <div class="post-count"></div>
                            <h1 class="page-title" style="font-size: 46px;">${settings.achieve_title!'归档'}</h1>
                        </div>
                    </div>
                </header>

                <@postTag method="archiveMonth">

                <div id="post-list" class="post-list inner" style="padding-top: 30px;margin-bottom: 30px;">
                    <#list archives as archive>
                        <article class="post">
                            <!-- post-header -->
                            <header class="post-header" style="margin-bottom: 0 !important;">
                                <div class="post-header-wrap">
                                    <div class="post-meta">
                                        <time class="published published-txt" style="font-weight: bolder;"
                                              datetime="{archive.year?c}">
                                            ${archive.year?c}年${archive.month!}月
                                        </time>
                                    </div>
                                    <div class="post-title archives-list" style="margin-bottom: 0 !important;">
                                        <#list archive.posts?sort_by("createTime")?reverse as post>
                                            <div class="read-more">
                                                <a class="button" href="${context!}/archives/${post.url!}">
                                                    ${post.createTime?string('MM-dd')} ${post.title!}
                                                    <span aria-hidden="true"></span>
                                                    <span class="line left"></span>
                                                    <span class="line top"></span>
                                                    <span class="line right"></span>
                                                    <span class="line bottom"></span>
                                                </a>
                                            </div>
                                        </#list>
                                    </div>
                                </div>
                            </header>
                        </article>
                    </#list>
                    </@postTag>
                </div>
            </div>
        </main>
        <#include "module/footer.ftl">
    </div>
    </body>
</@layout>

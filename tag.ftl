<#include "module/macro.ftl">
<@layout title="标签：${tag.name} | ${blog_title!}">
    <div id="page" class="site">
        <main class="site-main" id="main">
            <div class="site-content">

                <header class="bg-cover page-header">
                    <#if settings.tag_patternimg?? && settings.tag_patternimg!=''>
                        <div class="cover-bg">
                            <img src="${settings.tag_patternimg!}" alt="标签：${tag.name}">
                        </div>
                    <#else>
                        <div class="default-cover-bg">
                        </div>
                    </#if>
                    <div class="cover-content">
                        <div class="inner">
                            <div class="post-count"></div>
                            <h1 class="page-title" style="font-size: 46px;">${tag.name}</h1>
                        </div>
                    </div>
                </header>

                <!--文章列表-->
                <#if (settings.post_list_style!'standard') == 'standard'>
                    <#include "module/post-list-style/standard.ftl">
                <#elseif settings.post_list_style == 'simple'>
                    <#include "module/post-list-style/simple.ftl">
                <#else>
                    <#include "module/post-list-style/random-card.ftl">
                </#if>

                <#if posts.totalPages gt 1>
                    <@paginationTag method="tagPosts" page="${posts.number}" total="${posts.totalPages}" display="3" slug="${tag.slug!}">
                        <#include "module/pagination.ftl">
                    </@paginationTag>
                </#if>
            </div>
        </main>

    </div>
</@layout>

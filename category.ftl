<#include "module/macro.ftl">
<@layout title="${blog_title!} | 分类：${category.name}">
    <div id="page" class="site">
        <main class="site-main" id="main">
            <div class="site-content">
                <header class="bg-cover page-header">
                    <#if settings.categories_patternimg?? && settings.categories_patternimg!=''>
                        <div class="cover-bg">
                            <img src="${settings.categories_patternimg!}" alt="${blog_title!}">
                        </div>
                    <#else>
                        <div class="default-cover-bg"
                        >
                        </div>
                    </#if>
                    <div class="cover-content">
                        <div class="inner">
                            <div class="post-count"></div>
                            <h1 class="page-title" style="font-size: 46px;">${category.name}</h1>
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
                    <@paginationTag method="categoryPosts" page="${posts.number}" total="${posts.totalPages}" display="3" slug="${category.slug!}">
                        <#include "module/pagination.ftl">
                    </@paginationTag>
                </#if>

            </div>
        </main>
    </div>

</@layout>

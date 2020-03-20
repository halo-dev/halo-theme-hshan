<#include "module/macro.ftl">
<@layout title="${options.blog_title!} | 分类：${category.name}" keywords="${options.seo_keywords!}" description="${options.seo_description!}">
    <div id="page" class="site">

        <main class="site-main"  id="main">
            <div class="site-content">
                <header class="bg-cover page-header">
                    <#if settings.categories_patternimg?? && settings.categories_patternimg!=''>
                        <div class="cover-bg">
                            <img src="${settings.categories_patternimg!}" alt="${options.blog_title!}">
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

                <nav class="pagination">
                    <h2 class="screen-reader-text">Posts Navigation</h2>
                    <div class="inner">
                    <span class="page-number">
                        <a href="${context!}" data-ajax>PAGE ${posts.number + 1} OF ${posts.totalPages!} </a>
                    </span>
                        <#if posts.hasPrevious()>
                            <a data-ajax class="newer-posts arrow-left" href="${context!}/categories/${category.slugName!}/page/${posts.number}"><span
                                        class="screen-reader-text"></span></a>
                        </#if>
                        <#if posts.hasNext()>
                            <a data-ajax class="older-posts arrow-right" href="${context!}/categories/${category.slugName!}/page/${posts.number+2}"><span
                                        class="screen-reader-text"></span></a>
                        </#if>
                    </div>
                </nav>

            </div>
        </main>
    </div>

</@layout>

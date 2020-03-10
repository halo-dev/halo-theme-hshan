<#include "module/macro.ftl">

<@layout title="${keyword!} - 搜索结果 - ${options.blog_title!}" keywords="${options.seo_keywords!}" description="${options.seo_description!}">
    <body class="search-template">
    <div id="page" class="site">

        <#include "module/header.ftl">
        <main class="site-main">
            <div class="site-content">
                <!-- 封面 -->
                <header class="cover page-header">

                    <#if settings.searh_patternimg?? && settings.searh_patternimg!=''>
                        <div class="cover-bg">
                            <img src="${settings.searh_patternimg!}" alt="${keyword!} " />
                        </div>
                    <#else>
                        <div class="default-cover-bg">
                        </div>
                    </#if>
                    <div class="cover-content">
                        <div class="inner">
                            <div class="post-count"></div>
                            <h1 class="page-title" style="font-size: 46px;">关于「${keyword!}」的搜索结果</h1>
                        </div>
                    </div>
                </header>

                <!-- post-list -->
                <#if posts?? && posts.content?size gt 0>
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
							<a href="${context!}/search?keyword=${keyword!}">PAGE ${posts.number + 1} OF ${posts.totalPages!} </a>
						</span>
                            <#if posts.hasPrevious()>
                                <a class="newer-posts arrow-left"
                                   href="${context!}/search/page/${posts.number}?keyword=${keyword!}"><span
                                            class="screen-reader-text"></span></a>
                            </#if>
                            <#if posts.hasNext()>
                                <a class="older-posts arrow-right"
                                   href="${context!}/search/page/${posts.number+2}?keyword=${keyword!}"><span
                                            class="screen-reader-text"></span></a>
                            </#if>
                        </div>
                    </nav>
                <#else>
                    <div id="post-list" class="post-list inner">
                        <div class="search-box">
                            <!-- search start -->
                            <form class="s-search">
                                <i class="fa fa-search" aria-hidden="true"></i>
                                <input class="text-input" type="search" name="keyword" placeholder="Search..."
                                       autocomplete="off" required>
                            </form>
                            <!-- search end -->
                        </div>
                        <#include "module/search-none.ftl" />
                    </div>
                </#if>

            </div>
        </main>
        <#include "module/footer.ftl">
    </div>
    </body>
</@layout>
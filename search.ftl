<#include "module/macro.ftl">
<@layout title="${keyword!} - 搜索结果 - ${blog_title!}">
    <div id="page" class="site">
        <main class="site-main" id="main">
            <div class="site-content">
                <!-- 封面 -->
                <header class="bg-cover page-header">

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
                    <#if posts.totalPages gt 1>
                        <@paginationTag method="search" page="${posts.number}" total="${posts.totalPages}" display="3">
                            <#include "module/pagination.ftl">
                        </@paginationTag>
                    </#if>
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

    </div>
</@layout>
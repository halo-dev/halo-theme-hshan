<#include "module/macro.ftl">
<@layout title="${settings.categories_title!'分类列表'} | ${blog_title!}">
    <div id="page" class="site">
        <main class="site-main"  id="main">
            <div class="site-content">
                <header class="bg-cover page-header">
                    <#if settings.categories_patternimg?? && settings.categories_patternimg!=''>
                        <div class="cover-bg">
                            <img src="${settings.categories_patternimg!}" alt="${settings.categories_title!'分类列表'}">
                        </div>
                    <#else>
                        <div class="default-cover-bg">
                        </div>
                    </#if>
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
                                    <a href="${category.fullPath!}" class="button" data-ajax>
                                        ${category.name}
                                        <span aria-hidden="true">
                                            <span class="line left"></span>
                                            <span class="line top"></span>
                                            <span class="line right"></span>
                                            <span class="line bottom"></span>
                                        </span>
                                    </a>
                                </#list>
                            </#if>
                        </@categoryTag>
                    </div>
                </div>
            </div>
        </main>
    </div>
</@layout>

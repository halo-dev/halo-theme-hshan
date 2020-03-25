<#include "module/macro.ftl">
<@layout title="${settings.tags_title!'标签列表'} | ${blog_title!}">
    <div id="page" class="site">
        <main class="site-main" id="main">
            <div class="site-content">
                <header class="bg-cover page-header">
                    <#if settings.tag_patternimg?? && settings.tag_patternimg!=''>
                        <div class="cover-bg">
                            <img src="${settings.tag_patternimg!}" alt="${settings.tags_title!'标签列表'}">
                        </div>
                    <#else>
                        <div class="default-cover-bg">
                        </div>
                    </#if>
                    <div class="cover-content">
                        <div class="inner">
                            <div class="post-count"></div>
                            <h1 class="page-title" style="font-size: 46px;">${settings.tags_title!'标签'}</h1>
                        </div>
                    </div>
                </header>

                <div id="post-list" class="post-list inner" style="padding-bottom: 50px;">
                    <div class="tagcloud tag-page">
                        <@tagTag method="list">
                            <#if tags?? && tags?size gt 0>
                                <#list tags as tag>
                                    <a href="${tag.fullPath!}" data-ajax class="button">
                                        ${tag.name}
                                        <span aria-hidden="true">
                                            <span class="line left"></span>
                                            <span class="line top"></span>
                                            <span class="line right"></span>
                                            <span class="line bottom"></span>
                                        </span>
                                    </a>
                                </#list>
                            </#if>
                        </@tagTag>
                    </div>
                </div>
            </div>
        </main>
    </div>
</@layout>

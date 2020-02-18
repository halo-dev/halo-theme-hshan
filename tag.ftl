<#include "module/macro.ftl">
<@layout title="标签：${tag.name} | ${options.blog_title!}" keywords="${options.seo_keywords!}" description="${options.seo_description!}">
    <body class="tag-template">
    <div id="page" class="site">

        <#include "module/header.ftl">

        <main class="site-main">
            <div class="site-content">

                <header class="cover page-header">
                    <#if settings.tag_patternimg?? && settings.tag_patternimg!=''>
                        <div class="cover-bg">
                            <img src="${settings.tag_patternimg!}" alt="标签：${tag.name}">
                        </div>
                    <#else>
                        <div class="cover-bg"
                             style="background-image: linear-gradient( 135deg, #43CBFF 10%, #9708CC 100%);">
                        </div>
                    </#if>
                    <div class="cover-content">
                        <div class="inner">
                            <div class="post-count"></div>
                            <h1 class="page-title" style="font-size: 46px;">${tag.name}</h1>
                        </div>
                    </div>
                </header>

                <div id="post-list" class="post-list inner">
                    <#list posts.content as post>
                        <article class="post">
                            <!-- post-header -->
                            <header class="post-header">
                                <div class="post-tags">
                                    <#if post.tags?? && post.tags?size gt 0>
                                        <#list post.tags as tag>
                                            <a href="${context!}/tags/${tag.slugName!}">${tag.name!}&nbsp;&nbsp;</a>
                                        </#list>
                                    </#if>
                                </div>
                                <div class="post-header-wrap">
                                    <h2 class="post-title">
                                        <a href="${context!}/archives/${post.url!}">${post.title!}</a>
                                    </h2>
                                    <div class="post-meta">
                                        <span class="post-author">${post.visits!} 次访问</span>
                                        <time class="published"
                                              datetime="${post.createTime?string("yyyy-MM-dd")}">${post.createTime?string("yyyy-MM-dd")}
                                        </time>
                                        <#if settings.post_summary!false>
                                            <p style="margin-top:10px;">
                                                ${post.summary!}
                                                <#if post.summary?? && post.summary != ''>
                                                    ...
                                                </#if>
                                            </p>
                                        </#if>
                                    </div>
                                </div>
                            </header>
                            <!-- post-content -->
                            <div class="post-content">
                                <div class="read-more">
                                    <a class="button" href="${context!}/archives/${post.url!}">
                                        Read More
                                        <span aria-hidden="true"> </span>
                                        <span class="line left"></span>
                                        <span class="line top"></span>
                                        <span class="line right"></span>
                                        <span class="line bottom"></span>

                                    </a>
                                </div>
                            </div>
                        </article>
                    </#list>
                </div>
                <nav class="pagination">
                    <h2 class="screen-reader-text">Posts Navigation</h2>
                    <div class="inner">
                        <span class="page-number">
                            <a href="${context!}">PAGE ${posts.number + 1} OF ${posts.totalPages!} </a>
                        </span>
                        <#if posts.hasPrevious()>
                            <a class="newer-posts arrow-left" href="${context!}/tags/${tag.name}/page/${posts.number}"><span
                                        class="screen-reader-text"></span></a>
                        </#if>
                        <#if posts.hasNext()>
                            <a class="older-posts arrow-right"
                               href="${context!}/tags/${tag.name}/page/${posts.number+2}"><span
                                        class="screen-reader-text"></span></a>
                        </#if>
                    </div>
                </nav>
            </div>
        </main>

        <#include "module/footer.ftl">
    </div>
    </body>
</@layout>

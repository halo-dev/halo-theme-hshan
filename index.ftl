<#include "module/macro.ftl">
<@layout title="${options.blog_title!}" keywords="${options.seo_keywords!}" description="${options.seo_description!}">
    <body class="home-template">
    <div id="page" class="site">

        <#include "module/header.ftl">

        <main class="site-main">
            <div class="site-content">
                <!-- 封面 -->
                <div class="cover hero">
                    <div class="cover-bg"
                         style="background-image: linear-gradient( 135deg, #EE9AE5 10%, #5961F9 100%);">
                        <img src="${settings.home_cover!'${static}/images/temp.jpg'}">
                    </div>
                    <div class="cover-content">
                        <!-- 封面内容 -->
                        <div class="inner">
                            <h2 class="hero-title">${settings.home_title!options.blog_title!}</h2>
                            <p class="hero-text">${settings.home_description!}</p>
                            <a href="#post-list" class="arrow-down" data-scroll><span
                                        class="screen-reader-text">Scroll Down</span></a>
                        </div>
                    </div>
                </div>

                <!-- post-list -->
                <div id="post-list" class="post-list inner">
                    <#if posts?? && posts.getTotalElements() gt 0>
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
                                            <#if post.topPriority?? && post.topPriority gt 0>
                                                <span class="tag tag-primary">已置顶</span>
                                            </#if>
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
                                            <span aria-hidden="true"></span>
                                            <span class="line left"></span>
                                            <span class="line top"></span>
                                            <span class="line right"></span>
                                            <span class="line bottom"></span>
                                        </a>
                                    </div>
                                </div>
                            </article>
                        </#list>
                    </#if>
                </div>
                <#include "module/pagination.ftl">
            </div>
        </main>
        <#include "module/footer.ftl">
    </div>
    </body>
</@layout>
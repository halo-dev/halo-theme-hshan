<#include "module/macro.ftl">

<@layout title="${keyword!} - 搜索结果 - ${options.blog_title!}" keywords="${options.seo_keywords!}" description="${options.seo_description!}">
    <body class="search-template">
    <div id="page" class="site">

        <#include "module/header.ftl">
        <main class="site-main">
            <div class="site-content">
                <!-- 封面 -->
                <header class="cover page-header">
                    <div class="cover-bg"
                            <#if settings.searh_patternimg?? && settings.searh_patternimg!=''>
                                style="background-image: url(${settings.searh_patternimg!});"
                            <#else>
                                style="background-image: linear-gradient( 135deg, #43CBFF 10%, #9708CC 100%);"
                            </#if>
                    >
                    </div>

                    <div class="cover-content">
                        <div class="inner">
                            <div class="post-count"></div>
                            <h1 class="page-title" style="font-size: 46px;">关于“ ${keyword!} ”的搜索结果</h1>
                        </div>
                    </div>
                </header>

                <!-- post-list -->
                <div id="post-list" class="post-list inner">
                    <#if posts?? && posts.content?size gt 0>
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
                        <div class="search-box">
                            <!-- search start -->
                            <form class="s-search">
                                <i class="fa fa-search" aria-hidden="true"></i>
                                <input class="text-input" type="search" name="keyword" placeholder="Search..." required>
                            </form>
                            <!-- search end -->
                        </div>
                        <#include "module/search-none.ftl" />
                    </#if>
                </div>
            </div>
        </main>
        <#include "module/footer.ftl">
    </div>
    </body>
</@layout>
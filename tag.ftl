<#include "module/macro.ftl">
<@layout title="${options.blog_title!} | 标签：${tag.name}" keywords="${options.seo_keywords!}" description="${options.seo_description!}">
    <body class="tag-template">
    <div id="page" class="site">

        <#include "module/header.ftl">

        <main class="site-main">
            <div class="site-content">

                <header class="cover page-header">
                    <div class="cover-bg"
                         style="background-image: linear-gradient( 135deg, #43CBFF 10%, #9708CC 100%);"></div>
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
                                    <#--                                      <span class="post-author">${user.useName!}</span>-->
                                    <time class="published"
                                          datetime="${post.createTime?string("yyyy-MM-dd")}">${post.createTime?string("yyyy-MM-dd")}
                                    </time>
                                </div>
                            </div>
                        </header>
                        <!-- post-content -->
                        <div class="post-content">
                            <div class="read-more">
                                <a class="button" href="<%= post.link %>">
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

               <#include "module/pagination.ftl">

            </div>
        </main>

        <#include "module/footer.ftl">
    </div>
    </body>
</@layout>

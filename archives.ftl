<#include "module/macro.ftl">
<@layout title="${options.blog_title!} | 归档" keywords="${options.seo_keywords!}" description="${options.seo_description!}">

    <body class="tag-template">
    <div id="page" class="site">

        <#include "module/header.ftl">

        <main class="site-main">
            <div class="site-content">

                <header class="cover page-header">
                    <div class="cover-bg"
                         style="background-image: linear-gradient( 135deg, #EE9AE5 10%, #5961F9 100%);"></div>
                    <div class="cover-content">
                        <div class="inner">
                            <div class="post-count"></div>
                            <h1 class="page-title" style="font-size: 46px;">归档</h1>
                        </div>
                    </div>
                </header>

                <@postTag method="archiveYear">

                <div id="post-list" class="post-list inner">
                    <#list archives as archive>

                    <article class="post">
                        <!-- post-header -->
                        <header class="post-header">
                            <div class="post-header-wrap">
                                <div class="post-meta">
                                    <time class="published published-txt" style="font-weight: bolder; font-size: 1.5em"
                                          datetime="<%- year %>">
                                        ${archive.year?c}
                                    </time>
                                </div>
                                <div class="post-title archives-list">
                                    <#list archive.posts?sort_by("createTime")?reverse as post>
                                        <div class="read-more">
                                            <a class="button" href="${context!}/archives/${post.url!}">
                                                ${post.title!}
                                                <span aria-hidden="true"></span>
                                                <span class="line left"></span>
                                                <span class="line top"></span>
                                                <span class="line right"></span>
                                                <span class="line bottom"></span>
                                            </a>
                                        </div>
                                    </#list>

                                    </#list>
                                </div>
                            </div>
                        </header>
                    </article>
                    </@postTag>


                </div>
            </div>
        </main>

        <#include "module/footer.ftl">

    </div>


    </body>




</@layout>

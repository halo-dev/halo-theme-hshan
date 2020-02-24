<#include "module/macro.ftl">
<@layout title="${post.title!options.blog_title}" keywords="${options.seo_keywords!}" description="${options.seo_description!}">

    <body class="post-template" id="postTemplate">
    <div id="page" class="site">
        <#include "module/header.ftl">
        <div id="readProgress">
            <div class="read-progress-bar" role="progressbar" style="width: 0"></div>
        </div>
        <main class="site-main" id="siteMain">
            <div class="site-content">
                <article class="post tag-getting-started" id="siteContent" itemscope itemtype="http://schema.org/Article">
                    <header class="cover post-header" id="postHeader">
                        <#if post.thumbnail?? && post.thumbnail!=''>
                            <div class="cover-bg">
                                <img src="${post.thumbnail!}" alt="${post.title!}"/>
                            </div>
                        <#else>
                            <div class="cover-bg"
                                 style="background-image: linear-gradient( 135deg, #43CBFF 10%, #9708CC 100%);">
                            </div>
                        </#if>
                        <div class="cover-content">
                            <div class="inner">
                                <div class="post-tags">
                                    <#if post.tags?? && post.tags?size gt 0>
                                        <#list post.tags as tag>
                                            <a href="${context!}/tags/${tag.slugName!}">${tag.name!}
                                                &nbsp;&nbsp;&nbsp;</a>
                                        </#list>
                                    </#if>
                                </div>
                                <h1 class="post-title">${post.title}</h1>
                                <div class="post-meta">
                                <span class="post-meta-wrap">
                                    <img class="author-avatar"
                                         srcset="${user.avatar!}, ${user.avatar!} 2x"
                                         src="${user.avatar!}" alt=""/>
                                    <span class="post-author">${post.visits} 次访问</span>
                                    <time class="published"
                                          datetime="${post.createTime?string("yyyy-MM-dd")}">${post.createTime?string("yyyy-MM-dd")}
                                    </time>
                                </span>
                                    <div>${user.nickname!}</div>
                                </div>
                                <a href="#post-content" class="arrow-down" data-scroll><span
                                            class="screen-reader-text">Scroll Down</span></a>
                            </div>
                        </div>
                    </header>
                    <div class="post-inner">
                        <div class="article-body">
                            <div class="post-content" id="post-content">
                                ${post.formatContent!}
                            </div>
                            <div id="tocFlag"></div>
                            <#if settings.post_toc!true>
                                <aside id="toc" class="toc"></aside>
                            </#if>
                        </div>
                        <div class="article-info" id="articleInfo">
                            <#if settings.QR_code_zfb?? || settings.QR_code_wx??>
                                <div class="appreciate-btn" id="walletInfo">请博主喝咖啡</div>
                            </#if>
                            <div class="article-copyright-info">
                                <p>本文由 <a href="${context!}">${user.nickname!}</a> 创作，如果您觉得本文不错，请随意赞赏<br>采用 <a
                                            href="https://creativecommons.org/licenses/by/4.0/" target="_blank"
                                            rel="external nofollow">知识共享署名4.0</a> 国际许可协议进行许可<br>本站文章除注明转载/出处外，均为本站原创或翻译，转载前请务必署名<br>原文链接：<a
                                            href="${context!}/archives/${post.url!}">${context!}
                                        /archives/${post.url!}</a><br>最后更新于：${post.editTime?string('yyyy-MM-dd HH:mm:ss')}
                                </p>
                            </div>

                            <#include "module/comment.ftl">
                            <#if is_post??>
                                <@comment post,"post" />
                            <#elseif is_sheet??>
                                <@comment sheet,"sheet" />
                            </#if>
                        </div>
                    </div>
                </article>

                <#if settings.post_nepre!true>
                    <nav class="post-navigation" id="post-navigation">
                        <h2 class="screen-reader-text">Post navigation</h2>
                        <div class="nav-links">
                            <#if prePost??>
                                <a href="${context!}/archives/${prePost.url!}" class="nav-previous">
                                    <div class="nav-bg"
                                            <#if !(prePost.thumbnail?? && prePost.thumbnail!='')>
                                                style="background-image: linear-gradient( 135deg, #43CBFF 10%, #9708CC 100%);"
                                            </#if>
                                    >

                                        <img srcset="${prePost.thumbnail!} 300w, ${prePost.thumbnail!} 600w, ${prePost.thumbnail!} 800w, ${prePost.thumbnail!} 1600w, ${prePost.thumbnail!} 2000w"
                                             sizes="(max-width: 800px) 100vw, 50vw" src="${prePost.thumbnail!}" alt=""
                                        />

                                    </div>
                                    <div class="nav-inside">
                                        <span class="nav-before">上一篇</span>
                                        <span class="nav-title">${prePost.title!}</span>
                                        <span class="nav-date"><time class="published"
                                                                     datetime="${prePost.createTime?string("yyyy-MM-dd")}">${prePost.createTime?string("yyyy-MM-dd")}
                                        </time></span>
                                    </div>
                                </a>
                            </#if>
                            <#if nextPost??>
                                <a href="${context!}/archives/${nextPost.url!}" class="nav-next">
                                    <div class="nav-bg"
                                            <#if !(nextPost.thumbnail?? && nextPost.thumbnail!='')>
                                                style="background-image: linear-gradient( 135deg, #43CBFF 10%, #9708CC 100%);"
                                            </#if>
                                    >

                                        <img srcset="${nextPost.thumbnail!} 300w, ${nextPost.thumbnail!} 600w, ${nextPost.thumbnail!} 800w, ${nextPost.thumbnail!} 1600w, ${nextPost.thumbnail!} 2000w"
                                             sizes="(max-width: 800px) 100vw, 50vw" src="${nextPost.thumbnail!}" alt=""
                                        />

                                    </div>
                                    <div class="nav-inside">
                                        <span class="nav-before">下一篇</span>
                                        <span class="nav-title">${nextPost.title!}</span>
                                        <span class="nav-date"><time class="published"
                                                                     datetime="${nextPost.createTime?string("yyyy-MM-dd")}">${nextPost.createTime?string("yyyy-MM-dd")}
                                        </time></span>
                                    </div>
                                </a>
                            </#if>
                        </div>
                    </nav>
                </#if>
            </div>
            <#include "module/footer.ftl">
        </main>
    </div>
    </body>

</@layout>

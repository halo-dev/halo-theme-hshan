<#include "module/macro.ftl">
<@layout title="${options.blog_title!}" keywords="${options.seo_keywords!}" description="${options.seo_description!}">

    <body class="post-template">
    <div id="page" class="site">

        <#include "module/header.ftl">

        <main class="site-main">
            <div class="site-content">
                <article class="post tag-getting-started">
                    <header class="cover post-header">
                        <div class="cover-bg"
                                <#if !(post.thumbnail?? && post.thumbnail!='')>
                                    style="background-image: linear-gradient( 135deg, #43CBFF 10%, #9708CC 100%);"
                                </#if>
                        >
                            <#if (post.thumbnail?? && post.thumbnail!='')>
                                <img srcset="${post.thumbnail} 300w, ${post.thumbnail} 600w, ${post.thumbnail} 800w, ${post.thumbnail} 1600w, ${post.thumbnail} 2000w"
                                     sizes="100vw" src="${post.thumbnail}" alt="${post.title}"/>
                            </#if>
                        </div>
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
                    <div class="inner">
                        <div id="post-content" class="post-content">
                            ${post.formatContent!}
                        </div>
                        <#if settings.post_toc??>
                            <div id="toc" class="toc"></div>
                        </#if>
                        <#if settings.QR_code_zfb?? || settings.QR_code_wx??>
                            <div class="appreciate-btn">请博主喝咖啡</div>
                        </#if>
                        <div class="article-copyright-info">
                            <p>本文由 <a href="${context!}">${user.nickname!}</a> 创作，如果您觉得本文不错，请随意赞赏<br>采用 <a href="https://creativecommons.org/licenses/by/4.0/" target="_blank" rel="external nofollow">知识共享署名4.0</a> 国际许可协议进行许可<br>本站文章除注明转载/出处外，均为本站原创或翻译，转载前请务必署名<br>原文链接：<a href="${context!}/archives/${post.url!}">${context!}/archives/${post.url!}</a><br>最后更新于：${post.editTime?string('yyyy-MM-dd HH:mm:ss')}</p>
                        </div>
                    </div>
                </article>

                <#include "module/comment.ftl">
                <#if is_post??>
                    <@comment post,"post" />
                <#elseif is_sheet??>
                    <@comment sheet,"sheet" />
                </#if>

                <#if settings.post_nepre!true>
                    <nav class="post-navigation">
                        <h2 class="screen-reader-text">Post navigation</h2>
                        <div class="nav-links">
                            <a href="${context!}/archives/${nextPost.url!}" class="nav-previous">
                                <div class="nav-bg"
                                        <#if !(post.thumbnail?? && post.thumbnail!='')>
                                            style="background-image: linear-gradient( 135deg, #43CBFF 10%, #9708CC 100%);"
                                        </#if>
                                >
                                    <#if nextPost??>
                                        <img srcset="${nextPost.thumbnail!} 300w, ${nextPost.thumbnail!} 600w, ${nextPost.thumbnail!} 800w, ${nextPost.thumbnail!} 1600w, ${nextPost.thumbnail!} 2000w"
                                             sizes="(max-width: 800px) 100vw, 50vw" src="${nextPost.thumbnail!}" alt=""
                                        />
                                    </#if>
                                </div>
                                <div class="nav-inside">
                                    <#if nextPost??>
                                        <span class="nav-before">下一篇</span>
                                        <span class="nav-title">${nextPost.title!}</span>
                                        <span class="nav-date"><time class="published"
                                                                     datetime="${nextPost.createTime?string("yyyy-MM-dd")}">${nextPost.createTime?string("yyyy-MM-dd")}
                                        </time></span>
                                    </#if>
                                </div>
                            </a>
                        </div>
                    </nav>
                </#if>
            </div>
        </main>

        <footer class="site-footer">
            <div class="inner">
                <p>
                    <@global.footer />
                </p>
                <div class="site-info">
                    <#if settings.Icp??>
                        <a href="http://beian.miit.gov.cn" target="_blank">${settings.Icp!}</a><br>
                    </#if>
                    <#if settings.PublicSecurityRecord??>
                        <div style="display: inline-block;background-image: url(${static!}/assets/images/beian.png);background-repeat: no-repeat;background-position: top left;background-size: contain;padding-left: 20px;">
                            <a href="http://www.beian.gov.cn" target="_blank">${settings.PublicSecurityRecord!}</a>
                        </div><br>
                    </#if>
                    <#if settings.TimeStatistics??>
                        <p>本站运行：<span id="span_dt_dt"></span></p>
                    </#if>
                    <p>Copyright &copy; ${.now?string('yyyy')}<a href="${context!}"> ${options.blog_title!}<#if settings.SiteSubtitle??> - ${settings.SiteSubtitle!}</#if></a></p>
                    <!-- 请尊重作者，请务必保留版权 -->
                    <p>Powered by <a target="_blank" href="http://halo.run">Halo</a> •
                        Theme by <a target="_blank" href="https://github.com/GalaxySuze/gridea-theme-subtle-galaxy">Subtle Galaxy</a> •
                        REFERENCE FROM <a href="https://github.com/hshanx/halo-theme-hshan.git">寒山</a></p>
                </div>
                <div class="site-statistics">
                    <@common.statistics />
                </div>

                <a href="#page" class="arrow-up" data-scroll><span class="screen-reader-text">Back to the top</span></a>
            </div>
        </footer>

    </div>
    </body>

</@layout>
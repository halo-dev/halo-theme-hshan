<@layout.extends name="module/macro.ftl">
    <@layout.put block="title">${post.title!} - ${blog_title!}</@layout.put>
    <@layout.put block="head">
        <#include "./module/highlightjs/libs-import.ftl" />
        <#include "./module/tocbot/libs-import.ftl" />
        <#include "./module/social-share/libs-import.ftl" />
        <#include "./module/viewer/libs-import.ftl" />
        <#if settings.enabled_katex!true>
            <link rel="stylesheet" href="${theme_base!}/assets/libs/katex/katex.min.css">
        </#if>
    </@layout.put>
    <@layout.put block="content">
        <div id="page" class="site post-template">
            <main class="site-main" id="main">
                <div id="readProgress">
                    <div class="read-progress-bar" role="progressbar" style="width: 0"></div>
                </div>
                <div class="site-content post-page">
                    <article class="post tag-getting-started" id="siteContent">
                        <#--                    <div id="postHeader"></div>-->
                        <header class="bg-cover post-header" id="postHeader">
                            <#if post.thumbnail?? && post.thumbnail!=''>
                                <div class="cover-bg">
                                    <img src="${post.thumbnail!}" alt="${post.title!}"/>
                                </div>
                            <#else>
                                <div class="default-cover-bg">
                                </div>
                            </#if>
                            <div class="cover-content">
                                <div class="inner">
                                    <div class="post-tags">
                                        <#if post.tags?? && post.tags?size gt 0>
                                            <#list post.tags as tag>
                                                <a href="${tag.fullPath!}" data-ajax>${tag.name!}
                                                    &nbsp;&nbsp;&nbsp;</a>
                                            </#list>
                                        </#if>
                                    </div>
                                    <h1 class="post-title js-toc-ignore">${post.title}</h1>
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
                                    <#if settings.enabled_visual_height!true>
                                        <a href="#post-content" class="arrow-down" data-scroll><span
                                                    class="screen-reader-text">Scroll Down</span></a>
                                    </#if>
                                </div>
                            </div>
                        </header>
                        <div class="post-inner">
                            <div class="article-body">
                                <div class="post-content article-content" id="post-content">
                                    ${post.formatContent!}
                                </div>
                                <div id="tocFlag"></div>
                                <#if settings.post_toc!true>
                                    <aside id="toc" class="toc"></aside>
                                </#if>
                            </div>
                            <div class="article-info" id="articleInfo">
                                <div class="extra-info extra-info-center">
                                    <#if settings.QR_code_zfb?? || settings.QR_code_wx??>
                                        <button type="submit"
                                                class="appreciate-btn btn-primary font-bold rounded width-47 height-46 custom-color-solid-bg font-16-to-14"
                                                onclick="">
                                            <img src="${theme_base!}/assets/media/images/cuplogo-sm.png"
                                                 class="right-mrgn-8 support-img" style="height: 16px"/>
                                            <span id="">支持作者</span>
                                        </button>
                                    </#if>
                                    <#if settings.social_share!false>
                                        <button class="btn-primary btn-primary-light font-bold rounded width-47 height-46 custom-color-secondary-bg share-btn "
                                                onclick="">
                                            <span id="">分享</span>
                                        </button>
                                    </#if>
                                </div>
                                <div id="socialShare" class="no-show">
                                    <div class="social-share" data-disabled="${settings.share_disabeld!''}"></div>
                                </div>
                                <div
                                        <#if settings.copyright_clean!true>
                                            class="article-copyright-info simple-copyright-info"
                                        <#else>
                                            class="article-copyright-info full-copyright-info"
                                        </#if>
                                >
                                    <#if settings.copyright_clean!true>
                                        <p>© 本文著作权归作者所有，转载前请务必署名</p>
                                    <#else>
                                        <p>本文由 <a href="${blog_url!}">${user.nickname!}</a> 创作，如果您觉得本文不错，请随意赞赏<br>采用 <a
                                                    href="https://creativecommons.org/licenses/by/4.0/" target="_blank"
                                                    rel="external nofollow">知识共享署名4.0</a> 国际许可协议进行许可<br>本站文章除注明转载/出处外，均为本站原创或翻译，转载前请务必署名<br>原文链接：<a
                                                    href="${post.fullPath!}">${post.fullPath!}</a><br>最后更新于：${post.editTime?string('yyyy-MM-dd HH:mm:ss')}
                                        </p>
                                    </#if>
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
                                <#if prevPost??>
                                    <a href="${prevPost.fullPath!}" data-ajax class="nav-previous">
                                        <#if prevPost.thumbnail?? && prevPost.thumbnail!=''>
                                            <div class="nav-bg ">
                                                <img src="${prevPost.thumbnail!}" alt=""/>
                                            </div>
                                        <#else>
                                            <div class="nav-bg default-cover-bg">
                                            </div>
                                        </#if>
                                        <div class="nav-inside">
                                            <span class="nav-before">上一篇</span>
                                            <span class="nav-title">${prevPost.title!}</span>
                                            <span class="nav-date">
                                                <time class="published"
                                                      datetime="${prevPost.createTime?string("yyyy-MM-dd")}">
                                                    ${prevPost.createTime?string("yyyy-MM-dd")}
                                                </time>
                                            </span>
                                        </div>
                                    </a>
                                </#if>
                                <#if nextPost??>
                                    <a href="${nextPost.fullPath!}" data-ajax class="nav-next">
                                        <#if nextPost.thumbnail?? && nextPost.thumbnail!=''>
                                            <div class="nav-bg ">
                                                <img src="${nextPost.thumbnail!}" alt=""/>
                                            </div>
                                        <#else>
                                            <div class="nav-bg default-cover-bg">
                                            </div>
                                        </#if>
                                        <div class="nav-inside">
                                            <span class="nav-before">下一篇</span>
                                            <span class="nav-title">${nextPost.title!}</span>
                                            <span class="nav-date">
                                                <time class="published"
                                                      datetime="${nextPost.createTime?string("yyyy-MM-dd")}">${nextPost.createTime?string("yyyy-MM-dd")}
                                        </time>
                                            </span>
                                        </div>
                                    </a>
                                </#if>

                            </div>
                        </nav>
                    </#if>
                </div>

            </main>
        </div>
        <div class="qr-code-wrap" role="dialog">
            <div role="document" class="qr-code" style="transform-origin: 201px 294px;">
        <span class="closinglayer">
            <svg viewBox="64 64 896 896" focusable="false" class="" data-icon="close" width="1em"
                 height="1em" fill="currentColor" aria-hidden="true">
                <path d="M563.8 512l262.5-312.9c4.4-5.2.7-13.1-6.1-13.1h-79.8c-4.7 0-9.2 2.1-12.3 5.7L511.6 449.8 295.1 191.7c-3-3.6-7.5-5.7-12.3-5.7H203c-6.8 0-10.5 7.9-6.1 13.1L459.4 512 196.9 824.9A7.95 7.95 0 0 0 203 838h79.8c4.7 0 9.2-2.1 12.3-5.7l216.5-258.1 216.5 258.1c3 3.6 7.5 5.7 12.3 5.7h79.8c6.8 0 10.5-7.9 6.1-13.1L563.8 512z"></path></svg>
        </span>
                <div style="text-align: center;padding: 10px 0;">
                    <#if settings.QR_code_zfb??>
                        <img class="qr_code_zfb" src="${settings.QR_code_zfb!}"/>
                    </#if>
                    <#if settings.QR_code_wx??>
                        <img class="qr_code_wx" src="${settings.QR_code_wx!}"/>
                    </#if>
                </div>
                <#if settings.QR_code_zfb?? && settings.QR_code_wx??>
                    <div class="switch-btn">
                        <span class="zfb-btn">支付宝</span>
                        <span class="wx-btn">微信</span>
                    </div>
                </#if>
            </div>
        </div>
    </@layout.put>
    <@layout.put block="footer">
        <#include "./module/highlightjs/scripts.ftl" />
        <#include "./module/tocbot/scripts.ftl" />
        <#include "./module/social-share/scripts.ftl" />
        <#include "./module/viewer/scripts.ftl" />
        <script>
            $(".qr-code").on("click", function (e) {
                e.stopPropagation();
            });
            $(".closinglayer").on("click", function (e) {
                // $(".qr-code-wrap").hide();
                $(".qr-code-wrap").velocity("transition.expandOut", {duration: 300});
            });
            $(".zfb-btn").on("click", function (e) {
                $(".qr_code_zfb").css("height", "300px");
                $(".qr_code_wx").css("height", "0");
            });
            $(".wx-btn").on("click", function (e) {
                $(".qr_code_wx").css("height", "300px");
                $(".qr_code_zfb").css("height", "0");
            });

            $(".appreciate-btn").on("click", function (e) {
                $(".qr-code-wrap").velocity("transition.expandIn", {duration: 300});
                // $(".qr-code-wrap").show();
                $(document).one("click", function () {
                    // $(".qr-code-wrap").hide();
                    $(".qr-code-wrap").velocity("transition.expandOut", {duration: 300});

                });
                e.stopPropagation();
            });

            function readProgress() {

                const displayReadProgress = <#if (settings.open_read_progress)??>${settings.open_read_progress?c}<#else>true</#if>;

                // 文章内容
                var $content = $("#main");
                // 阅读进度条
                var $readProgressBar = $("#readProgress .read-progress-bar");

                /**
                 * 改变阅读进度条
                 */
                var changeReadProgress = function () {
                    // contentHeight 实际总阅读高度 = 内容的高度 - 窗口的可视高度
                    var contentHeight = $content.height() - window.innerHeight;
                    if (contentHeight <= 0) return;
                    // readHeight 已经阅读的高度 = 当前页面的垂直偏移量 - 内容元素上边的多余部分
                    var readHeight = window.pageYOffset - $content.offset().top;
                    // 进度条的宽度
                    var progressWidth = readHeight / contentHeight * 100 + '%';
                    $readProgressBar.width(progressWidth);
                };

                // 改变阅读进度条
                displayReadProgress && changeReadProgress();

                $(window).on('scroll', function () {
                    // 改变阅读进度条
                    displayReadProgress && changeReadProgress();
                });
            }

            $(function () {
                readProgress()
            })

        </script>
    </@layout.put>
</@layout.extends>
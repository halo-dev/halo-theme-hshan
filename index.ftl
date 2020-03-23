<#include "module/macro.ftl">
<@layout title="${blog_title!}">
    <div id="page" class="site">
        <main class="site-main" id="main">
            <div class="site-content home-content">
                <!-- 封面 -->
                <header class="bg-cover hero">
                    <#if settings.home_cover?? && settings.home_cover!=''>
                        <div class="cover-bg">
                            <img src="${settings.home_cover!}" alt="">
                        </div>
                    <#else>
                        <div class="default-cover-bg">
                        </div>
                    </#if>
                    <div class="cover-content">
                        <!-- 封面内容 -->
                        <div class="inner">
                            <h2 class="hero-title">${settings.home_title!options.blog_title!}</h2>
                            <p class="hero-text">${settings.home_description!}</p>
                            <#if settings.enabled_index_cover_height!true>
                                <a href="#postContainer"  class="arrow-down" data-scroll><span
                                            class="screen-reader-text">Scroll Down</span></a>
                            </#if>
                        </div>
                    </div>
                </header>
                <div id="postContainer">
                    <!-- post-list -->
                    <#if (settings.post_list_style!'standard') == 'standard'>
                        <#include "module/post-list-style/standard.ftl">
                    <#elseif settings.post_list_style == 'simple'>
                        <#include "module/post-list-style/simple.ftl">
                    <#else>
                        <#include "module/post-list-style/random-card.ftl">
                    </#if>
                    <script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
                    <ins class="adsbygoogle"
                         style="display:block"
                         data-ad-format="fluid"
                         data-ad-layout-key="-4m+dc+62-jp+5a"
                         data-ad-client="ca-pub-2144544864492599"
                         data-ad-slot="6914989769"></ins>
                    <script>
                        (adsbygoogle = window.adsbygoogle || []).push({});
                    </script>

                </div>
                <#if posts.totalPages gt 1>
                    <@paginationTag method="index" page="${posts.number}" total="${posts.totalPages}" display="3">
                        <#include "module/pagination.ftl">
                    </@paginationTag>
                </#if>
            </div>
        </main>

    </div>
</@layout>
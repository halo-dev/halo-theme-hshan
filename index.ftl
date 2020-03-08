<#include "module/macro.ftl">
<@layout title="${options.blog_title!}" keywords="${options.seo_keywords!}" description="${options.seo_description!}">
    <body class="home-template">
    <div id="page" class="site">
        <#include "module/header.ftl">
        <main class="site-main">
            <div class="site-content">
                <!-- 封面 -->
                <div class="cover hero">
                    <#if settings.home_cover?? && settings.home_cover!=''>
                        <div class="cover-bg">
                            <img src="${settings.home_cover!}" alt="${settings.home_cover!'首页'}">
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
                            <a href="#post-list" class="arrow-down" data-scroll><span
                                        class="screen-reader-text">Scroll Down</span></a>
                        </div>
                    </div>
                </div>

                <!-- post-list -->
                <#if (settings.post_list_style!'standard') == 'standard'>
                    <#include "module/post-list-style/standard.ftl">
                <#elseif settings.post_list_style == 'simple'>
                    <#include "module/post-list-style/simple.ftl">
                <#else>
                    <#include "module/post-list-style/random-card.ftl">
                </#if>

                <#include "module/pagination.ftl">
            </div>
        </main>
        <#include "module/footer.ftl">
    </div>
    </body>
</@layout>
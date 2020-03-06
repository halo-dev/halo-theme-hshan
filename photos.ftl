<#include "module/macro.ftl">
<@layout title="${settings.photos_title!'相册'} | ${options.blog_title!}" keywords="${options.seo_keywords!}" description="${options.seo_description!}">
    <body class="photo-template">
    <div id="page" class="site">

        <#include "module/header.ftl">

        <main class="site-main">
            <div class="site-content">
                <header class="cover page-header">
                    <#if settings.photos_patternimg?? && settings.photos_patternimg!=''>
                        <div class="cover-bg">
                            <img src="${settings.photos_patternimg!}" alt="${settings.photos_title!'相册'}">
                        </div>
                    <#else>
                        <div class="default-cover-bg"
                        >
                        </div>
                    </#if>
                    <div class="cover-content">
                        <div class="inner">
                            <div class="post-count"></div>
                            <h1 class="page-title" style="font-size: 46px;">${settings.photos_title!'相册'}</h1>
                        </div>
                    </div>
                </header>
                <div class="photos-box article-content" id="post-content">
                    <@photoTag method="listTeams">
                        <#list teams as item>
                            <#if item.team?? && item.team!=''>
                                <h3 style="width: 100%; margin: 10px;">${item.team}</h3>
                            </#if>
                            <div class="justified-gallery">
                                <#list item.photos as photo>
                                    <a class="gallery-item jg-entry entry-visible"
                                       href="${photo.url!}" >
                                        <img  src="${photo.url!}" data-src="${photo.url!}" alt="${photo.name!}"  />
                                        <p class="has-text-centered is-size-6 caption">${photo.name}</p>
                                    </a>
                                </#list>
                            </div>
                        </#list>
                    </@photoTag>

                </div>
            </div>
            <#include "module/footer.ftl">
        </main>
    </div>
    </body>
</@layout>

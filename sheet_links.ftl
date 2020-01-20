<#include "module/macro.ftl">
<@layout title="${sheet.title!} | ${options.blog_title!} " keywords="${options.seo_keywords!}" description="${options.seo_description!}">
    <body class="links-template">
    <div id="page" class="site">

        <#include "module/header.ftl">

        <main class="site-main">
            <div class="site-content">
                <header class="cover page-header">
                    <div class="cover-bg"
                            <#if settings.archives_patternimg?? && settings.links_patternimg!=''>
                                style="background-image: url(${settings.links_patternimg!});"
                            <#else>
                                style="background-image: linear-gradient( 135deg, #43CBFF 10%, #9708CC 100%);"
                            </#if>
                    >
                    </div>
                    <div class="cover-content">
                        <div class="inner">
                            <div class="post-count"></div>
                            <h1 class="page-title" style="font-size: 46px;">${sheet.title!}</h1>
                        </div>
                    </div>
                </header>
                <div class="links-box">
                    <div class="links-items">
                        <@linkTag method="listTeams">
                            <#list teams as item>
                                <#if item.team?? && item.team!=''>
                                    <h3>${item.team}</h3>
                                </#if>
                                <#list item.links as link>
                                    <div class="links-item">
                                        <div class="media">
                                            <div class="media-left">
                                                <figure class="image is-64x64">
                                                    <#if link.logo?? && link.logo != ''>
                                                        <img src="${link.logo}" alt="${link.name}">
                                                    <#else>
                                                        <img src="${static!}/assets/media/images/placeholder.jpg"
                                                             alt="${link.name}">
                                                    </#if>
                                                </figure>
                                            </div>
                                            <div class="media-content">
                                                <p class="link-title">${link.name}</p>
                                                <p class="link-desc">${link.description}</p>
                                            </div>
                                        </div>
                                    </div>
                                </#list>
                            </#list>
                        </@linkTag>
                    </div>
                    <#include "module/footer.ftl">
                </div>
            </div>
        </main>
    </div>
    </body>
</@layout>

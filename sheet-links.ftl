<#include "module/macro.ftl">
<@layout title="${options.blog_title!} | 有朋" keywords="${options.seo_keywords!}" description="${options.seo_description!}">
    <body class="links-template">
    <div id="page" class="site">

        <#include "module/header.ftl">

        <main class="site-main">
            <div class="site-content">
                <header class="cover page-header">
                    <div class="cover-bg"
                         style="background-image:
                                 <#if sheet.thumbnail?? && sheet.thumbnail !=''>
                                         url(${sheet.thumbnail!})
                                     <#else>
                                      linear-gradient( 135deg, #43CBFF 10%, #9708CC 100%);
                                 </#if>
                                "

                    ></div>
                    <div class="cover-content">
                        <div class="inner">
                            <div class="post-count"></div>
                            <h1 class="page-title" style="font-size: 46px;">${sheet.title!}</h1>
                        </div>
                    </div>
                </header>
                <div class="links-box">
                    <div class="page-content links-box">
                        <@linkTag method="listTeams">
                            <#list teams as item>
                                <#if item.team?? && item.team!=''>
                                    <h3>${item.team}</h3>
                                </#if>
                                <ul class="links-box">
                                    <#list item.links as link>
                                        <li><a href="${link.url!}" title="" target="_blank">${link.name!}</a></li>
                                    </#list>
                                </ul>
                            </#list>
                        </@linkTag>
                    </div>
                </div>
            </div>
        </main>
        <#include "module/footer.ftl">
    </div>
    </body>
</@layout>

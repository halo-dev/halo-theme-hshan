<#include "module/macro.ftl">
<@layout title="${options.blog_title!} | ${sheet.title!}" keywords="${options.seo_keywords!}" description="${options.seo_description!}">
    <body class="links-template">
    <div id="page" class="site">

        <#include "module/header.ftl">

        <main class="site-main">
            <div class="site-content">
                <header class="cover page-header">
                    <div class="cover-bg"
                         style="background-image: linear-gradient( 135deg, #43CBFF 10%, #9708CC 100%); url(${sheet.thumbnail!})"></div>
                    <div class="cover-content">
                        <div class="inner">
                            <div class="post-count"></div>
                            <h1 class="page-title" style="font-size: 46px;">${sheet.title!}</h1>
                        </div>
                    </div>
                </header>
                ${sheet.formatContent!}
            </div>
        </main>
        <#include "module/footer.ftl">
    </div>
    </body>

</@layout>

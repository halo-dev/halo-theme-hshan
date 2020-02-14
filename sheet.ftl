<#include "module/macro.ftl">
<@layout title="${sheet.title!} |${options.blog_title!} " keywords="${options.seo_keywords!}" description="${options.seo_description!}">
    <body class="sheet-template">
    <div id="page" class="site">

        <#include "module/header.ftl">

        <main class="site-main">
            <div class="site-content">
                <header class="cover page-header">
                    <#if sheet.thumbnail?? && sheet.thumbnail!=''>
                        <div class="cover-bg">
                            <img src="${sheet.thumbnail!}" alt="${sheet.title!}">
                        </div>
                    <#else>
                        <div class="cover-bg"  style="background-image: linear-gradient( 135deg, #43CBFF 10%, #9708CC 100%);">
                        </div>
                    </#if>
                    <div class="cover-content">
                        <div class="inner">
                            <div class="post-count"></div>
                            <h1 class="page-title" style="font-size: 46px;">${sheet.title!}</h1>
                        </div>
                    </div>
                </header>
                <div class="sheet-content">
                    ${sheet.formatContent!}
                </div>
                <#include "module/footer.ftl">
            </div>
        </main>
    </div>
    </body>

</@layout>

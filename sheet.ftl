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
                        <div class="default-cover-bg">
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
            </div>
            <#include "module/footer.ftl">
        </main>
    </div>
    </body>

</@layout>

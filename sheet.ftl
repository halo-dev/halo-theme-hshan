<#include "module/macro.ftl">
<@layout title="${options.blog_title!} | ${sheet.title!}" keywords="${options.seo_keywords!}" description="${options.seo_description!}">
    <body class="sheet-template">
    <div id="page" class="site">

        <#include "module/header.ftl">

        <main class="site-main">
            <div class="site-content">
                <header class="cover page-header">
                    <div class="cover-bg"
                            <#if !(sheet.thumbnail?? && sheet.thumbnail!='')>
                                style="background-image: linear-gradient( 135deg, #43CBFF 10%, #9708CC 100%);"
                            </#if>
                    >
                        <#if (sheet.thumbnail?? && sheet.thumbnail!='')>
                            <img srcset="${sheet.thumbnail} 300w, ${sheet.thumbnail} 600w, ${sheet.thumbnail} 800w, ${sheet.thumbnail} 1600w, ${sheet.thumbnail} 2000w"
                                 sizes="100vw" src="${sheet.thumbnail}" alt="${sheet.title}"/>
                        </#if>
                    </div>
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
        </main>
        <#include "module/footer.ftl">
    </div>
    </body>

</@layout>

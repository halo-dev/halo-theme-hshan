<#macro layout title,keywords,description>
    <!DOCTYPE html>
    <html lang="zh">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="keywords" content="${keywords!}"/>
        <meta name="description" content="${description!}"/>

        <@global.head />

        <link rel="stylesheet" href="${static!}/assets/styles/main.min.css">
<#--        <link rel="stylesheet" href="//cdn.jsdelivr.net/gh/hshanx/halo-theme-hshan@v1.3.0/assets/styles/main.css">-->
        <link rel="stylesheet" href="${static!}/assets/styles/night-mode.min.css">
        <#--        <link rel="stylesheet" href="//cdn.jsdelivr.net/gh/hshanx/halo-theme-hshan@v1.3.0/assets/styles/_other/night-mode.css">-->
        <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css" type='text/css' media='all'/>
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.2.1/dist/jquery.min.js"></script>

        <style>
            :root {
                --base-color: ${settings.base_color?default('#2474b5')};
                --index-title-color: #555;
                --base-font-color: #34495e;
                /*--summary-color: #555;*/
                --summary-color: #81878f;
                --night-input-color: #a9a9b3;
                --night-background: #292a2d;
                --night-color: #a9a9b3;
                --night-input-backgrround: #232125;
                --color: #333333;
                --background: #f7f7f7;
                --dark-backgound: #232125;
                --cardbgcolor: #fff;
                --cardcolor: #333;
                --cardtitlecolor: #333333;
                --navbarcolor: #333333;
                --navbarbgcolor: rgba(255, 255, 255, 0.7);
                --img-default-filter: none;
                --img-hover-filter: none;
                --btn-bg-color: whitesmoke;
                --btn-color: #333333;
                --btn-hover-color: #eeeeee;
                --link-color: #42b983;
                --link-hover-color: #42b983;
                --code-bg-color: #F1F3F3;
                --code-default-color: #A2A1A1;
                --code-line-numbers-bg-color: #EBEDED;
                --code-line-numbers-color: #888;
                --code-keyworks-color: #7012cc;
                --code-class-color: #f2777a;
                --code-cdata-color: hsl(313, 67%, 36%);
                --code-symbol-color: hsl(33, 83%, 45%);
                --code-variable-color: hsl(281, 89%, 64%);
                --code-regex-color: #e90;
                --code-deleted-color: red;
                --code-toolbar-bg-color: #EBEDED;
                --code-toolbar-color: #1485FE;
                --code-line-numbers-rows-color: #888;
                --toc-dot-color: #1485FE;
                --toc-dot-active-color: #1485FE;
                --toc-dot-active-bg-color: #ebedef;
                --toc-vertical-line-color: #1485FE;
                --toc-item-bg-hover: #1485FE;
                --code-dark-color: #969896;
                --code-dark-bg-color: #2d2d2d;
                --code-dark-line-numbers-bg-color: #333333;
                --code-dark-keywords-color: #cc99cd;
                --code-dark-class-color: #e2777a;
                --code-dark-cdata-color: #999;
                --code-dark-symbol-color: #f8c555;
                --code-dark-variable-color: #67cdcc;

            }
        </style>
        <link rel="stylesheet" href="//cdn.jsdelivr.net/gh/hshanx/halo-theme-hshan@v1.3.0/assets/prism/css/prism.css">
        <link rel="stylesheet alternate" id="codeNight"
              href="//cdn.jsdelivr.net/gh/hshanx/halo-theme-hshan@v1.3.0/assets/prism/css/prism-dark.css">
        <link rel="stylesheet"
              href="//cdn.jsdelivr.net/gh/hshanx/halo-theme-hshan@v1.3.0/assets/prism/css/prism-line-numbers.css">

        <#if settings.Custom_css_src??>
            <!-- 自定义css -->
            <link rel="stylesheet" href="${settings.Custom_css_src!}">
        </#if>
        <#if settings.Custom_css??>
            <!-- 自定义css -->
            <style type="text/css">
                ${settings.Custom_css!}
            </style>
        </#if>

        <#if settings.Custom_js_head??>
            <!-- 自定义js -->
            <script type="text/javascript">
                ${settings.Custom_js_head!}
            </script>
        </#if>

        <title>${title}</title>
    </head>
    <#nested >
    <#include "script.ftl">
    </html>
</#macro>


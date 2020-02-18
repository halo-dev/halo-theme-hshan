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
        <link rel="stylesheet" href="${static!}/assets/styles/main.css">
<#--        <link rel="stylesheet" href="${static!}/assets/styles/all.min.css">-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css"
              type='text/css' media='all'/>
        <link rel="stylesheet" href="${static!}/assets/styles/_other/night-mode.css">
        <link rel="alternate stylesheet" id="codeNight" href="${static!}/assets/styles/_other/highlight-night.css">
        <link rel="stylesheet" id="codeLight" href="${static!}/assets/styles/_other/highlight-light.css">

        <script src="https://cdn.jsdelivr.net/npm/jquery@3.2.1/dist/jquery.min.js"></script>

        <style >
            :root {
                --base-color: ${settings.base_color?default('#2474b5')};
                --index-title-color: #5f6169;
                --base-font-color: #34495e;
                --summary-color: #81878f;
                --night-input-color: #a9a9b3;
                --night-background: #292a2d;
                --night-color: #a9a9b3;
                --night-input-backgrround: #232125;
            }
        </style>

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


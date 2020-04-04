<#macro layout title>
    <!DOCTYPE html>
    <html lang="zh">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="keywords" content="${meta_keywords!}"/>
        <meta name="description" content="${meta_description!}"/>

        <@global.head />

        <link rel="stylesheet" href="${theme_base!}/assets/styles/main.min.css?ver=${.now?long}">
        <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css" type='text/css' media='all'/>

        <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/viewerjs@1.5.0/dist/viewer.min.css">
        <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/social-share.js@1.0.16/dist/css/share.min.css">
        <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/lightgallery@1.6.8/dist/css/lightgallery.min.css">
        <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/justifiedGallery@3.7.0/dist/css/justifiedGallery.min.css">

        <title>${title}</title>

        <script language=javascript>
            <!--
            window.onerror=function(){return true;}
            // -->
        </script>



        <style>
            :root {
                --post-max-width: ${settings.post_max_wdth!'800px'} !important;
                --content-font-size: ${settings.content_font_size!'1.12rem'} !important;
                --content-line-height: ${settings.content_line_height!'2rem'} !important;
                --base-color: ${settings.base_color!'#2474b5'};
                --post-head-color: rgb(219, 219, 226);
                --toc-bg-color: #8e8787;
                --night-toc-bg-color: #e5e5e5;
                --tag-bg-color: #ff5f5f;
                --header-bg-color: #fff;
                --header-child-hover-bg-color: #f5f5f5;
                --index-title-color: #555;
                --base-font-color: #34495e;
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

            <#--向英雄致敬-->
            <#if settings.xiang_ying_xiong_zhi_jing!false>
                html {
                    -webkit-filter: grayscale(100%);
                    -moz-filter: grayscale(100%);
                    -ms-filter: grayscale(100%);
                    -o-filter: grayscale(100%);
                    filter: grayscale(100%);
                    filter: progid:DXImageTransform.Microsoft.BasicImage(grayscale=1);
                }
            </#if>

            <#if settings.custom_scroller!true>
            /*定义滚动条高宽及背景 高宽分别对应横竖滚动条的尺寸*/
            ::-webkit-scrollbar {
                width: 5px;
                height: 5px;
                background-color: #eee;
            }

            #siteHeader::-webkit-scrollbar {
                width: 0;
                opacity: 0;
            }

            /*定义滚动条轨道 内阴影+圆角*/
            ::-webkit-scrollbar-track {
                border-radius: 10px;
                background-color: #eee;
            }

            /*定义滑块 内阴影+圆角*/
            ::-webkit-scrollbar-thumb {
                border-radius: 10px;
                background-color: ${settings.base_color?default('#2474b5')};
            }

            </#if>

            <#if settings.enabled_visual_height!true>
            @media only screen and (min-width: 861px) {
                .post-template .bg-cover {
                    height: 100vh !important;
                }
            }

            </#if>

            <#if settings.enabled_index_cover_height!true>
            @media only screen and (min-width: 861px) {
                .home-content .bg-cover {
                    height: 100vh !important;
                }
            }

            </#if>

        </style>
        <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/highlight.js@9.12.0/styles/atom-one-light.css">
<#--        <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/loaders.css@0.1.2/loaders.min.css">-->
        <#if settings.Aplayer?? && settings.Aplayer != ''>
            <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/aplayer@1.10.1/dist/APlayer.min.css">
        </#if>
        <#if settings.enabled_mathjax!true>
            <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/katex@0.11.1/dist/katex.min.css" >
        </#if>
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

    </head>
    <body>
    <#include "header.ftl">

    <#nested >

    <#include "footer.ftl">
    </body>
    <script src="//cdn.jsdelivr.net/npm/jquery@3.2.1/dist/jquery.min.js"></script>
    <script src="${theme_base!}/assets/media/scripts/utils.min.js?ver=${.now?long}"></script>
    <#include "script.ftl">
    </html>
</#macro>


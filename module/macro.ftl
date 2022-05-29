<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="keywords" content="${meta_keywords!}"/>
    <meta name="description" content="${meta_description!}"/>

    <@global.head />

    <link rel="stylesheet" href="${theme_base!}/dist/style.css?v=${theme.version!}">
    <link rel="stylesheet" href="${theme_base!}/assets/libs/font-awesome/css/font-awesome.min.css" type='text/css'
          media='all'/>

    <title><@layout.block name="title"></@layout.block></title>

    <#include "./style.ftl" />

    <#if settings.Aplayer?? && settings.Aplayer != ''>
        <link rel="stylesheet" href="${theme_base!}/assets/libs/APlayer/dist/APlayer.min.css">
    </#if>
    <@layout.block name="head"></@layout.block>
</head>
<body>
<#include "header.ftl">

<@layout.block name="content"></@layout.block>

<#include "footer.ftl">
</body>
<#include "script.ftl">
<@layout.block name="footer"></@layout.block>
</html>


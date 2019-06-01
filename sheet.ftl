<#include "module/macro.ftl">
<@layout title="${options.blog_title!} | ${sheet.title!}" keywords="${options.seo_keywords!}" description="${options.seo_description!}">
    <h1>${sheet.title!}</h1>
    ${sheet.formatContent!}

    <#include "module/comment.ftl">
    <@comment post=sheet type="sheet" />
</@layout>

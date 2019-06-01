<#include "module/macro.ftl">
<@layout title="${options.blog_title!} | ${post.title!}" keywords="${options.seo_keywords!}" description="${options.seo_description!}">
    <h1>${post.title!}</h1>
    ${post.formatContent!}

    <#include "module/comment.ftl">
    <@comment post=post type="post" />
</@layout>

<#include "module/macro.ftl">
<@layout title="${options.blog_title!} | 分类：${category.name}" keywords="${options.seo_keywords!}" description="${options.seo_description!}">
    <h1>分类：${category.name}</h1>
    <ul>
        <#list posts.content as post>
            <li>
                <a href="/archives/${post.url}">${post.title}</a>
            </li>
        </#list>
    </ul>
</@layout>

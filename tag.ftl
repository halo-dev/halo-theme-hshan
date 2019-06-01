<#include "module/macro.ftl">
<@layout title="${options.blog_title!} | 标签：${tag.name}" keywords="${options.seo_keywords!}" description="${options.seo_description!}">
    <h1>标签：${tag.name}</h1>
    <ul>
        <#list posts.content as post>
            <li>
                <a href="/archives/${post.url}">${post.title}</a>
            </li>
        </#list>
    </ul>
</@layout>

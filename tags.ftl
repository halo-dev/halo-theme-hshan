<#include "module/macro.ftl">
<@layout title="${options.blog_title!} | 标签列表" keywords="${options.seo_keywords!}" description="${options.seo_description!}">
    <h1>标签列表</h1>
    <ul>
        <@tagTag method="list">
            <#if tags?? && tags?size gt 0>
                <#list tags as tag>
                    <li><a href="${context!}/tags/${tag.slugName}/">${tag.name}</a></li>
                </#list>
            </#if>
        </@tagTag>
    </ul>
</@layout>

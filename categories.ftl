<#include "module/macro.ftl">
<@layout title="${options.blog_title!} | 分类列表" keywords="${options.seo_keywords!}" description="${options.seo_description!}">
    <h1>分类列表</h1>
    <ul>
        <@categoryTag method="list">
            <#if categories?? && categories?size gt 0>
                <#list categories as category>
                    <li><a href="${context!}/categories/${category.slugName}/">${category.name}</a></li>
                </#list>
            </#if>
        </@categoryTag>
    </ul>
</@layout>

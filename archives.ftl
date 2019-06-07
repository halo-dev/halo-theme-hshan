<#include "module/macro.ftl">
<@layout title="${options.blog_title!} | 归档" keywords="${options.seo_keywords!}" description="${options.seo_description!}">
    <h1>归档</h1>
    <ul>
        <#--
            详情请参考：https://halo.run/develop/theme.html#%E6%A0%B9%E6%8D%AE%E5%B9%B4%E4%BB%BD%E5%BD%92%E6%A1%A3
         -->
        <@postTag method="archiveYear">
            <#list archives as archive>
                <li>
                <h2>${archive.year?c}</h2>
                <#list archive.posts?sort_by("createTime")?reverse as post>
                    <a href="${context!}/archives/${post.url!}">${post.title!}</a>
                </#list>
                </li>
            </#list>
        </@postTag>
    </ul>
</@layout>

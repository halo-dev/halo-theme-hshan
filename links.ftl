<#include "module/macro.ftl">
<@layout title="${settings.links_title!'友链'} | ${blog_title!}">
    <div id="page" class="site ">
        <main class="site-main"  id="main">
            <div class="site-content">
                <header class="bg-cover page-header">
                    <#if settings.links_patternimg?? && settings.links_patternimg!=''>
                        <div class="cover-bg">
                            <img src="${settings.links_patternimg!}" alt="${settings.links_title!'友链'}">
                        </div>
                    <#else>
                        <div class="default-cover-bg">
                        </div>
                    </#if>
                    <div class="cover-content">
                        <div class="inner">
                            <div class="post-count"></div>
                            <h1 class="page-title" style="font-size: 46px;">${settings.links_title!'友链'}</h1>
                        </div>
                    </div>
                </header>
                <div class="links-box">
                    <div class="links-items">
                        <@linkTag method="listTeams">
                            <#list teams as item>
                                <#if item.team?? && item.team!=''>
                                    <h3 style="width: 100%; margin: 10px;">${item.team}</h3>
                                </#if>

                                <#list item.links?sort_by('priority')?reverse  as link>
                                    <a class="links-item card-item-vel" style="display: block;" href="${link.url}" target="_blank" onfocus="this.blur();">
                                        <div class="media">
                                            <div class="media-left">
                                                <figure class="image is-64x64">
                                                    <#if link.logo?? && link.logo != ''>
                                                        <img src="${link.logo}" alt="${link.name}">
                                                    <#elseif settings.links_placeholder?? && settings.links_placeholder != ''>
                                                        <img src="${settings.links_placeholder}"
                                                             alt="${link.name}">
                                                    <#else>
                                                        <img src="https://cdn.jsdelivr.net/gh/hshanx/static@v1.0.1/placeholder.jpg"
                                                             alt="${link.name}">
                                                    </#if>
                                                </figure>
                                            </div>
                                            <div class="media-content">
                                                <p class="link-title">${link.name}</p>
                                                <p class="link-desc">${link.description}</p>
                                            </div>
                                        </div>
                                    </a>
                                </#list>
                            </#list>
                        </@linkTag>
                    </div>
                </div>
            </div>

        </main>
    </div>
</@layout>

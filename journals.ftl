<#include "module/macro.ftl">
<@layout title="${settings.jounarls_title!} | ${options.blog_title!}" keywords="${options.seo_keywords!}" description="${options.seo_description!}">
    <body class="links-template">
    <div id="page" class="site">

        <#include "module/header.ftl">
        <main class="site-main">
            <div class="site-content">
                <header class="cover page-header">
                    <div class="cover-bg"
                            <#if settings.journals_patternimg?? && settings.journals_patternimg!=''>
                                style="background-image: url(${settings.journals_patternimg!});"
                            <#else>
                                style="background-image: linear-gradient( 135deg, #43CBFF 10%, #9708CC 100%);"
                            </#if>
                    >
                    </div>
                    <div class="cover-content">
                        <div class="inner">
                            <div class="post-count"></div>
                            <h1 class="page-title" style="font-size: 46px;">${settings.jounarls_title!} </h1>
                        </div>
                    </div>
                </header>
                <div id="tree-hole">
                    <ol class="comment-list">
                        <#list journals.content as journal>
                            <li id="li-comment-611" class="tree-hole-body tree-hole-<#if (journal_index % 2)==0>odd<#else>even</#if>">
                                <div id="comment-611">
                                    <img class="avatar" src="${user.avatar!}" alt="${user.nickname!}" width="40" height="40">
                                    <div class="tree-hole-box">
                                        <div class="tree-hole-author">
                                            <a href="${context!}" rel="external nofollow">${user.nickname}</a> ${journal.createTime?string('yyyy年MM月dd日')}
                                        </div>
                                        <p>${journal.content!}</p>
                                    </div>
                                </div>
                            </li>
                        </#list>
                    </ol>
                    <div class="tree-hole-go">
                        <span class="tree-hole-go-aircraft"><i class="fa fa-paper-plane fa-lg"></i></span><br>
                        <#--				<span>GO!!!</span>-->
                    </div>
                    <div class="comment-page">
                        <#if journals.totalPages gt 1>
                            <ol class="page-navigator">
                                <#if journals.hasPrevious()>
                                    <#if journals.number == 1>
                                        <li class="prev">
                                            <a href="${context!}/journals"><i class="fa fa-angle-left fa-lg"></i></a>
                                        </li>
                                    <#else>
                                        <li class="prev">
                                            <a href="${context!}/journals/page/${journals.number}"><i class="fa fa-angle-left fa-lg"></i></a>
                                        </li>
                                    </#if>
                                </#if>
                                <#list rainbow as r>
                                    <#if r == journals.number+1>
                                        <li class="current"><a href="${context!}/journals/page/${journals.number+1}">${journals.number+1}</a></li>
                                    <#else>
                                        <li><a href="${context!}/journals/page/${r}">${r}</a></li>
                                    </#if>
                                </#list>
                                <#if journals.hasNext()>
                                    <li class="next">
                                        <a href="${context!}/journals/page/${journals.number+2}"><i class="fa fa-angle-right fa-lg"></i></a>
                                    </li>
                                </#if>
                            </ol>
                        </#if>
                    </div>
                </div>
            </div>
        </main>
        <#include "module/footer.ftl">
    </div>
    </body>
</@layout>
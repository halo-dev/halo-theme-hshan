<aside class="sidebar" id="sidebar">
    <div class="inner">
        <div class="widget-area">
            <!-- 菜单 -->
            <nav class="site-navigation">
                <h2>${options.blog_title!}</h2>
                <ul class="menu">
                    <#if settings.top_search!true>
                        <li class="menu-item home current-menu-item">
                            <i class="fa fa-search js-toggle-search iconsearch" aria-hidden="true"
                               style="color:#cd9023; font-size: 20px;"></i>
                        </li>
                    </#if>
                    <@menuTag method="tree">
                        <#list menus?sort_by('priority') as menu>
                            <li class="menu-item home current-menu-item">
                                <a href="${menu.url!}" target="${menu.target!}">${menu.name}</a>
                            </li>
                        </#list>
                    </@menuTag>
                </ul>
            </nav>
        </div>
    </div>
</aside>

<header class="site-header" id="siteHeader">
    <div id="scrollMenu" style="display: none;" class="scroll-menu header-inner">
        <div class="menu-items">
            <#if settings.header_logoimg?? && settings.header_logoimg!=''>
                <a href="${context!}" style="margin-right: 0; display: inline-block;height: 100%; line-height: 52px;">
                    <img src="${settings.header_logoimg}" alt="${options.blog_title!}"
                            <#if settings.header_logo_height?? && settings.header_logo_height != ''>
                                style=" height: ${settings.header_logo_height} "
                            </#if>
                    />

                </a>
            </#if>
            <@menuTag method="tree">
                <#list menus?sort_by('priority') as menu>
                    <a href="${menu.url!}" target="${menu.target!}">${menu.name}</a>
                </#list>
            </@menuTag>
        </div>
        <div class="other-ctl" id="headerCtrl">
            <#if settings.top_search!true>
               <i class="fa fa-search js-toggle-search iconsearch" aria-hidden="true"></i>
            </#if>
            <#if settings.night_mode!true>
                <i class="fa " id="nightMode" aria-hidden="true"></i>
            </#if>
        </div>
    </div>
    <a class="sidebar-toggle" id="sidebarToggle">
        <span class='icon-menu cross'>
            <span class='middle' aria-hidden="true"> </span>
         </span>
    </a>
</header>

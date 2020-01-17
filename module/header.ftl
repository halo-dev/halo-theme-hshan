<header class="site-header">
    <h1 class="site-title"><a href="${context!}">${title!}</a></h1>
    <a class="sidebar-toggle"><span class="screen-reader-text">Menu</span><span class="icon" aria-hidden="true"></span></a>
</header>

<aside class="sidebar">
    <div class="sidebar-scrollable">
        <div class="inner">
            <div class="widget-area">
                <!-- 菜单 -->
                <nav class="site-navigation">
                    <h2>${options.blog_title!}</h2>
                    <ul class="menu">
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
            <a class="sidebar-toggle"><span class="screen-reader-text">Close</span><span class="icon" aria-hidden="true"></span></a>
        </div>
    </div>
</aside>

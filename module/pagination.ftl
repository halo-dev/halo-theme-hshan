<nav class="pagination">
    <h2 class="screen-reader-text">Posts Navigation</h2>
    <div class="inner">
        <span class="page-number"></span>
        <#if posts.hasPrevious()>
            <#if posts.number == 1>
                <a href="${context!}/"><i class="iconfont">&#xe679;</i></a>
            <#else>
                <a href="${context!}/page/${posts.number}"><i class="iconfont">&#xe679;</i></a>
                <a class="newer-posts arrow-left" href="${context!}/page/${posts.number}"><span
                            class="screen-reader-text"></span></a>
            </#if>
        </#if>
        <#if posts.hasNext()>
            <a class="older-posts arrow-right" href="${context!}/page/${posts.number+2}"><span
                        class="screen-reader-text"></span></a>
        </#if>
    </div>
</nav>

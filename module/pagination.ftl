<nav class="pagination">
    <h2 class="screen-reader-text">Posts Navigation</h2>
    <div class="inner">
        <span class="page-number">
            <a href="${context!}">PAGE ${posts.number + 1} OF ${posts.totalPages!} </a>
        </span>
        <#if posts.hasPrevious()>
            <a class="newer-posts arrow-left" href="${context!}/page/${posts.number}"><span
                        class="screen-reader-text"></span></a>
        </#if>
        <#if posts.hasNext()>
            <a class="older-posts arrow-right" href="${context!}/page/${posts.number+2}"><span
                        class="screen-reader-text"></span></a>
        </#if>
    </div>
</nav>

<nav class="pagination" id="pagination">
    <h2 class="screen-reader-text">Posts Navigation</h2>
    <div class="inner">
        <#if posts.hasPrevious()>
            <a class="newer-posts arrow-left" href="${context!}/page/${posts.number}" data-scroll data-ajax><span
                        class="screen-reader-text"></span></a>
        </#if>
        <span class="page-number">
            <a href="${context!}" data-scroll data-ajax>PAGE ${posts.number + 1} OF ${posts.totalPages!} </a>
        </span>
        <#if posts.hasNext()>
            <a class="older-posts arrow-right" href="${context!}/page/${posts.number+2}" data-ajax data-scroll><span
                        class="screen-reader-text"></span></a>
        </#if>
    </div>
</nav>

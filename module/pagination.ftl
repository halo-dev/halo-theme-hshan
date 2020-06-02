<nav class="pagination" id="pagination">
    <h2 class="screen-reader-text">Posts Navigation</h2>
    <div class="inner">
        <#if pagination.hasPrev>
            <a class="newer-posts arrow-left" href="${pagination.prevPageFullPath!}" data-scroll data-ajax>
                <span class="screen-reader-text"></span>
            </a>
        </#if>
        <#list pagination.rainbowPages as number>
            <#if number.isCurrent>
                <span class="page-number">
                    <a href="${number.fullPath!}" data-scroll data-ajax>PAGE ${number.page!} OF ${posts.totalPages!} </a>
                </span>
            </#if>
        </#list>
        <#if pagination.hasNext>
            <a class="older-posts arrow-right" href="${pagination.nextPageFullPath!}" data-ajax data-scroll>
                <span class="screen-reader-text"></span>
            </a>
        </#if>
    </div>
</nav>


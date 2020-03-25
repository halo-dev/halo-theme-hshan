<div id="post-list" class="post-list inner">
    <#if posts?? && posts.getTotalElements() gt 0>
        <#list posts.content as post>
            <article class="post postItem card-item-vel post-standard-block">
                <!-- post-header -->
                <header class="post-header">
                    <div class="post-tags">
                        <#if post.tags?? && post.tags?size gt 0>
                            <#list post.tags as tag>
                                <a href="${tag.fullPath!}" data-ajax>${tag.name!}&nbsp;&nbsp;</a>
                            </#list>
                        </#if>
                    </div>
                    <div class="post-header-wrap">
                        <h2 class="post-title">
                            <a href="${post.fullPath!}" data-ajax>${post.title!}</a>
                        </h2>
                        <div class="post-meta">
                            <span class="post-author"><i class="fa fa-eye"></i> ${post.visits!} 次访问</span>
                            <#if is_index?? && post.topPriority?? && post.topPriority gt 0>
                                <span class="tag tag-primary">已置顶</span>
                            </#if>
                            <time class="published"
                                  datetime="${post.createTime?string("yyyy-MM-dd")}">${post.createTime?string("yyyy-MM-dd")}
                            </time>
                            <#if settings.post_summary!false>
                                <p class="post-item-summary">
                                    ${post.summary!}
                                </p>
                            </#if>
                        </div>
                    </div>
                </header>
                <!-- post-content -->
                <div class="post-content">
                    <div class="read-more">
                        <a class="button" href="${post.fullPath!}" data-ajax>
                            Read More
                            <span aria-hidden="true"></span>
                            <span class="line left"></span>
                            <span class="line top"></span>
                            <span class="line right"></span>
                            <span class="line bottom"></span>
                        </a>
                    </div>
                </div>
            </article>
        </#list>
    </#if>
</div>

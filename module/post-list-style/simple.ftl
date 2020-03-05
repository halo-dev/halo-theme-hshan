<div id="post-list" class="post-list inner">
    <#if posts?? && posts.getTotalElements() gt 0>
        <#list posts.content as post>
            <article class="post-item">
                <div class="padding-left">
                    <h2 class="post-item-title">
                        <a href="${context!}/archives/${post.url!}">${post.title!}
                            <#if post.topPriority?? && post.topPriority gt 0>
                                <span>🔥</span>
                            </#if>
                        </a>
                    </h2>
                    <p class="post-item-summary">
                        ${post.summary!}
                    </p>
                    <p class="post-item-info">
                        <time class="published"
                              datetime="${post.createTime?string("yyyy-MM-dd")}">发布于
                            · ${post.createTime?string("yyyy-MM-dd")} ·
                        </time>
                        <span class="post-item-tags">
                        <#if post.tags?? && post.tags?size gt 0>
                            <#list post.tags as tag>
                                <a href="${context!}/tags/${tag.slugName!}"> #${tag.name!}&nbsp;&nbsp;</a>
                            </#list>
                        </#if>
                    </span>
                    </p>
                </div>

                <#if post.thumbnail?? && post.thumbnail!=''>
                    <a href="${context!}/archives/${post.url!}" class="post-feature-image"
                       style="background-image: url(${post.thumbnail!})">
                    </a>
                </#if>
            </article>
        </#list>
    </#if>
</div>
<div class="grid-container module-wrapper enable-masonry aos-init aos-animate" data-aos="fade-up">
    <div class="content-wrapper grid-posts content articles" id="post-list">
        <#if posts?? && posts.getTotalElements() gt 0>
            <#list posts.content as post>
                <article
                        class="default post-item grid-33 tablet-grid-50 mobile-grid-100 np-mobile post type-post status-publish format-standard has-post-thumbnail hentry">
                    <div class="article-wrapper">
                        <header>
                            <div class="post-format-image post-format-wrapper">
                                <div class="featured-image">
                                    <#if post.thumbnail?? && post.thumbnail!=''>
                                        <span href="background-image: url(${post.thumbnail!''});"
                                              class="thumb hover-effect">
                                            <span class="fullimage cover" role="img" aria-label=""
                                                  style="background-image: url(${post.thumbnail!''});"></span>
                                        </span>
                                    <#else>
                                        <span class="thumb hover-effect">
                                            <span class="fullimage default-cover-bg" role="img" aria-label=""></span>
                                        </span>
                                    </#if>
                                    <#if post.tags?? && post.tags?size gt 0>
                                        <div class="tags absolute">
                                            <a href="${context!}/tags/${post.tags[0].slugName!}"
                                               class="ctag ctag-6 ctag-gridea">${post.tags[0].name!}</a>
                                        </div>
                                    </#if>
                                </div>
                            </div>
                            <div class="meta">
                                <time datetime="${post.createTime?string("yyyy-MM-dd")}"><i
                                            class="fa fa-pencil"></i>
                                    <span class="lately">${post.createTime?string("yyyy-MM-dd")}</span></time>
                            </div>

                            <h1 class="title main-title gradient-effect"><a
                                        href="${context!}/archives/${post.url!}">${post.title!}</a>
                            </h1>
                        </header>

                        <div class="post-excerpt">
                            ${post.summary!}
                        </div>

                        <footer class="author-meta">
                            <a href="" class="author" title="">
                                    <span class="author-image cover"
                                          style="background-image: url(${user.avatar!});"></span>
                                <span class="author-name">${user.nickname!}</span>
                            </a>
                            <div>
                            <span class="visitors-count">
                                ${post.visits!} <i class="fa fa-fire"></i>
                            </span>
                                <span class="visitors-comment" style="margin-left: 10px;">
                                    ${post.commentCount} <i class="fa fa-comment-o"></i>
                                </span>
                            </div>
                        </footer>
                    </div>
                </article>
            </#list>
        </#if>
    </div>
</div>
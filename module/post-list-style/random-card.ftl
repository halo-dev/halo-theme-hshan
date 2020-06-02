<div class="post-container" data-aos="fade-up">
    <div class="content-wrapper articles" id="post-list" <#if posts?? && posts.getTotalElements() lt 3>style="justify-content: space-around; !important;"</#if>>
        <#if posts?? && posts.getTotalElements() gt 0>
            <#list posts.content as post>
                <article
                        class="post-item grid-32 grid-48 mobile-grid-100 post card postItem mrg-bottom-90 card-item-vel">
                    <div class="article-wrapper card-shadow">
                        <header>
                            <div class="post-format-image post-format-wrapper">
                                <div class="featured-image">
                                    <#if post.thumbnail?? && post.thumbnail!=''>
                                        <a data-ajax href="${post.fullPath!}"
                                        style=" background-image: url(${post.thumbnail!''});
                                        background-repeat: no-repeat!important;
                                        background-position: center center!important;
                                        background-size: cover!important;"
                                              class="thumb hover-effect">
                                            <span class="fullimage cover" role="img" aria-label=""
                                                  style="background-image: url(${post.thumbnail!''});"></span>
                                        </a>
                                    <#elseif settings.card_random_cover!false>
                                        <a data-ajax href="${post.fullPath!}" class="thumb hover-effect">
                                            <#assign x = "${settings.card_random_cover_img_num?number}" />
                                            <#assign thumbnailIndex ="${post_index % (x?number)}"/>
                                                 <span class="fullimage cover" role="img" aria-label=""
                                                       style="background-image: url(${blog_url!}/thumbnail/thumbnail-${thumbnailIndex?number?abs}.${settings.card_random_cover_img_suffix});"></span>
                                            </a>
                                    <#else>
                                        <a data-ajax href="${post.fullPath!}" class="thumb hover-effect">
                                            <span class="fullimage default-cover-bg" role="img" aria-label=""></span>
                                        </a>
                                    </#if>
                                    <#if post.tags?? && post.tags?size gt 0>
                                        <div class="tags absolute">
                                            <a data-ajax href="${post.tags[0].fullPath!}" class="ctag ctag-6 ctag-gridea">
                                                ${post.tags[0].name!}
                                            </a>
                                        </div>
                                    </#if>
                                </div>
                            </div>
                            <div class="meta">
                                <time datetime="${post.createTime?string("yyyy-MM-dd")}">
                                    <i class="fa fa-pencil"></i>
                                    <span class="lately">${post.createTime?string("yyyy-MM-dd")}</span>
                                </time>
                            </div>

                            <h1 class="title main-title gradient-effect" >
                                <a href="${post.fullPath!}" data-ajax>${post.title!}</a>
                            </h1>
                        </header>

                        <div class="post-excerpt">
                            ${post.summary!}
                        </div>

                        <footer class="author-meta">
                            <a href="" class="author" title="" data-ajax>
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

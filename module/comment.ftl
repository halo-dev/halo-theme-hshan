<#macro comment post,type>
    <#if !post.disallowComment!false>
        <script src="//cdn.jsdelivr.net/npm/vue@2.6.10/dist/vue.min.js"></script>
        <script src="${options.comment_internal_plugin_js!'//cdn.jsdelivr.net/gh/halo-dev/halo-comment@latest/dist/halo-comment.min.js'}"></script>
        <section class="comments-area">
            <div class="inner">
                <halo-comment id="${post.id}" type="${type}"/>
            </div>
        </section>
    </#if>
</#macro>
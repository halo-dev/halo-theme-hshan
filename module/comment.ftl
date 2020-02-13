<#macro comment target,type>
    <#if !post.disallowComment!false>
        <script src="${static!}/assets/media/scripts/vue.min.js"></script>
        <#if settings.auto_night_mode>
            <script src="${static!}/assets/media/scripts/halo-comment.min.js"></script>
        <#else>
            <script src="${options.comment_internal_plugin_js!'//cdn.jsdelivr.net/npm/halo-comment-normal@1.1.1/dist/halo-comment.min.js'}"></script>
        </#if>
        <section class="comments-area">
            <div class="inner">
                <div id="nightModeComment" style="display: none">
                    <halo-comment id="${target.id?c}" type="${type}" dark-mode="true" />
                </div>
                <div id="lightModeComment">
                    <halo-comment id="${target.id?c}" type="${type}" />
                </div>
            </div>
        </section>

    </#if>
</#macro>
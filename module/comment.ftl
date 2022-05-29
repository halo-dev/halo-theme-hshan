<#macro comment post,type>
    <#if !post.disallowComment!false>
        <script src="${theme_base!}/assets/libs/vue/vue.min.js"></script>
        <script src="${options.comment_internal_plugin_js!'//cdn.jsdelivr.net/gh/hshanx/halo-comment-normal@v1.0.0/dist/halo-comment.min.js'}"></script>
        <halo-comment id="${post.id?c}" type="${type}"></halo-comment>
    </#if>
</#macro>
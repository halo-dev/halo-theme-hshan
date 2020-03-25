<#if (is_post?? || is_sheet??) && settings.enabled_mermaid!true>
    <script src="//cdn.jsdelivr.net/npm/mermaid@8.4.8/dist/mermaid.min.js"></script>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            mermaid.initialize();
        });
    </script>
</#if>
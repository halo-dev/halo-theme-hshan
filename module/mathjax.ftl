<#if (is_post?? || is_sheet??) && settings.enabled_mathjax!true>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/katex@0.11.1/dist/katex.min.css" >
    <script defer src="https://cdn.jsdelivr.net/npm/katex@0.11.1/dist/katex.min.js" ></script>

    <script>
        var katex_config = {
            delimiters:
                [
                    {left: "$$", right: "$$", display: true},
                    {left: "$", right: "$", display: false},
                    {left: "\\(", right: "\\)", display: false},
                    {left: "\\[", right: "\\]", display: true},
                ]
        };
    </script>
    <script defer src="https://cdn.jsdelivr.net/npm/katex@0.11.1/dist/contrib/auto-render.min.js"
         onload="renderMathInElement(document.getElementById('post-content'),katex_config)"></script>

</#if>
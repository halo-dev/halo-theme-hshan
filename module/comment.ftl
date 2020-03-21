<#macro comment target,type>
    <#if !post.disallowComment!false>
        <section class="comments-area">
            <div class="inner" id="commentInner">
                <div id="haloComment"></div>
            </div>
        </section>

        <script type="application/javascript">
            function renderComment() {
                const haloComment = document.getElementById('haloComment');
                if (!haloComment) {
                    $('#' + '${target.id?c}').remove();
                    $('#commentInner').append('<div id="haloComment"></div>');
                }

                new Vue({
                    el: '#haloComment',
                    data() {
                        return {
                            configs: {
                                darkMode: hanUtils.getLocalStorage('nightMode')
                            }
                        };
                    },
                    template: `<halo-comment id="${target.id?c}" type="${type}" :configs="JSON.stringify(configs)" />`,
                });
            }

            renderComment();
        </script>
    </#if>
</#macro>
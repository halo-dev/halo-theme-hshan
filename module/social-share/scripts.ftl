<script>
    $('.share-btn').on("click", function (e) {
        var icons = $('#socialShare');
        if (icons.hasClass('show')) {
            $('#socialShare').velocity("transition.slideUpOut", {duration: 300});
        } else {
            $('#socialShare').velocity("transition.slideDownIn", {duration: 300});
        }
        icons.toggleClass('show');
    });

    const $config = {
        sites: ['google', 'twitter', 'facebook', 'weibo', 'qq', 'tencent', 'qzone', 'linkedin', 'wechat', 'douban', 'diandian'], // 启用的站点
        disabled: '${settings.share_disabeld!''}'.split(','), // 禁用的站点
    };

    socialShare('.social-share', $config);
</script>
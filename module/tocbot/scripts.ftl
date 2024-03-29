<script>
    const tocId = '#toc';
    const flagId = '#tocFlag';
    const headerEl = 'h1,h2,h3,h4,h5,h6'  //headers
    const content = '.post-content';//文章容器

    tocbot.init({
        tocSelector: '#toc',
        contentSelector: content,
        headingSelector: headerEl,
        scrollSmooth: true,
        headingsOffset: 0 - $('#postHeader').height(),
        hasInnerContainers: false,
    });

    const tocLinks = $('.toc-link');

    if (tocLinks) {
        for (var i = 0; i < tocLinks.length; i++) {
            var tocLink = tocLinks[i];
            tocLink.after(document.createElement("span"));
        }
    }

    function tocScroll(e) {
        const Obj = $(flagId);

        //判断元素是否存在
        if (Obj.length !== 1) {
            return false;
        }

        var tocFixed = $(tocId);
        var ObjTop = Obj.offset().top - $(window).height() * 0.5;

        // 滚动条离页面顶端的距离
        var scrollTop = getScrollTop();
        var postHeaderHeight = $('#postHeader').height();
        if (scrollTop > postHeaderHeight) {
            tocFixed.show();
        } else {
            tocFixed.hide();
        }

        var tocEle = document.querySelector(tocId);
        if (!tocEle || !tocEle.getBoundingClientRect()) {
            return;
        }
        var tocHeight = tocEle.getBoundingClientRect().height;
        if (scrollTop > ObjTop - tocHeight * 0.5) {
            tocFixed.addClass('right-fixed');
        } else {
            tocFixed.removeClass('right-fixed');
        }

        tocParentActive()
        e.preventDefault();
    }

    function getScrollTop() {
        return document.documentElement.scrollTop || document.body.scrollTop;
    }

    function tocParentActive() {
        var isCollapsible = $('.is-active-li').parents('ol.toc-list.is-collapsible');
        if (isCollapsible) {
            isCollapsible.each(function () {
                $(this).parent().find('a.toc-link:first').addClass('toc-hover');
            })
        }
        var isCollapsed = $('ol.toc-list.is-collapsible.is-collapsed');
        if (isCollapsed) {
            isCollapsed.each(function () {
                $(this).parent().find('a.toc-link:first').removeClass('toc-hover');
            })
        }

    }

    function tocHover() {
        $('.toc-list-item span').hover(function () {
            $(this).parent().find('a.toc-link:first').addClass('toc-hover')
        }, function () {
            $(this).parent().find('a.toc-link:first').removeClass('toc-hover')
        })
    }

    tocHover()

    window.addEventListener('scroll', tocScroll, false);
</script>
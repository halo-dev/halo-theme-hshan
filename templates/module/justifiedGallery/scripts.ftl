<script>
    document.addEventListener('DOMContentLoaded', function () {
        if (typeof ($.fn.justifiedGallery) === 'function') {
            if ($('.justified-gallery > p > .gallery-item').length) {
                $('.justified-gallery > p > .gallery-item').unwrap();
            }
            $('.justified-gallery').justifiedGallery({rowHeight: 230, margins: 4});
        }
    });
</script>
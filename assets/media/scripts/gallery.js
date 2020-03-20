var photo = {
    loadGallery: function () {
        if (typeof ($.fn.lightGallery) === 'function') {
            $('.article-content').lightGallery({selector: '.gallery-item'});
        }
        if (typeof ($.fn.justifiedGallery) === 'function') {
            if ($('.justified-gallery > p > .gallery-item').length) {
                $('.justified-gallery > p > .gallery-item').unwrap();
            }
            $('.justified-gallery').justifiedGallery({rowHeight: 230, margins: 4});
        }
    }
}

document.addEventListener('DOMContentLoaded', photo.loadGallery);
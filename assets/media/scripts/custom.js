/**
 * Main JS file for Subtle behaviours
 */

// Responsive video embeds
let videoEmbeds = [
	'iframe[src*="youtube.com"]',
	'iframe[src*="vimeo.com"]'
];
reframe(videoEmbeds.join(','));

// Smooth scroll to anchors
var scroll = new SmoothScroll('[data-scroll]', {
	speed: 300,
	updateURL: false
});

// Gallery adjustments
var images = document.querySelectorAll('.kg-gallery-image img');
images.forEach(function (image) {
	var container = image.closest('.kg-gallery-image');
	var width = image.attributes.width.value;
	var height = image.attributes.height.value;
	var ratio = width / height;
	container.style.flex = ratio + ' 1 0%';
});

if (images.length) {
	window.addEventListener("load", function() {
		Lightense('.kg-gallery-image img', {
			background: 'rgba(255,255,255,.9)',
		});
	}, false);
}

// Sidebar toggle
let sidebarToggle = document.querySelectorAll('.sidebar-toggle');
if (sidebarToggle) {
	for (let i = 0; i < sidebarToggle.length; i++) {
		sidebarToggle[i].addEventListener('click', function (e) {
			document.body.classList.toggle('sidebar-opened');
			var menuCtrl = $("#sidebarToggle");
			if (menuCtrl) {
				menuCtrl.toggleClass('menu-ctrl-on');
			}
			var sidebar = $("#sidebar");
			if (sidebar) {
				sidebar.toggleClass('sidebar-show');
			}
			e.preventDefault();
		});
	}
}

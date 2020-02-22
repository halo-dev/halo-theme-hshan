/**
 * Main JS file for Subtle behaviours
 */
// Responsive video embeds
var videoEmbeds = [
	'iframe[src*="youtube.com"]',
	'iframe[src*="vimeo.com"]',
]
reframe(videoEmbeds.join(','))

// Smooth scroll to anchors
var scroll = new SmoothScroll('[data-scroll]', {
	speed: 300,
	updateURL: false,
})

// Gallery adjustments
var images = document.querySelectorAll('.kg-gallery-image img')
images.forEach(
	function (image) {
		var container = image.closest('.kg-gallery-image')
		var width = image.attributes.width.value
		var height = image.attributes.height.value
		var ratio = width / height
		container.style.flex = ratio + ' 1 0%'
	})
if (images.length)
	window.addEventListener(
		'load',
		function () {
			Lightense('.kg-gallery-image img', {
				background: 'rgba(255,255,255,.9)',
			})
		},
		false)

// Sidebar toggle
var sidebarToggle = document.querySelectorAll('.sidebar-toggle')
if (sidebarToggle)
	for (var i = 0; i < sidebarToggle.length; i++)
		sidebarToggle[i].addEventListener(
			'click',
			function (e) {
				var menuCtrl = $('#sidebarToggle')
				if (menuCtrl)
					menuCtrl.toggleClass('menu-ctrl-on')
				var scrollMenu = $('#scrollMenu')
				if (scrollMenu)
					scrollMenu.toggleClass('scroll-menu-show')
				var siteHeader = $('#siteHeader')
				if (siteHeader)
					siteHeader.toggleClass('site-header-scroll')
				var sideBar = $('#sidebar')
				if (sideBar)
					sideBar.toggleClass('sidebar-show')
				e.preventDefault()

				// 滚动条
				$(document.body).toggleClass('cancel-scroll')
			},
			{
				passive: false,
			})
$(
	function () {
		function linksAddBlank() {
			var links = $('.post-content a')
			if (links)
				for (var i = 0; i < links.length; i++)
					$(links[i]).attr('target', '_blank')
		}

		var oldScrollTop

		// 获取滚动条距离顶部位置

		function getScrollTop() {
			var scrollTop = 0
			if (document.documentElement && document.documentElement.scrollTop)
				scrollTop = document.documentElement.scrollTop
			else
				if (document.body)
					scrollTop = document.body.scrollTop
			return scrollTop
		}

		function scollHeader() {
			window.addEventListener(
				'scroll',
				function () {
					var siteHeader = $('#siteHeader')
					var scrollMenu = $('#scrollMenu')
					var sidebarToggle = $('#sidebarToggle')
					var scrollTop = getScrollTop()
					if (siteHeader && scrollTop > 0) {
						siteHeader.addClass('site-header-scroll')
						scrollMenu.addClass('scroll-menu-show')
						sidebarToggle.hide()
					} else {
						siteHeader.removeClass('site-header-scroll')
						scrollMenu.removeClass('scroll-menu-show')
						sidebarToggle.show()
					}
					oldScrollTop = scrollTop
				},
				false)
		}

		function toggleSearch() {
			// 搜索框
			$('.js-toggle-search').on(
				'click',
				function () {
					openSearchPanel()
					$('#sidebar').removeClass('sidebar-show')
					$('#sidebarToggle').removeClass('menu-ctrl-on')
					$(document.body).removeClass('sidebar-opened')
					$(document.body).removeClass('cancel-scroll')
				})
		}

		// 当前菜单菜单高亮

		function highlightMenu() {
			var nav = document.getElementById('scrollMenu')
			var links = nav.getElementsByTagName('a')
			var currenturl = document.location.href
			var last = 0
			for (var i = 0; i < links.length; i++) {
				var linkurl = links[i].getAttribute('href')
				if (currenturl.indexOf(linkurl) !== -1)
					last = i
			}
			$(links[last]).addClass('active-current')
			var currentLinks = links[last]
			if ($(currentLinks).parents('.sub-menu')) {
				var subMenu = $(currentLinks).parents('.sub-menu')
				$(subMenu[0]).siblings('a').addClass('active-current')
			}
		}

		linksAddBlank()

		// 头部菜单滚动时间
		scollHeader()

		toggleSearch()

		// 当前目录菜单高亮
		highlightMenu()
	})

// 删除日志中的空元素
$(document).ready(
	function () {
		var treeHoleBoxs = document.querySelectorAll('.tree-hole-box')
		if (treeHoleBoxs)
			for (var i = 0; i < treeHoleBoxs.length; i++) {
				var childrens = $(treeHoleBoxs[i]).children('p:empty')
				for (var j = 0; j < childrens.length; j++)
					childrens[j].remove()
			}
	})

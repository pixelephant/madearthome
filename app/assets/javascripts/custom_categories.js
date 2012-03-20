//= require jquery.easing
//= require carousel
//= require mousewheel
//= require jquery.fancybox
//= require jquery.slider.min

/**
 * jQuery Plugin to obtain touch gestures from iPhone, iPod Touch and iPad, should also work with Android mobile phones (not tested yet!)
 * Common usage: wipe images (left and right to show the previous or next image)
 *
 * @author Andreas Waltl, netCU Internetagentur (http://www.netcu.de)
 * @version 1.1.1 (9th December 2010) - fix bug (older IE's had problems)
 * @version 1.1 (1st September 2010) - support wipe up and wipe down
 * @version 1.0 (15th July 2010)
 */
(function($){$.fn.touchwipe=function(settings){var config={min_move_x:20,min_move_y:20,wipeLeft:function(){},wipeRight:function(){},wipeUp:function(){},wipeDown:function(){},preventDefaultEvents:true};if(settings)$.extend(config,settings);this.each(function(){var startX;var startY;var isMoving=false;function cancelTouch(){this.removeEventListener('touchmove',onTouchMove);startX=null;isMoving=false}function onTouchMove(e){if(config.preventDefaultEvents){e.preventDefault()}if(isMoving){var x=e.touches[0].pageX;var y=e.touches[0].pageY;var dx=startX-x;var dy=startY-y;if(Math.abs(dx)>=config.min_move_x){cancelTouch();if(dx>0){config.wipeLeft()}else{config.wipeRight()}}else if(Math.abs(dy)>=config.min_move_y){cancelTouch();if(dy>0){config.wipeDown()}else{config.wipeUp()}}}}function onTouchStart(e){if(e.touches.length==1){startX=e.touches[0].pageX;startY=e.touches[0].pageY;isMoving=true;this.addEventListener('touchmove',onTouchMove,false)}}if('ontouchstart'in document.documentElement){this.addEventListener('touchstart',onTouchStart,false)}});return this}})(jQuery);

$("document").ready(function(){
	
	$("#back-to-top").click(function(){
		$('html,body').animate({scrollTop: $($(this).attr("href")).offset().top -10},'slow');
		return false;
	})
	
	$.each($("input[type='slider']"),function(){
		var $this = $(this);
		$this.slider({
			skin: "blue",
			from: $this.val().split(";")[0],
			to: $this.val().split(";")[1],
			heterogeneity: ['1/1'],
			step: 10
			});	
	});

	/*$.prettyLoader({
		loader: '/assets/prettyLoader/ajax-loader.gif',
		bind_to_ajax: true
	});*/

/*	$("#last-viewed .carousel").jCarouselLite({
	        btnPrev: "#last-viewed .left",
	        btnNext: "#last-viewed .right",
		    mouseWheel: true,
		    visible: 6,
		    scroll: 2
	}); */

	$(".carousel").touchwipe({
	     wipeLeft: function() { $("#last-viewed .right").trigger("click"); },
	     wipeRight: function() { $("#last-viewed .left").trigger("click"); },
	     min_move_x: 20,
	     min_move_y: 20,
	     preventDefaultEvents: true
	});

	
	$(".fancybox").fancybox({
			type : 'ajax',
			openEffect	: 'elastic',
			closeEffect	: 'elastic',
			autoSize: true,
			arrows: true,
			nextEffect: 'none',
			prevEffect: 'none'
		});
	
/*	$(".quicklook").click(function(){
		var id = $(this).parents(".product").data("id");
		$(this).parents(".product").addClass("opened");
		$("#product-modal").data("next-id",$(this).parents(".product").next().data("id"));
		$("#product-modal").data("prev-id",$(this).parents(".product").prev().data("id"));
		/*$("#product-modal").modal({
			onClose: function (dialog) {
				$("#product-grid .opened").removeClass("opened");
				dialog.data.fadeOut('slow', function () {
					dialog.container.slideUp('slow', function () {
						dialog.overlay.fadeOut('slow', function () {
							$.modal.close(); // must call this!
						});
					});
				});
			},
			onOpen: function (dialog) {
				dialog.overlay.fadeIn('slow', function () {
					$.ajax({
					  type: 'POST',
					  url: "/products/quicklook",
						data: {id : id},
					  success: function(resp){
						$("#product-modal .clearfix").html(resp);
						dialog.container.slideDown('slow', function () {
							dialog.data.fadeIn('slow');
						});
					}});

				});
			}
		});
		
		return false;
	});

	$("#modal-next,#modal-prev").click(function(){
		if($(this).attr("id") == "modal-prev"){
			if(!$("#product-grid .opened").prev().length) { return false;}
			var id = $("#product-modal").data("prev-id");
			$("#product-grid .opened").removeClass("opened").prev().addClass("opened");
		}
		else{
			if(!$("#product-grid .opened").next().length) { return false;}
			var id = $("#product-modal").data("next-id");
			$("#product-grid .opened").removeClass("opened").next().addClass("opened");
		}
		$.ajax({
		  type: 'POST',
		  url: "/products/quicklook",
			data: {id : id},
		  success: function(resp){
			$("#product-modal .clearfix").html(resp);

			$("#product-modal").data("next-id",$("#product-grid .opened").next().data("id"));
			$("#product-modal").data("prev-id",$("#product-grid .opened").prev().data("id"));
		}});
		return false;
	});*/

});

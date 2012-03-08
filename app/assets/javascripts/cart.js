//= require carousel
//= require mousewheel
//= require modal

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

var shipping_threshold = 1000;
var shipping_fee = 4500;

$("document").ready(function(){
	
	function recalculate_sum(){
		var subtotal = 0;
		$.each($(".sum-price-cell span"),function(){
			subtotal += parseInt($(this).html());
		});
		
		var shipping = subtotal > shipping_threshold ? 0 : 4500;
		
		var total = subtotal + shipping;
		
		$(".subtotal").html(subtotal);
		$(".shipping-cost").html(shipping);
		$(".total-price").html(subtotal + shipping)
	}
	
		$("#cart-slider ul").carouFredSel({
			items: 4,
			scroll:2,
			auto : false,
			circular : true,
			infinite : true,	
			prev : {
				button      : "#cart-slider .left",
		        easing      : "easeOutSine"
			    },
			next : {
				button      : "#cart-slider .right",
		        easing      : "easeOutSine"
		    },
		});
	
	$(".quantity-cell input[type='number']").bind("input",function(){
		var $this = $(this);
		var price = parseInt($this.parents("tr").find(".price-cell span").html());
		$this.parents("tr").find(".sum-price-cell span").html(price * parseInt($this.val()));
		recalculate_sum();
	});
	
	$(".delete").click(function(){
		var $this = $(this);
		var prodId = $(this).parents("tr").data("id")
		//$.ajax({
		//  type: 'POST',
		//  url: "/cart/delete",
		//	data: {id : prodId},
		//  success: function(resp){
			$this.parents("tr").fadeOut(300, function(){
				$(this).remove();
				if(!$("#cart-table tbody tr").length){
					$("#cart-table,#cart-bottom,form").remove();
					$("#cart").append("<p>Üres</p>");
				}
				recalculate_sum();
				});
		//}});
		return false;
	});
	
	$("#coupon a").click(function(){
		//$.ajax({
		//  type: 'POST',
		//  url: "/cart/coupon",
		//	data: {code : $("#coupon-code").val()},
		//  success: function(resp){
			//vissza, hogy ok, nem ok, hogy módosítja az árat, ha el van fogadva akkor többet nem lehet beváltani (disable,törlés?)
		//}});
		return false;
	});
	
});
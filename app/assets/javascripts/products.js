//= require zoom
//= require jquery.easing
//= require carousel

$("document").ready(function(){
	$('.zoomable').jqzoom({
		zoomType: 'innerzoom',
		title: false,
		preloadText: 'Képek betöltése...'
	});
	
	$('#ca-container').contentcarousel({
		// speed for the sliding animation
		sliderSpeed		: 500,
		// easing for the sliding animation
		sliderEasing	: 'easeOutExpo',
		// speed for the item animation (open / close)
		itemSpeed		: 500,
		// easing for the item animation (open / close)
		itemEasing		: 'easeOutExpo',
		// number of items to scroll at a time
		scroll			: 1
	});
});
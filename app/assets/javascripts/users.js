//= require jquery.tooltip
//= require jquery.validate
//= require jquery.fancybox


$(document).ready(function(){
	$('.tooltip').tooltip();

	$(".fancybox").fancybox({
			type : 'ajax',
			openEffect	: 'elastic',
			closeEffect	: 'elastic',
			autoSize: true,
			arrows: true,
			nextEffect: 'none',
			prevEffect: 'none'
		});	
	
});
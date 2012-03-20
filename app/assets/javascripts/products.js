//= require zoom
//= require jquery.easing
//= require carousel
//= require mousewheel
//= require modal

$(window).load(function(){
	
	if (!Modernizr.touch){
		$("#current-picture").css("paddingLeft", (440 - ($("#current-picture img")[0].width))/2);
	
	   	$('.zoomable').jqzoom({
			title: false,
			zoomType: 'reverse',
			zoomWidth: 478,  
			zoomHeight:300, 
	        yOffset:38,
			preloadText: '',
		});
	}
	else{
		$("#picture-list a").click(function(){
			var $this = $(this);
			$this.siblings().removeClass("zoomThumbActive").end().addClass("zoomThumbActive");
			$("#current-picture a").fadeOut(300,function(){
				$(this).remove();
				var rel = eval('(' + $this.attr("rel") + ')');
			
			var a = $("<a>").attr("href",rel.largeimage);
			var i = $("<img>").attr("src",rel.smallimage);
			a.hide();
			a.append(i);
			a.appendTo("#current-picture").fadeIn();
			});
			return false;
		});
	}
	
});
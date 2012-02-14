// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require modernizr
//= require jquery
//= require jquery.validate


$("document").ready(function(){
	$("#newsletter-form").validate({
		debug: true,
		rules: {
			"newsletter": {required: true, email: true}
		},
		errorPlacement: function(error, element) {
			error.appendTo(element.parents("form"));
		}
	});
});

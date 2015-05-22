// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require_tree .

$(document).ready(function() {
	
	$("aside.preview nav").show();
	var previewImg = $("img#main");
	$("a:first").addClass("active");
	$("nav a img").click(function(){
		var link = $(this).parent();	
		var linkHref = link.attr("href");			
		var linkAlt = link.attr("alt");			
		if( $(link).hasClass("active") == false)
		{
			$("a").removeClass("active");
			link.addClass("active");											
			$(previewImg).animate({
				opacity: 0.8,
			}, 300, function() {
				previewImg.attr("src", linkHref);
				previewImg.attr("alt", linkAlt);				
				$(this).animate({
					opacity: 1,
					}, 300
				);							
			});			
		}
		return false;
	});
	$("input").click(function(){
		$("p.more").fadeIn("slow");
	})
});

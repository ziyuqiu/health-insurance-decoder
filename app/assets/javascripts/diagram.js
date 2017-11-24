console.log("Hello, body diagram.");

var addHighlight = function($button) {
    $button.addClass('btn_active').removeClass('btn_muted');    
}

var removeHighlight = function($button) {
    $button.addClass('btn_muted').removeClass('btn_active');    
}

var switchImage = function() {
    var img = $("#body-image");
    if (img.hasClass('femalebg'))
	img.removeClass('femalebg').addClass('malebg');
    else if (img.hasClass('malebg'))
	img.removeClass('malebg').addClass('femalebg');
}

var initBodyImageSwitches = function() {
    $("#body-image").addClass('femalebg');
    $("#btn_m").addClass('btn_muted');
    $("#btn_f").addClass('btn_active');    
}

$(document).ready(function(){
    
    initBodyImageSwitches();

    $("#btn_m").click(function(){
	switchImage();
	addHighlight($(this));
	removeHighlight($("#btn_f"));
    });
    
    $("#btn_f").click(function(){
	switchImage();
	addHighlight($(this));
	removeHighlight($("#btn_m"));
    });
});

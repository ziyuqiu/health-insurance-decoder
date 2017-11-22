console.log("Hello, body diagram.");
$(document).ready(function(){
    $("#body-image").addClass('femalebg');
    $("#btn_m").addClass('btn_active');
    $("#btn_f").addClass('btn_disabled');
    
    $("#btn_m").click(function(){
	$("#body-image").addClass('malebg').removeClass('femalebg');
	$(this).addClass('btn_disabled').removeClass('btn_active');
	$("#btn_f").addClass('btn_active').removeClass('btn_disabled');	
    });
    
    $("#btn_f").click(function(){
	$("#body-image").addClass('femalebg').removeClass('malebg');
	$(this).addClass('btn_disabled').removeClass('btn_active');
	$("#btn_m").addClass('btn_active').removeClass('btn_disabled');
    });
});

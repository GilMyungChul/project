/**
 * 
 */
 $(document).on("input", ".form-box input, .form-box textarea", function(){
    var _val = $(this).val();
    var _type = $(this).attr("type");
    var _length = $(this).val().length;
    
    $(this).siblings("label").find(".length").html(_length);
    
    if (_type != "radio") {
	    if (_val != 0) {
	        $(this).addClass('values');
	    } else {
	        $(this).removeClass('values');
	    }
	} 
})
$(document).on("change", ".form-box input[type='radio']", function(){
    var _type = $(this).attr("type");
    $(this).addClass('values').prop("checked", true);
    $(this).closest(".radio-box").siblings().find("input[type='radio']").removeClass('values').prop("checked", false);
    
});
$(document).on("change", "input[type='file']", function(){
	var _val = $(this).val();
	var file = _val.split("\\");
	var fileName = file[file.length - 1];
	
	$(this).closest(".upload-box").find(".file-name").html(fileName);
	
})



$(document).on("click", ".tab-menu li", function(){
	var _len = $(this).data("tab");
	
	$(".tab-menu li").removeClass("active"); 
	$(this).addClass("active");
	
	$(".tab-cont > div").removeClass("active").eq(_len - 1).addClass("active");
})
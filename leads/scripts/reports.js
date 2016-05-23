// Reports javascript

var calendar_show_btn = '.field-show-date';

$(document).ready(function(){
	
	if($(calendar_show_btn).length > 0){
		$(calendar_show_btn).datepicker({defaultDate: $(this).val(), dateFormat:"yy-mm-dd" });
	}
	
	
});
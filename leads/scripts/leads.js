// Core Javascript

$(document).ready(function(){
	
	//Activates the messages display
	getMainMessages();
	
});


/**
 * Displays messages
 */

function getMainMessages(){
	
	var main_content = '.main-wrapper';
	var main_message = '#main-messages';
	
	if($(main_message).length > 0){
	
		var message_width = $(main_content).width() * 0.6;
		$(main_message).children('ul').width(message_width);
		
		var message_left_position = parseInt($(main_message).children('ul').width() / 2);
		$(main_message).children('ul').css('left', '-' + message_left_position + 'px');
		
		$(main_message).show();
		var close_icon_top_position = ($(main_message + ' ul').children('li').height() / 2) - $(main_message + ' ul li').children('.close-icon').height();
		$(main_message + ' ul').children('li').append('<a href="javascript: void();" class="close-icon"></a>');
		$(main_message + ' ul li').children('.close-icon').css('top', close_icon_top_position + 'px');
		
		$(main_message + ' ul li').children('.close-icon').click(function(){
			
			$(this).parent('li').fadeOut(500, function(){ 
			
				$(this).remove(); 
				
				if($(main_message + ' ul').children('li').length <= 0){
					$(main_message).remove();
				}
			
			});
			
		});
	
		$.each($(main_message + ' ul').children('li'), function(index){
			$(this).delay(index * 500).fadeIn(500);
		});
		
	}
	
}
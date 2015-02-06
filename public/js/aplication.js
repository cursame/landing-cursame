// app cursame
//file
$(document).ready(function(){
	sendForm();
	$(window).scroll(function (event) {
	var scroll = $(window).scrollTop();
	var topHeader = $('.to_top').height();
	var sscrollPointer = topHeader-140
	 
	  if(scroll > sscrollPointer ){
	  	$('.header').addClass("header_scroll");
	    $('.header_scroll').removeClass("header");
	    $('.menu-main').addClass('menu-main-bottom');
	    $('.menu-main-bottom').removeClass('menu-main');
	    $('.singin-button').addClass('singin-button-bottom');
	    $('.singin-button-bottom').removeClass('singin-button');
	    $('.logo').html('<img src="/img/mainlogo_color.png" alt="">');
	  }

	  if(scroll < sscrollPointer){
	    $('.header_scroll').addClass("header");
	    $('.header').removeClass("header_scroll");
	    $('.menu-main-bottom').addClass('menu-main');
	    $('.menu-main').removeClass('menu-main-bottom');
	    $('.singin-button-bottom').addClass('singin-button');
	    $('.singin-button').removeClass('singin-button-bottom');
	    $('.logo').html('<img src="/img/mainlogo.png" alt="">');
	  }
	  
    });
    addNameINattrToSelect();
});

function changeTab(tab){
  
  // cambio de tab
  var actual_tab = $('.active').attr('id');
  $('#'+actual_tab).addClass('unactive');
  $('#'+actual_tab).removeClass('active');
  $('.arrow-down').remove();
  $('#'+tab).removeClass('unactive');
  $('#'+tab).addClass('active');
  $('#'+tab).append('<div class="arrow-down"></div>');

  // cambio de contenido
  var closeTab = 'to-' + actual_tab;
  var oppTab = 'to-' + tab;
  $('#'+closeTab).hide();
  $('#'+oppTab).show();

}

function callViewRemote(urlToLoad, divTo){
	$.get( urlToLoad, function( data ) {
    	$( divTo ).html( data );
    	addNameINattrToSelect();
    });
    return false; 
}

function sendForm(){
   $('form').submit(function() {
       var $form = $(this),
   	   url = $form.attr('action'),
       formData = new FormData( $form[0] );
   	   sendingAJAX(url, formData, function(data, err){
   	   	if (err) 
            return alert("Ha ocurrido un error al enviar el formulario");
        console.log(data);
   	   });
   	   return false; 
   });
}


function sendingAJAX(url, formData, callback){

	$.ajax({
	    url: url,
	    data: formData,
	    processData: false,
	    contentType: false,
	    type: 'POST',
	    success: function(data) {
	        callback(data, null);
	    },
	    error: function(err) {
	        callback(null, err);
	    }
	});

}

function addNameINattrToSelect(){
	$( "select > option" ).each(function() {
		    var content  = $(this).html() ;
			$(this).attr('data-info', content);
			console.log($(this).html());
	});
}
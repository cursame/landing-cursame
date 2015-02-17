// app cursame
//file
$(document).ready(function(){

	sendForm();

	/*$(window).scroll(function (event) {
	var scroll = $(window).scrollTop();
	var topHeader = $('.to_top').height();
	var sscrollPointer = topHeader-140;
	 
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
	  
    });*/
    addNameINattrToSelect();
    superScroll();
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
   	       changeValForDataInfo();
           var dataexternal = $(this).attr("data-external");

	       var $form = $(this),
	   	   url = $form.attr('action'),
	       formData = new FormData( $form[0] );
	   	   sendingAJAX(url, formData, dataexternal,function(data, err){
	   	   	if (err) 
	            return console.log("Ha ocurrido un error al enviar el formulario");
	        console.log('Se ha enviado correctamente su solicitud.')
	        rescueValueSelect();
	        $('form')[0].reset();

	   	   });
   	   
   	   return false; 
   });
}


function sendingAJAX(url, formData, external ,callback){
	external = typeof external !== 'undefined' ? external : false;
		
		if (external == 'true'){
		  var external = true;
		}else{
		   var external = false;
		}

	$.ajax({
	    url: url,
	    data: formData,
	    processData: false,
	    contentType: false,
	    type: 'POST',
	    success: function(data) {
	        callback(data, null);
	        //console.log(external_to);
	        if ( external == true ) {
	        	var token =  data.response.token
	        	window.location.href = "http://"+data.response.subdomain+".cursa.me/users/sign_in?auth_token="+data.response.token;
	        }
	    },
	    error: function(err) {
	        callback(null, err);
	         if ( external == true ) {
	         	var description = err.responseJSON.description;
	         	if (description == 'Email incorrect'){
	         		var des = "Email Incorrecto";
	         	} else {
	         		var des = "Contraseña Incorrecta";

	         	}
	         	$('.errors').html(des);
	         }



	    }
	});
}

function rescueValueSelect(){
    $( "select > option" ).each(function() {
	 var simple_val = $(this).attr('data-simplevalue');
	  $(this).attr('value' ,simple_val);
	});

}

function changeValForDataInfo(){
	$( "select > option" ).each(function() {
		var simple_val = $(this).attr('value');
		var vlauex  = $(this).attr('data-info');
		$(this).attr('value' ,vlauex);
		$(this).attr('data-simplevalue' ,simple_val);

	});
}

function addNameINattrToSelect(){
	$( "select > option" ).each(function() {
		    var content  = $(this).html() ;
			$(this).attr('data-info', content);
	});
}

function superScroll(){
	$('a.menu-get').click(function(e){
		e.preventDefault();
		var to = $(this).data('ft');
		var target = $('#'+to);
	 	$("html, body").animate({ scrollTop: $(target).offset().top}, 200);
	 	return false;
	});
}
$(document).ready(function(){
	  remoteLogginForm();
	  dataExecute();
});

function dataExecute(){
	var background_loggin = $('.dataexecute').data('background');
	var width_loggin = $('.dataexecute').data('width');
	var padding_loggin = $('.dataexecute').data('padding');
	var margin_top_loggin = $('.dataexecute').data('margin-top');
	var title_loggin = $('.dataexecute').data('title');
	var color_loggin = $('.dataexecute').data('color');
	var title_color_loggin = $('.dataexecute').data('title-color');
	$('.content-loggin-cursame').css({
       'background': background_loggin,
       'width': width_loggin,
       'padding': padding_loggin,
       'margin-top': margin_top_loggin,
       'color': color_loggin
	});
    $('.content-loggin-cursame').prepend('<h3 style="color:'+title_color_loggin+';">'+title_loggin+'</h3>');

}

function remoteLogginForm(){
   $('.cursame-form').submit(function() {
   	       changeValForDataInfo();
           var dataexternal = $(this).attr("data-external");

	       var $form = $(this),
	   	   url = $form.attr('action'),
	       formData = new FormData( $form[0] );
	   	   sendingAJAX(url, formData, dataexternal,function(data, err){
	   	   	if (err) 
	            return console.log("Ha ocurrido un error al enviar el formulario");
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
	        } else {
	           headNotice("<p style='font-size:20px; color: #fff; margin-top:20px;'>Formulario enviado correctamente</p>");
	        }
	    },
	    error: function(err) {
	        callback(null, err);
	         if ( external == true ) {
	         	var description = err.responseJSON.description;
	         	if (description == 'Email incorrect'){
	         		var des = "Email Incorrecto, favor de verificar";
	         	} else {
	         		var des = "Contraseña Incorrecta";

	         	}
	         	$('.errors').show();
	         	$('.errors').html(des);
	         }



	    }
	});
}

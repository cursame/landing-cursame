
jQuery(document).ready(function(){
	jQuery('#lead-form').submit(sendLead);
});

function sendLead(){

    var submit_btn = jQuery('#lead-form input[type="submit"]');
    submit_btn.prop("disabled", true );
    submit_btn.val("enviando...");

    var message_box = jQuery("#lead-form .message");
    message_box.hide();

    var controller = jQuery('#lead-form').attr('action');
    var name = jQuery('#lead-form input[name="name"]').val();
    var email = jQuery('#lead-form input[name="email"]').val();
    var phone = jQuery('#lead-form input[name="phone"]').val();
    var school = jQuery('#lead-form input[name="school"]').val();
    var students = jQuery('#lead-form input[name="students"]').val();
	var comments = jQuery('#lead-form textarea[name="comments"]').val();
    var policy = jQuery('#lead-form input[name="policy"]');
	var landing = jQuery('#lead-form input[name="landing"]').val();

    if(name == '' || email == '' || phone == '' || school == '' || students == ''){
        message_box.text("Debes llenar todos los campos obligatorios");
        message_box.fadeIn();
        submit_btn.prop("disabled", false );
        submit_btn.val("me interesa una demo");
    }
    else if(!policy.is(':checked')){
        message_box.text("Debes leer y aceptar el Aviso de Privacidad");
        message_box.fadeIn();
        submit_btn.prop("disabled", false );
        submit_btn.val("me interesa una demo");
    }
    else{

        jQuery.ajax({
            type: 'POST',
            url: controller,
            data: {name: name, email: email, phone: phone, school: school, students: students, comments: comments},
            context: document.body,
            dataType: 'json',
            cache: false,
        }).done(function(response){

            if(response.status == 1){

				 var thankyoupage_url = "gracias.html?landing=" + landing;
                 location.href = thankyoupage_url;
            }
            else{
                message_box.text(response.message);
                message_box.fadeIn();
                submit_btn.prop("disabled", false );
                submit_btn.val("Enviar");
            }

        }).fail(function(){
            message_box.text("No podemos procesar tu solicitud, inténtalo más tarde");
            message_box.fadeIn();
            submit_btn.prop("disabled", false );
            submit_btn.val("Enviar");
        });

    }

    return false;
}

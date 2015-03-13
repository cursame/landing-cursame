$(document).ready(function(){
     callViewRemoteX("http://localhost:9393/es/call_login_plugin", "#plugin_loggin_cursame");
});

function callViewRemoteX(urlToLoad, divTo){
	$.get( urlToLoad, function( data ) {
    	$( divTo ).html( data );
    });
    return false; 
}


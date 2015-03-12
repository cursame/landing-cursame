$(document).ready(function(){
  $.getJSON( "../../plugins/loggin_plugin/login.json", function( data ) {

  })
  .done(function(data) {

    callViewRemote(data.render , data.div_to);
  })
  .fail(function() {
    console.log( "error al cargar el plugin" );
  });
});


// app cursame
$(document).ready(function(){
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
});
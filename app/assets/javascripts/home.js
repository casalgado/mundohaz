
var ready = function() {

	  $("#logo-black-cover").hide()

    if ($('body').hasClass("home")) {
      $('#logo-bar').height(20)
      $("#brand-logo").hide()
      $("#logo-black-cover").show()
    }
};

var resize = function() {

    if ($('body').hasClass("home")) {
      $windowHeight  = $(window).height()
      $windowWidth   = $(window).width()
      $navHeight = $('#nav').height()
      $displayHeight = $windowHeight - ($navHeight + 26)
      $("#page-content").offset({ top: $displayHeight + 20 })
      $("#slider").width($windowWidth * 0.8)
  	  $("#slider").offset({ left: $windowWidth * 0.1, top: $displayHeight - ($windowWidth * 0.45) })
  	  $("#page-content").height($windowHeight)
  	  $("#logo-bar").offset({ top: $displayHeight })
      $('#logo-bar').height(20)
    } 

};

$( window ).scroll( function () {

    if ($('body').hasClass("home")) {

  		$window = $(window)
      $navdefHeight   = $('.navbar-default').height()
      $logobarHeight  = $("#logo-bar").height()
      $scrollPosition = $("#page-content").scrollTop()
      $('#logo-bar').height(20)

      if ( $window.scrollTop() > $navdefHeight + $logobarHeight ) {
        $('#logo-bar').removeClass('for-fixed')
        $('#logo-placeholder').hide()
      } else {
      	$('#logo-bar').addClass('for-fixed')
      	$('#logo-placeholder').show()	
      }
      if ( $window.scrollTop() > 1 ) {
        $("#logo-black-cover").fadeOut(500)
      } else {
        $("#logo-black-cover").fadeIn(200)
      }
      if ( $window.scrollTop() > 200 ) {
        $("#brand-logo").fadeIn(500)
        $('#logo-bar').height(12)
      } else {
        $("#brand-logo").fadeOut(200)
        $('#logo-bar').height(20)
      }

    }

});

$(window).resize(resize);
$(document).ready(resize);
$(document).on('page:load', resize);
$(document).ready(ready);
$(document).on('page:load', ready);
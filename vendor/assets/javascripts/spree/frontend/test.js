

var ready = function() {



  // Nav link hover

  $('.panel').on('mouseover click', function() {
    $(this).addClass('margin-bottom');
  });

  $('.panel').on('mouseout', function() {
    $(this).removeClass('margin-bottom');
  });



};






$(document).ready(ready);
$(document).on('page:load', ready);

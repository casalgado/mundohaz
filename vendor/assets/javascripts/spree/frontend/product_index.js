

var ready = function() {



  // Nav link hover

  $('.panel-overlay').hide()

  $('.product-list-item').on('mouseover click', function() {
    $(this).find('.panel-overlay').show();
  });

  $('.product-list-item').on('mouseout', function() {
    $(this).find('.panel-overlay').hide();
  });



};






$(document).ready(ready);
$(document).on('page:load', ready);

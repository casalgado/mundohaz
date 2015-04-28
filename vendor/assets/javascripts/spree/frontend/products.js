var ready = function() {

  // Nav link hover

	$('.product-list-item').find('#hover-image').hide();  

  $('.product-list-item').on('mouseover click', function() {
    $(this).find('#default-image').hide();
    $(this).find('#hover-image').show();
    
  });

  $('.product-list-item').on('mouseout', function() {
    $(this).find('#default-image').show();
    $(this).find('#hover-image').hide();
    
  });

};

$(document).ready(ready);
$(document).on('page:load', ready);

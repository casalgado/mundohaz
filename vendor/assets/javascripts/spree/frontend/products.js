var ready = function() {

//   // Nav link hover

// 	$('.product-list-item').find('#hover-image').hide();  

//   $('.product-list-item').on('mouseover click', function() {
//     $(this).find('#default-image').hide();
//     $(this).find('#hover-image').show();
    
//   });

//   $('.product-list-item').on('mouseout', function() {
//     $(this).find('#default-image').show();
//     $(this).find('#hover-image').hide();
    
//   });

	// Replace first character in price string 
	var price = $('span.price.selling.lead').text()
	var newPrice = price.replace("₱", "$")
	$('span.price.selling.lead').html(newPrice)

};

$(document).ready(ready);
$(document).on('page:load', ready);

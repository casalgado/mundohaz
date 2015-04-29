



var ready = function() {

	$('.variant-option-values li a').each(function() {
	  if ($(this).attr('title') == 'Green') {
			this.style.setProperty( 'background-color', 'green', 'important' )
			$(this).empty()
		}
		if ($(this).attr('title') == 'Red') {
			this.style.setProperty( 'background-color', 'red', 'important' )	
			$(this).empty()
		}
		if ($(this).attr('title') == 'Blue') {	
			this.style.setProperty( 'background-color', 'blue', 'important' )
			$(this).empty()
		}
		if ($(this).hasClass('locked')) {
			this.style.setProperty( 'background-color', 'white', 'important' )
			$(this).empty()
		}

	});


	$('.option-value').on('mousemove', function() { 
		$('.variant-option-values li a').each(function() {
			if ($(this).attr('title') == 'Green') {
				this.style.setProperty( 'background-color', 'green', 'important' )
				$(this).empty()
			}
			if ($(this).attr('title') == 'Red') {
				this.style.setProperty( 'background-color', 'red', 'important' )	
				$(this).empty()
			}
			if ($(this).attr('title') == 'Blue') {	
				this.style.setProperty( 'background-color', 'blue', 'important' )
				$(this).empty()
			}
			if ($(this).hasClass('unavailable')) {
				this.style.setProperty( 'background-color', 'lightgray', 'important' )
				$(this).empty()
			} 
			// if ($(this).hasClass('selected')) {
			// 	this.style.setProperty( 'border-color', 'lightgray', 'important' )
			// } else {
			// 	this.style.setProperty( 'border-color', 'black', 'important' )
			// }

		});
	});


};

$(document).ready(ready);
$(document).on('page:load', ready);

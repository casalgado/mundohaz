
	class MercadoPagoGateway < Spree::PaymentMethod

		def auto_capture?
	    true
	  end

	  def purchase(money, credit_card, options = {})
	  	puts "********************1"
	  	byebug
	  	puts "  "
	  end

	  def authorize(money, credit_card, options = {})
	  	puts "********************2"
	  	byebug
	  	puts "  "
	  end

	  def self.purchase(money, credit_card, options = {})
	  	puts "********************3"
	  	byebug
	  	puts "  "
	  end

	  def self.authorize(money, credit_card, options = {})
	  	puts "********************4"
	  	byebug
	  	puts "  "
	  end

	  def provider_class
      nil
    end

    def payment_source_class
      nil
    end

    def source_required?
      false
    end
	  
	end
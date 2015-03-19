module Spree

	class PaymentMethod::MercadoPago < PaymentMethod

    preference :client_id, :string
    preference :client_secret, :string

		def auto_capture?
	    true
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
end
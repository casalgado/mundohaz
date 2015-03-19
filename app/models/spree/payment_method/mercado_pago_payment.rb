module Spree

	class PaymentMethod::MercadoPagoPayment < PaymentMethod

    preference :client_id, :string
    preference :client_secret, :string

		def auto_capture?
			false
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

		def create_preference(order, back_urls)

			items = order.line_items.map do |item|
				{
					id:           item.id,
					title:        item.product.name,
					description:  item.product.description,
					quantity:     item.quantity,
					unit_price:   item.price.to_f,
					currency_id:  item.currency
				}
			end
			
			@mp_client ||= MercadoPago::Client.new(self.preferences[:client_id], self.preferences[:client_secret])

			data = {
			  external_reference: order.number,
			  items: items,
			  payer: {
			    name:     order.ship_address.firstname,
			    surname:  order.ship_address.lastname,
			    email:    order.email
			  },
			  back_urls: back_urls
			}

			return @mp_client.create_preference(data)
		end

	end
end

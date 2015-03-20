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
			if order.tax_zone
				items << {
					title:        Spree.t(:tax),
					description:  order.tax_zone.name,
					quantity:     1,
					unit_price:   order.additional_tax_total.to_f,
					currency_id:  order.currency
				}
			end
			unless order.shipments.empty?
				shipments = order.shipments.map do |shipment|
					{
						id:           shipment.id,
						title:        Spree.t(:shipment),
						quantity:     1,
						unit_price:   shipment.cost.to_f,
						currency_id:  order.currency
					}
				end
				items = (items + shipments).flatten
			end

			@mp_client ||= MercadoPago::Client.new(self.preferences[:client_id], self.preferences[:client_secret])

			data = {
			  external_reference: order.number,
			  items: items,
				payer: {
					name: order.ship_address.firstname,
					surname: order.ship_address.lastname,
					email: order.email,
				},
				auto_return: "approved",
			  back_urls: back_urls,
			}

			return @mp_client.create_preference(data)
		end

	end
end

module Spree
  CheckoutController.class_eval do
    before_filter :mercadopago_redirect, :only => [:update]

    private
    def mercadopago_redirect

      return unless (params[:state] == "payment") && params[:order][:payments_attributes]

      payment_method = PaymentMethod.find(params[:order][:payments_attributes].first[:payment_method_id])

      if payment_method.kind_of?(Spree::PaymentMethod::MercadoPagoPayment)

        back_urls = {
			    pending: pending_mercado_pago_url,
			    success: callback_mercado_pago_url,
			    failure: failure_mercado_pago_url
			  }
        payment = payment_method.create_preference(current_order, back_urls)
        byebug
        if payment["error"].nil?
          redirect_to payment["init_point"]
        else
        end
      end
    end
  end
end

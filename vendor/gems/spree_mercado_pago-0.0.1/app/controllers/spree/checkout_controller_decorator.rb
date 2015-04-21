module Spree
  CheckoutController.class_eval do
    before_filter :mercadopago_redirect, :only => [:update]

    private
    def mercadopago_redirect

      return unless (params[:state] == "payment") && params[:order][:payments_attributes]

      payment_method = PaymentMethod.find(params[:order][:payments_attributes].first[:payment_method_id])

      if payment_method.kind_of?(Spree::PaymentMethod::MercadoPagoPayment)
        payment = current_order.payments.create({:amount => current_order.total,
                                                 :source => nil,
                                                 :payment_method => payment_method })
        back_urls = {
			    pending: pending_mercado_pago_url(:payment_method_id => payment_method.id, payment_id: payment.number),
			    success: callback_mercado_pago_url(:payment_method_id => payment_method.id, payment_id: payment.number),
			    failure: failure_mercado_pago_url(:payment_method_id => payment_method.id, payment_id: payment.number)
			  }
        preference = payment_method.create_preference(current_order, back_urls)
        if preference["error"].nil?
          payment.started_processing!
          redirect_to preference["init_point"]
        else
          redirect_to edit_order_checkout_url(current_order, :state => 'payment'),
                    :notice => Spree.t(:spree_gateway_error_flash_for_checkout)
        end
      end
    end
  end
end

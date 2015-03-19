module Spree
  CheckoutController.class_eval do
    before_filter :mercadopago_redirect, :only => [:update]

    private
    def mercadopago_redirect
      return unless (params[:state] == "payment") && params[:order][:payments_attributes]

      payment_method = PaymentMethod.find(params[:order][:payments_attributes].first[:payment_method_id])
      if payment_method.kind_of?(Spree::PaymentMethod::MercadoPago)
      	byebug
      	# mp_client = MercadoPago::Client.new(client_id, client_secret)
        # redirect_to spree_coinbase_redirect_url(:payment_method_id => payment_method.id)
      end
    end
  end
end
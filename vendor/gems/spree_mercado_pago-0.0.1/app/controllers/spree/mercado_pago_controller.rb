class Spree::MercadoPagoController < ApplicationController
  def pending
    order = Spree::Order.find_by(number: params[:external_reference]) || raise(ActiveRecord::RecordNotFound)
    payment = order.payments.find_by(number: params[:payment_id])
    payment.pend!
    redirect_to spree.order_path(order), :notice => Spree.t(:spree_mercadopago_checkout_pending)
    # redirect_to checkout_state_path(order.state),
		# 	:notice => Spree.t(:spree_mercadopago_checkout_pending)
  end

  def callback
    order = Spree::Order.find_by(number: params[:external_reference]) || raise(ActiveRecord::RecordNotFound)
    payment = order.payments.find_by(number: params[:payment_id])
    payment.complete!
    order.reload.next
    unless order.complete?
 			render text: "Could not transition order: %s" % order.errors
 			return
 		else
   		order.update!
      session[:order_id] = nil
      redirect_to spree.order_path(order), :notice => Spree.t(:order_processed_successfully)
    end
  end

  def failure
    order = Spree::Order.find_by(number: params[:external_reference]) || raise(ActiveRecord::RecordNotFound)
    payment = order.payments.find_by(number: params[:payment_id])
    payment.void!
    redirect_to checkout_state_path(order.state),
			:notice => Spree.t(:spree_mercadopago_checkout_cancelled)
  end

end

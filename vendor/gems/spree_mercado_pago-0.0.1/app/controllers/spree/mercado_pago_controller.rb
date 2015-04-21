class Spree::MercadoPagoController < ApplicationController
  def pending
    byebug
    order = Spree::Order.find_by(number: params[:external_reference]) || raise(ActiveRecord::RecordNotFound)
    payment = order.payments.find_by(number: params[:payment_id])
    payment.pend!
    redirect_to edit_order_checkout_url(order, :state => 'payment'),
			:notice => Spree.t(:spree_mercadopago_checkout_cancelled)
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
    byebug
    order = Spree::Order.find_by(number: params[:external_reference]) || raise(ActiveRecord::RecordNotFound)
    payment = order.payments.find_by(number: params[:payment_id])
    payment.void!
		redirect_to edit_order_checkout_url(order, :state => 'payment'),
			:notice => Spree.t(:spree_mercadopago_checkout_cancelled)
  end

  private
  def payment_method
		m = Spree::PaymentMethod.find(params[:payment_method_id])
		if !(m.is_a? Spree::PaymentMethod::MercadoPagoPayment)
			raise "Invalid payment_method_id"
		end
		m
	end
end

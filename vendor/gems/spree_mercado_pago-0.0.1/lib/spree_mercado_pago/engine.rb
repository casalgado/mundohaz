module SpreeMercadoPago
  class Engine < Rails::Engine

    isolate_namespace Spree
    engine_name "spree_mercado_pago"

    config.autoload_paths += %W(#{config.root}/lib)

    initializer "spree.mercado_pago.payment_methods", :after => "spree.register.payment_methods" do |app|
      app.config.spree.payment_methods << Spree::PaymentMethod::MercadoPagoPayment
    end

    config.to_prepare do
      #loads application's model / class decorators
      Dir.glob File.expand_path("../../../app/**/*_decorator.rb", __FILE__) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end

      #loads application's deface view overrides
      Dir.glob File.expand_path("../../../app/overrides/*.rb", __FILE__) do |c|
        Rails.application.config.cache_classes ? require(c) : load(c)
      end
    end

  end
end

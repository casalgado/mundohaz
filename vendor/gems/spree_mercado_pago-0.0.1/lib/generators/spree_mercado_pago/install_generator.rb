module SpreeVariantOptions
  module Generators
    class InstallGenerator < Rails::Generators::Base

      desc "Installs required migrations for spree_essentials"

      def copy_migrations
        rake "spree_variant_options:install:migrations"
      end

      # def add_javascripts
      #   append_file "vendor/assets/javascripts/spree/frontend/all.js", "//= require store/product_variant_options\n"
      #   append_file "vendor/assets/javascripts/spree/frontend/all.js", "//= require store/variant_options\n"
      # end
      #
      # def add_stylesheets
      #   inject_into_file "vendor/assets/stylesheets/spree/frontend/all.css", "*= require store/variant_options\n", :before => /\*\//, :verbose => true
      # end

      def add_preference
        inject_into_file "config/initializers/spree.rb", "Rails.application.config.spree.payment_methods << Spree::PaymentMethod::MercadoPagoPayment\n\n", :before => /Spree.config/, :verbose => true
      end

    end
  end
end

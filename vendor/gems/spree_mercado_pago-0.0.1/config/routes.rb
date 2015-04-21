Spree::Core::Engine.routes.append do

  resource :mercado_pago, only: [], controller: 'mercado_pago' do
    get 'pending'
    get 'callback'
    get 'failure'
  end

end

Rails.application.routes.draw do


  resource :pages do
    get 'home'
    get 'intro'
    get 'collections'
    get 'about'
    get 'stores'
  end
  root 'pages#home'
  mount Spree::Core::Engine, :at => '/store'
  Spree::Core::Engine.routes.draw do

  end

end

Rails.application.routes.draw do


root to: "pages#home"

  mount Spree::Core::Engine, :at => '/shop'

  resource :pages do 
    get 'home'
    get 'intro'
  end

  

end

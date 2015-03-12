Rails.application.routes.draw do



  mount Spree::Core::Engine, :at => '/'

  resource :pages do 
    get 'home'
    get 'intro'
    get 'collections'
    get 'about'
    get 'stores'
  end

  

end

Rails.application.routes.draw do



  mount Spree::Core::Engine, :at => '/'

  resource :pages do 
    get 'home'
    get 'intro'
  end

  

end

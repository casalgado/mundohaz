Rails.application.routes.draw do

  scope "(:locale)", locale: /en|es/ do
    resource :pages do
      get 'home'
      get 'intro'
      get 'collections'
      get 'about'
      get 'stores'
    end
    root 'pages#home'


    get '/cart_link',  to: 'spree/store#cart_link'

    get 'api/*other', :to => redirect { |params, request|
      path = "store" + request.env["ORIGINAL_FULLPATH"]
      "http://#{request.host_with_port}/#{path}"
    }

    get 'admin/*other', :to => redirect { |params, request|
      path = "/store" + request.env["ORIGINAL_FULLPATH"]
      "http://#{request.host_with_port}/#{path}"
    }
    mount Spree::Core::Engine, :at => '/store'
    Spree::Core::Engine.routes.draw do

    end
  end

end

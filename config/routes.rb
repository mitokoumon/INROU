Rails.application.routes.draw do
  devise_for :admins

  resource :users,only:[:show, :update, :edit] do
    resources :receivers,only:[:index, :show, :create, :destroy, :edit]
    resources :carts,only:[:index, :create, :destroy]
    resources :orders,only:[:index, :show, :new, :create]
    get '/orders/thanks' => 'orders#thanks'
    get '/orders/check' => 'orders#check'
    delete '/carts' => 'carts#destroy_all'
    get '/flag' => 'users#flag'
    patch '/user_flag' => 'users#update'
  end
    root 'tops#top'#test
    get "/about" => "tops#about"

  devise_for :users,skip:[:edit]


    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    end

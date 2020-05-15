Rails.application.routes.draw do

  devise_for :admins
  devise_for :users

  resource :users only:[:show, :edit, :update] do
    resources :receivers only:[:index, :show, :create, :destroy, :edit]
    resources :carts only:[:index, :create, :destroy]
    resources :orders only:[:index, :show, :new, :create]
    get '/orders/thanks' => 'orders#thanks'
    get '/orders/check' => 'orders#check'
    delete '/carts' => 'carts#destroy_all'
    get '/orders/check' => 'orders#check'
  end
    root 'tops#top'


    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    end

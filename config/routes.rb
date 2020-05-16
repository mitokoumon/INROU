Rails.application.routes.draw do


  devise_for :admins, skip: [:registrations], controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
}
  devise_for :users

  resource :admins do
    get '/top' => 'admins/tops#top'
  end

  resource :users,only:[:show, :update] do
    resources :receivers,only:[:index, :show, :create, :destroy, :edit]
    resources :carts,only:[:index, :create, :destroy]
    resources :orders,only:[:index, :show, :new, :create]

    get '/orders/thanks' => 'orders#thanks'
    get '/orders/check' => 'orders#check'
    delete '/carts' => 'carts#destroy_all'
    get '/user_flag' => 'users#user_flag'
    patch '/user_flag' => 'users#update'
  end
  get 'user/info/edit' =>'users#edit'
    root 'tops#top'#test


    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    end

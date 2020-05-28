
Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'users/registrations' }
  devise_for :admins, skip: [:registrations], controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
}#skip:は指定アクションを消すデバイスでしか使えず、デバイスのviewの_sherdから該当箇所を消す必要があったりするみたい
 #controllers:はコントローラーのディレクトリを指定できる。今回だとnamespaceに入れた方が早い気もする。


  resource :admins do
    get '/top' => 'admins/tops#top'
  end

  resource :users,only:[:show] do
    resources :receivers,only:[:index, :create, :destroy, :edit, :update]
    resources :carts,only:[:index, :update, :create, :destroy]
    resources :orders,only:[:index, :show, :new, :create]
    get '/order/thanks' => 'orders#thanks'
    get '/order/check' => 'orders#check'
    post '/order/check' => 'orders#create_test'
    delete '/carts' => 'carts#destroy_all'
    get '/flag' => 'users#flag'
    patch '/flag' => 'users#update'
  end

  resources :products,only:[:index, :show] do
    resource :bookmarks, only: [:create, :destroy]
  end
    resources :product_comments, only: [:create,:destroy]

    get '/product/judge' =>'products#judge'
    get 'user/info/edit' =>'users#edit'
    patch 'user/info' => 'users#update'
    root 'tops#top'#test
    get '/about' => 'tops#about'

  get 'user_root' => 'users#show'
  get "search" => "admins/users#search"

  namespace :admins do
    resources :users
    resources :categories,only:[:index, :edit, :create, :update]
    resources :products,except:[:destroy]
    resources :orders,only:[:index, :show, :update]
    get 'order/userjudge' => 'orders#userjudge'
    get 'order/topjudge' => 'orders#topjudge'
    resources :ordered_products,only:[:update, :create]
  end



    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    end
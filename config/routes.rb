Rails.application.routes.draw do

  get 'admin' => 'admin#index'
  put 'admin/:id' => 'admin#update'
  patch 'admin/:id' => 'admin#update'

  devise_for :users

  resources :products

  root 'products#index'

end

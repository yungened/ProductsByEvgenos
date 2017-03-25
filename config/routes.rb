Rails.application.routes.draw do

  get 'cart' => 'cart#index', as: 'cart'
  delete 'cart/:id' => 'cart#destroy', as: 'cart_des'
  get 'cart/add/:id' => 'cart#add', as: 'cart_add'
  patch 'cart/update/:id' => 'cart#update', as: 'cart_update'


  get 'admin' => 'admin#index'
  put 'admin/:id' => 'admin#update'
  patch 'admin/:id' => 'admin#update'
  get 'admin/edit_products' => 'admin#edit_products', as: 'edit_products'
  get 'admin/edit_categories' => 'admin#edit_categories', as: 'edit_categories'
  get 'admin/edit_users' => 'admin#edit_users', as: 'edit_users'
  get 'admin/banned/:id' => 'admin#banned', as: :banned_user

  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :orders
  resources :categories
  resources :products do
    resources :messages, only: [:new, :create, :destroy]
  end

  root 'products#index'

end

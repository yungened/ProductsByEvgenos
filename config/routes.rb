Rails.application.routes.draw do

  get 'cart' => 'cart#index', as: 'cart'
  delete 'cart/:id' => 'cart#destroy', as: 'cart_des'
  get 'cart/add/:id' => 'cart#add', as: 'cart_add'

  get 'admin' => 'admin#index'
  put 'admin/:id' => 'admin#update'
  patch 'admin/:id' => 'admin#update'
  get 'admin/edit_products' => 'admin#edit_products', as: 'edit_products'
  get 'admin/edit_categories' => 'admin#edit_categories', as: 'edit_categories'
  get 'admin/edit_users' => 'admin#edit_users', as: 'edit_users'

  devise_for :users


  resources :categories
  resources :products

  root 'products#index'

end

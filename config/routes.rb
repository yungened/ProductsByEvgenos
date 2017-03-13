Rails.application.routes.draw do

  get 'admin' => 'admin#index'
  put 'admin/:id' => 'admin#update'
  patch 'admin/:id' => 'admin#update'
  get 'admin/edit_products', to: 'admin#edit_products', as: 'edit_products'
  get 'admin/edit_categories', to: 'admin#edit_categories', as: 'edit_categories'
  get 'admin/edit_users', to: 'admin#edit_users', as: 'edit_users'

  devise_for :users


  resources :categories
  resources :products

  root 'products#index'

end

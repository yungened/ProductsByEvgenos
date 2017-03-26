Rails.application.routes.draw do
  resources :line_items
  resources :carts
  resources :orders
  resources :categories
  resources :products do
    resources :messages, only: [:new, :create, :destroy]
  end

  scope ':locale', locale: /#{ I18n.available_locales.join('|') }/ do
    get 'admin' => 'admin#index'
    put 'admin/:id' => 'admin#update'
    patch 'admin/:id' => 'admin#update'
    get 'admin/edit_products' => 'admin#edit_products', as: 'edit_products'
    get 'admin/edit_categories' => 'admin#edit_categories', as: 'edit_categories'
    get 'admin/edit_users' => 'admin#edit_users', as: 'edit_users'
    get 'admin/manage_orders' => 'admin#manage_orders', as: 'manage_orders'
    get 'admin/banned/:id' => 'admin#banned', as: :banned_user
    patch 'manage_orders/:id/:status' => 'orders#update', as: 'change_role'

    devise_for :users, :controllers => { registrations: 'registrations' }

    root 'products#index'
  end
  get '*path', to: redirect("/#{ I18n.default_locale }/%{path}")
  get '', to: redirect("/#{ I18n.default_locale }")
end

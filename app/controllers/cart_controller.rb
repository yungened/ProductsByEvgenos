class CartController < ApplicationController
  def index
    @cart = session[:cart] || {}
  end

  def add
    id = params[:id]
    cart = session[:cart] ||= {}
    cart[id] = (cart[id] || 0) + 1

    redirect_to products_path
  end

  def update
    id = params[:id]
    # qty = params[:qty]
    cart = session[:cart] ||= {}
    cart[id] = (cart[id] || 0) + 1

    redirect_to cart_path
  end

  def destroy
    id = params[:id]
    cart = session[:cart]

    cart.delete id

    redirect_to cart_path
  end

end

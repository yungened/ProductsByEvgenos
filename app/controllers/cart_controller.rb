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
    value = params[:qty]
    # cart = session[:cart] ||= {}
    # cart[id] = cart_params
    session[:cart].update(id=>value)

    redirect_to cart_path
  end

  def destroy
    id = params[:id]
    cart = session[:cart]

    cart.delete id

    redirect_to cart_path
  end

  private def cart_params
    params.require(:cart).permit(params[:qty])
  end
end

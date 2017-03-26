class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :set_locale
  before_action :current_cart
  private

  def set_locale
    I18n.locale = params[:locale] if params[:locale].present?
  end

  def default_url_options(options = {})
    { locale: I18n.locale }
  end


  def current_cart
    @cart = Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    session[:cart_id] = cart.id
    @cart = cart
    @cart
  end

end


class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize

  def index
    @products = Product.all
  end

  def update
  end

  private

  def authorize
    if !current_user.has_role? :admin
      render text:"No access for you!"
    end
  end
end

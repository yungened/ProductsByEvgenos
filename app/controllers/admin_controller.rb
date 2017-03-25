class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize

  def index
    @products = Product.all.size
    @categories = Category.all.size
    @users = User.all.size
    @orders = Order.all.size
  end

  def edit_products
    @products = Product.all.paginate(page: params[:page], per_page: 7)
  end

  def edit_categories
    @categories = Category.all.paginate(page: params[:page], per_page: 7)
  end

  def edit_users
    @users = User.all.paginate(page: params[:page], per_page: 7)
  end

  def update
    @user = User.find(params[:id])
    @user.remove_role @user.roles.first.name
    @new_role = params[:role]
    @user.add_role @new_role
    redirect_to edit_users_path
  end

  def banned
    @user = User.find(params[:id])

    case
      when @user.banned? || @user.deleted?
        @user.active!
      when @user.active?
        @user.banned!
    end

    redirect_to edit_users_path
  end

  private

  def authorize
    if !current_user.has_role? :admin
      render text:"No access for you!"
    end
  end
end

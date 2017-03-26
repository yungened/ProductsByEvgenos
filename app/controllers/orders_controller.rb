class OrdersController < ApplicationController
  load_and_authorize_resource

  def new
    @order = Order.new
  end

  def create
    @order = current_user.orders.new
    @order.cart = @cart

    @cart = Cart.create
    session[:cart_id] = @cart.id

    if @order.save
      redirect_to root_path, :notice => 'Your order was successfully.'
    else
      render 'new'
    end
  end

  def update
    @order = Order.find(params[:id])
    new_status = params[:status].to_i
    @order.update(status: new_status)

    redirect_to manage_orders_path
  end

  def index
    @orders = current_user.orders.paginate(page: params[:page], per_page: 9)
  end

  def show
    @order = Order.find(params[:id])
  end

end

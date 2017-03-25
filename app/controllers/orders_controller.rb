class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)

    if(@order.save)
      redirect_to edit_products_path
    else
      render 'show'
    end
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def index
  end

  def show
    @order = Order.find(params[:id])
  end

  private
  def order_params
    params.require(:order).permit(:user_id)
  end
end

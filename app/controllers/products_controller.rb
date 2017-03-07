class ProductsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource


  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if(@product.save)
      redirect_to admin_path
    else
      render 'new'
    end
  end

  def update
    @product = Product.find(params[:id])

    if(@product.update(product_params))
      redirect_to @product
    else
      render 'edit'
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def destroy
    @product = Product.find(params[:id]).destroy

    redirect_to admin_path
  end

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  private def product_params
    params.require(:product).permit(:title, :description, :price, :image)
  end
end

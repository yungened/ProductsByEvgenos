class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
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

    redirect_to root_path
  end

  def index
    @products = Product.all.paginate(page: params[:page], per_page: 9)
  end

  def show
    @product = Product.find(params[:id])
  end

  private def product_params
    params.require(:product).permit(:title, :description, :price, :image, :category_id)
  end
end

class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  load_and_authorize_resource


  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if(@product.save)
      redirect_to edit_products_path
    else
      render 'new'
    end
  end

  def update
    @product = Product.find(params[:id])

    if(@product.update(product_params))
      redirect_to edit_products_path
    else
      render 'edit'
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def destroy
    Product.find(params[:id]).destroy
    id = params[:id]
    cart = session[:cart]

    cart.delete id
    redirect_to edit_products_path
  end

  def index
    @search = Product.search(params[:q])
    @products = @search.result.paginate(page: params[:page], per_page: 9)
  end

  def show
    @product = Product.find(params[:id])
    @messages = @product.messages.paginate(page: params[:page], per_page: 7)
  end

  private
  def product_params
    params.require(:product).permit(:title, :description, :price, :qty, :image, :category_id)
  end
end

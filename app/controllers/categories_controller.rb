class CategoriesController < ApplicationController

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if(@category.save)
      redirect_to edit_categories_path
    else
      render 'new'
    end
  end

  def update
    @category = Category.find(params[:id])

    if(@category.update(category_params))
      redirect_to @category
    else
      render 'edit'
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def destroy
    Category.find(params[:id]).destroy

    redirect_to edit_categories_path
  end

  def show
    @category = Category.find(params[:id])
    @products = @category.products.paginate(page: params[:page], per_page: 9)
  end

  private def category_params
    params.require(:category).permit(:title)
  end
end

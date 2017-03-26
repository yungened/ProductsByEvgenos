class LineItemsController < ApplicationController
  before_action :set_line_item, only: [:update, :destroy]

  def new
    @line_item = LineItem.new
  end

  def create
    product = Product.find(params[:product_id])
    @line_item = @cart.add_product(product.id)
    respond_to do |format|
      if @line_item.save
        format.html { redirect_to products_url }
        format.js
      else
        format.html { render action: 'new' }
        format.json { render json: @line_item.errors,
                             status: :unprocessable_entity }
      end
    end
  end

  def update
    @line_item.update(line_item_params)

    redirect_to carts_path, notice: 'Line item was successfully updated.'
  end

  def destroy
    @line_item.destroy
    respond_to do |format|
      format.js
    end
  end

  private
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    def line_item_params
      params.require(:line_item).permit(:product_id, :quantity)
    end
end

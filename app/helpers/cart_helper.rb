module CartHelper
  def get_product_by_id id
    Product.find(id)
  end
end

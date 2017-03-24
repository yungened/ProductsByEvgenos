module ApplicationHelper
  def full_title(page_title = '')
    base_title = 'Shop'
    if page_title.empty?
      base_title
    else
      page_title + ' | ' + base_title
    end
  end

  def get_cart_size
    cart_size = session[:cart] ||= 0
    unless cart_size == 0
      cart_size.values.size
    else
      cart_size
    end
  end

end

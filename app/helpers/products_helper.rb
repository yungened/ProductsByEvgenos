module ProductsHelper

  def get_avr_stars(messages)
    return 0.0 if messages.count == 0

    messages.sum(:rating).to_f / messages.size
  end

end

module ApplicationHelper
  def cart_count
    return 0 unless session[:cart].present?
    session[:cart].values.sum
  end

  def cart_has_items?
    cart_count > 0
  end
end

module CartHelper
  def current_cart
    current_user.try(:current_cart)
  end
end

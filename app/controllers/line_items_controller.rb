class LineItemsController < ApplicationController

  def create
    cart = (current_user.current_cart ||= current_user.carts.create!(user_id: current_user.id))
    cart.add_item(params[:item_id]).save
    current_user.save
    redirect_to cart_path(cart)
  end

end

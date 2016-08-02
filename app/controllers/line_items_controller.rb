require 'pry'
class LineItemsController < ApplicationController
  #before actions make sure a user is logged in and refactor
  
  def create
    if current_user.current_cart.nil?
      current_user.current_cart = current_user.carts.create!(user_id: current_user.id)
    end
      current_user.current_cart.add_item(params[:item_id]).save
      current_user.save
      redirect_to cart_path(current_user.current_cart)
  end

end

class CartsController < ApplicationController
  before_action :set_cart

  def show
  end

  def checkout
    @user = current_user
    update_inventory
    @cart.update(status: "submitted")
    @user.current_cart = nil
    @user.save
    redirect_to :back
  end

  private

  def update_inventory
    @cart.line_items.each do |i|
      item = Item.find(i.item_id)
      item.inventory -= i.quantity
      item.save
    end
  end

  def set_cart
    @cart = Cart.find(params[:id])
  end

end

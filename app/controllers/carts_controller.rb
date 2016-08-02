require 'pry'
class CartsController < ApplicationController

  def show
    @cart = Cart.find(params[:id])
  end

  def checkout
    #binding.pry
    @cart = Cart.find(params[:id])
    @user = current_user
    #update inventory
    update_inventory
    #change cart status
    @cart.update(status: "submitted")
    #current_cart be nil
    @user.current_cart = nil
    @user.save
    #current_user.current_cart.save
    redirect_to :back
  end

  private

  def update_inventory
    #use line_items to determine quantity of an item and item_id
    #@cart = current_cart
    @cart.line_items.each do |i|
      item = Item.find(i.item_id)
      item.inventory -= i.quantity
      #binding.pry
      item.save
    end
    #item to subtract quantity from its inventory
    #save item
  end

end

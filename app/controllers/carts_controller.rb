class CartsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def create
    @item = Item.find(params[:item_id])
    @cart.add_item(params[:item_id])
    session[:cart] = @cart.contents
<<<<<<< HEAD
    flash[:success] = "You now have #{pluralize(session[:cart][@item.id.to_s], @item.title)} in your cart"
    redirect_to bike_shop_path
=======
    flash[:success] = "You now have #{pluralize(session[:cart][item.id.to_s], item.title)} in your cart"
    redirect_to items_path
>>>>>>> remove item slug, change bike-shop routes to items, add admin item edit view action and tests
  end

  def remove_item
    item = Item.find(params[:item_id])
    if @cart.remove_item(params[:item_id])
      flash[:notice] = "Successfully removed #{item.title} from your cart"
      session[:cart].delete(params[:item_id])
    else
      flash[:error] = "Seomthing went wrong. Try again?"
    end
    redirect_to '/cart'
  end
end

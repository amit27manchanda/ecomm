class CartItemsController < ApplicationController
 before_action :set_cart, only: [:create, :destroy]

 
 def create
 	@product= Product.find(params[:id])
 	@cart_item= @cart.add_product(@product)
  @cart_item.save
  redirect_to cart_item.cart
 
 end
 
  def destroy
  @cart_item = CartItem.find(params[:id])
  @cart_item.destroy
  redirect_to @cart
end  

  private
  def cart_item_params
    params.require(:cart_item).permit(:product_id, :cart_id)
  end

end
class AddOrdersToCartItems < ActiveRecord::Migration[5.1]
  def change
  	add_reference :cart_items, :order, index: true

  end
end

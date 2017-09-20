class CartItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart
  belongs_to :order , optional: :true
 
  def total_price
  product.price * quantity
  end

  def increase_product(product_id)
  current_item = cart_items.find_by(product_id: product_id)
   if current_item
    current_item.quantity += 1
    else
  end
   current_item
 end


end

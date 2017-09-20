class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy
 
 def total_price
 	cart_items.to_a.sum{|cart_item| cart_item.total_price}
 end 	
 
 def add_product(product)
  current_item = cart_items.find_by(product_id: product_id)
   if current_item
    current_item.quantity += 1
    else
    current_item = cart_items.build(:product_id => product_id)
  end
   current_item
 end

 

 def item_count
 	cart_items.count
 end
 

end

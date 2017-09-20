class OrdersController < ApplicationController
	
	def new
		@order= Order.new
	end

	def create
		@order= Order.new(order_params)
		@order.cart_items= set_cart.cart_items
		@order.save
		destroy_cart
		redirect_to root_path, notice: "Your order has been placed successfully!"
	end


	private 
	def order_params
	params.require(:order).permit(:name, :address, :mobile_number)
    end
end

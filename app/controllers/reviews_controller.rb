class ReviewsController < ApplicationController
	def new
	@product = Product.find(params[:product_id])
	@review = Review.new(product: @product)
	end
end

class ReviewsController < ApplicationController
  before_action :set_product
  before_action :authenticate_user!

	def new
	  @review = Review.new(product: @product)
	end

	def create
	  @review = current_user.reviews.build(review_params)
	  @review.product = @product
	  @review.save
	  redirect_to @product
	end

	def set_product
		@product = Product.find(params[:product_id])
	end

	def review_params
		params.require(:review).permit(:comment, :rating)
	end
end

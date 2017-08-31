class ProductsController < ApplicationController
	def new
   	@product = Product.new
   end

   def create
   	 @product= Product.new(product_params)
   	 if @product.save
   	 	redirect_to @product
   	 else
         flash[:danger] = @product.errors.full_messages.to_sentence
   	     render 'new'
   end
end

   def show
   	@product= Product.find(params[:id])
   end

   private
   def product_params
   	params.require(:product).permit(:name, :description, :price, :category, :image)
   end
end

class ProductsController < ApplicationController
  before_action :authenticate_user!
	def index
      @product=Product.all
   end
   
   def new
   	@product = Product.new
   end

   def create
   	 @product= Product.new(product_params)
   	 if @product.save
   	 	redirect_to @product
   	 else
   	     render 'new'
   end
end

   def show
   	@product= Product.find(params[:id])
      @reviews= Review.where(product_id: @product)
      if @reviews.blank?
         @avg_rating = 0
      else
         @avg_rating = @reviews.average(:rating).round(2)
      end
   end

   def search
      @products= Product.search(params)
   end

   def edit
      @product=Product.find(params[:id])
   end

   def update
      @product=Product.find(params[:id])
      @product.update(product_params)
      redirect_to @product
   end

   def destroy
    @product= Product.find(params[:id])
    @product.destroy
    redirect_to @product, :notice => "Your product has been deleted"
   end



   private
   def product_params
   	params.require(:product).permit(:name, :description, :price, :category, :image)
   end
end

class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
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
      @reviews= Review.where(product_id: @product)
      @questions= Question.where(product_id: @product)
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
   end

   def update
      @product.update(product_params)
      redirect_to @product
   end

   def destroy
    @product.destroy
    redirect_to @product
   end

   def add_to_cart
    @product= Product.find(params[:id])
    @cart.cart_items.create(product_id: @product.id, quantity: 1)
    redirect_to @cart
   end


   private

   def set_product
      @product = Product.find(params[:id])
    end

   def product_params
   	params.require(:product).permit(:name, :description, :price, :category, :image, :stock)
   end
end

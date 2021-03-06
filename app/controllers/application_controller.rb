class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_cart

  def destroy_cart
  	session[:cart_id]= nil
  end

  private

  def set_cart
  	@cart=Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
  	@cart=Cart.create
  	session[:cart_id]= @cart.id
  end



end

class AddUserProductToReviews < ActiveRecord::Migration[5.1]
  def change
  	add_reference :reviews, :product, index: true
  	add_reference :reviews, :user, index: true
  end
end

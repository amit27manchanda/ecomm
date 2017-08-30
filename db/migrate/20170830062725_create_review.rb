class CreateReview < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
    	t.string :comment
    	t.integer :rating
    end
  end
end

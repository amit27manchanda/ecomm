class CreateProduct < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
    	t.string :name
    	t.text :description
    	t.integer :price
    	t.string :category

    	t.timestamps
    end
  end
end

class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :name
      t.text :address
      t.string :mobile_number
      
      t.datetime :created_at
    end
  end
end

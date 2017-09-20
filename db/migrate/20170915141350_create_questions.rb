class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :content
      t.integer :user_id
      t.integer :product_id

      t.timestamps
    end
  end
end

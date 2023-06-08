class CreateCategory < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.integer :product_id
      t.string :name, null: false
    end
  end
end

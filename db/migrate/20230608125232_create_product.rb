class CreateProduct < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :description
      t.string :image
      t.integer :price
      t.integer :rating
 
    end
  end
end

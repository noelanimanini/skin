class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.string :image
      t.string :price
      t.string :brand
      t.timestamps
    end
  end
end

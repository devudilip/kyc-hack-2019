class CreateTableProductBasket < ActiveRecord::Migration[5.2]
  def change
     create_table :product_baskets do |t|
      t.integer :product_id
      t.string :name
      t.string :brand
      t.float :price
      t.string :qty
      t.string :status
      t.integer :user_id


      t.timestamps
  end
  end
end

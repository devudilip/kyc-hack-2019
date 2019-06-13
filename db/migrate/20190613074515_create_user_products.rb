class CreateUserProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :user_products do |t|
      t.integer :user_id
      t.string :products

      t.timestamps
    end
  end
end

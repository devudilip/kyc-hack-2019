class CreateBudgets < ActiveRecord::Migration[5.2]
  def change
    create_table :budgets do |t|
      t.integer :budget_price
      t.integer  :user_id

      t.timestamps
    end
  end
  
  def self.down
    drop_table :budgets
  end  
end

class AddAvatarColumnsToBudgets < ActiveRecord::Migration[5.2]
  def change
      add_column :budgets, :image, :string
      add_column :budgets, :list_of_items, :string 
  end
end

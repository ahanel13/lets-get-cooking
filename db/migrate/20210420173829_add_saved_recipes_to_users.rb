class AddSavedRecipesToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :saved_recipes, :uuid, unique: true, array: true, default: []
  end
end

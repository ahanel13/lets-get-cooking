class AddDescriptionToRecipes < ActiveRecord::Migration[6.1]
  def change
    add_column :recipes, :description, :text, null: false
  end
end

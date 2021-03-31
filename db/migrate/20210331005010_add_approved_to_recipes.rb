class AddApprovedToRecipes < ActiveRecord::Migration[6.1]
  def change
    add_column :recipes, :approved, :boolean, default: false
  end
end

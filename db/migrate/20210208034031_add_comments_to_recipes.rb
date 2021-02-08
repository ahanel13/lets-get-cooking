class AddCommentsToRecipes < ActiveRecord::Migration[6.1]
  def change
    add_reference :recipes, :comments, null: false, foreign_key: true, type: :uuid
  end
end

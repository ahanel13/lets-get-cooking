class AddRecipeToComments < ActiveRecord::Migration[6.1]
  def change
    add_reference :comments, :recipe, null: false, foreign_key: true, type: :uuid
  end
end

class AddRecipeToSteps < ActiveRecord::Migration[6.1]
  def change
    add_reference :steps, :recipe, null: false, foreign_key: true, type: :uuid
  end
end

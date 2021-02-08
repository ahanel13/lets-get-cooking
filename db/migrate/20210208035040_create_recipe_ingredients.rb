class CreateRecipeIngredients < ActiveRecord::Migration[6.1]
  def change
    create_table :recipe_ingredients, id: :uuid do |t|
      t.integer :quantity
      t.references :unit, null: false, foreign_key: true, type: :uuid
      t.references :ingredient, null: false, foreign_key: true, type: :uuid
      t.references :recipe, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end

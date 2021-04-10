class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes, id: :uuid do |t|
      t.string :name, null: false
      t.integer :preptime, null: false
      t.integer :cooktime, null: false
      t.integer :serving, null: false

      t.timestamps
    end
  end
end

class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes, id: :uuid do |t|
      t.string :name
      t.integer :preptime
      t.integer :cooktime
      t.integer :serving

      t.timestamps
    end
  end
end

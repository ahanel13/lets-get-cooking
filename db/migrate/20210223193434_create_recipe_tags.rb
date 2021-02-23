class CreateRecipeTags < ActiveRecord::Migration[6.1]
  def change
    create_table :recipe_tags, id: :uuid do |t|
      t.references :tag, null: false, foreign_key: true, type: :uuid
      t.references :recipe, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end

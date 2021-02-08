class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments, id: :uuid do |t|
      t.string :comment
      t.belongs_to :user, type: :uuid, index: true, foreign_key: true

      t.timestamps
    end
  end
end

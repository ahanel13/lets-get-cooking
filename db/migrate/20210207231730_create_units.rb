class CreateUnits < ActiveRecord::Migration[6.1]
  def change
    create_table :units, id: :uuid do |t|
      t.string :name
      t.string :abreviation

      t.timestamps
    end
  end
end

class CreateSteps < ActiveRecord::Migration[6.1]
  def change
    create_table :steps, id: :uuid do |t|
      t.string :instruction

      t.timestamps
    end
  end
end

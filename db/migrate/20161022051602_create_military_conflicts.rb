class CreateMilitaryConflicts < ActiveRecord::Migration[5.0]
  def change
    create_table :military_conflicts do |t|
      t.string :description
      t.timestamps
    end
  end
end

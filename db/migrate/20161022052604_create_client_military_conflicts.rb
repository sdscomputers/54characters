class CreateClientMilitaryConflicts < ActiveRecord::Migration[5.0]
  def change
    create_table :client_military_conflicts do |t|
      t.integer :client_id
      t.integer :military_conflict_id
      t.timestamps
    end
  end
end

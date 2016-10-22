class CreateClientBeds < ActiveRecord::Migration[5.0]
  def change
    create_table :client_beds do |t|
      t.integer :client_id
      t.integer :organization_id

      t.timestamps
    end
  end
end

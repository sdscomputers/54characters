class CreateClientEthnicities < ActiveRecord::Migration[5.0]
  def change
    create_table :client_ethnicities do |t|
      t.integer :client_id
      t.integer :ethnicity_id
      t.timestamps
    end
  end
end

class CreateReferrals < ActiveRecord::Migration[5.0]
  def change
    create_table :referrals do |t|
      t.integer :referring_organization_id
      t.integer :referred_organization_id
      t.integer :client_id
      t.integer :reffered_by_id
      t.boolean :confirmed_by_referred_organization
      t.string :status, precision: '1'
      t.timestamps
    end
  end
end

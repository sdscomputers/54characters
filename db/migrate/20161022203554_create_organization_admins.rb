class CreateOrganizationAdmins < ActiveRecord::Migration[5.0]
  def change
    create_table :organization_admins do |t|
      t.integer :organzation_id
      t.integer :user_id
      t.timestamps
    end
  end
end

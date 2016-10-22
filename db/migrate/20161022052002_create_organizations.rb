class CreateOrganizations < ActiveRecord::Migration[5.0]
  def change
    create_table :organizations do |t|
      t.string :organization_name
      t.string :address
      t.string :description
      t.string :email
      t.string :phone
      t.boolean :active
      t.timestamps
    end
  end
end

class OrganizationAddBeds < ActiveRecord::Migration[5.0]
  def change
    add_column :organizations, :max_beds, :integer, null: false, default: 0
    add_column :organizations, :client_bed_count, :integer, null: false, default: 0
  end
end

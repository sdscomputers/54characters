class AddMiltaryBranchDatesToClient < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :service_branch, :string, precision: 1
    add_column :clients, :service_start_date, :date
    add_column :clients, :service_end_date, :date
  end
end

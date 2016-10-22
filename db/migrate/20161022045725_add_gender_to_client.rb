class AddGenderToClient < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :gender, :string, precision: 1
  end
end

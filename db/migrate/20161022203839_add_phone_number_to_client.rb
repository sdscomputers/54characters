class AddPhoneNumberToClient < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :phone_number, :string
  end
end

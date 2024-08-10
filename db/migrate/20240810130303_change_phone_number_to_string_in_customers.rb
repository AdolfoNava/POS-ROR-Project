class ChangePhoneNumberToStringInCustomers < ActiveRecord::Migration[7.1]
  def change
    change_column :customers, :phone_number, :string
  end
end

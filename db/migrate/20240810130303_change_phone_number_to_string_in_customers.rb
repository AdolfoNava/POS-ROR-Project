# frozen_string_literal: true

class ChangePhoneNumberToStringInCustomers < ActiveRecord::Migration[7.1] # rubocop:disable Style/Documentation
  def change
    change_column :customers, :phone_number, :string
  end
end

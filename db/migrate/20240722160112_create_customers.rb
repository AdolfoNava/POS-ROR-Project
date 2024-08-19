# frozen_string_literal: true

class CreateCustomers < ActiveRecord::Migration[7.1] # rubocop:disable Style/Documentation
  def change
    create_table :customers do |t|
      t.integer :phone_number
      t.string :email
      t.string :last_name
      t.string :first_name
      t.string :address
      t.integer :orders_count

      t.timestamps
    end
  end
end

class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.float :price
      t.date :due_date
      t.integer :customer_id
      t.integer :employee_id
      t.string :payment_method
      t.string :status
      t.float :pre_paid
      t.integer :items_count

      t.timestamps
    end
  end
end

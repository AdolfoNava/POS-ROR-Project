class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.integer :quantity
      t.string :name
      t.float :price
      t.integer :order_id
      t.integer :option_id

      t.timestamps
    end
  end
end

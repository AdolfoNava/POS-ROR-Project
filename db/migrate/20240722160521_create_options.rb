class CreateOptions < ActiveRecord::Migration[7.1]
  def change
    create_table :options do |t|
      t.float :base_price
      t.string :name
      t.integer :category_id

      t.timestamps
    end
  end
end

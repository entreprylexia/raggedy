class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :number_of_items

      t.timestamps
    end
  end
end

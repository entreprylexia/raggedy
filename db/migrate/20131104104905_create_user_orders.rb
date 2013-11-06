class CreateUserOrders < ActiveRecord::Migration
  def change
    create_table :user_orders do |t|

      t.timestamps
    end
  end
end

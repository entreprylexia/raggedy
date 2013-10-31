class AddUserIdToProducts < ActiveRecord::Migration
  def change
    add_reference :products, :product, index: true
  end
end

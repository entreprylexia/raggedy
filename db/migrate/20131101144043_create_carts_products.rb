class CreateCartsProducts < ActiveRecord::Migration
  def change
    create_table :carts_products do |t|
      t.belongs_to :cart, index: true
      t.belongs_to :product, index: true
    end
  end
end

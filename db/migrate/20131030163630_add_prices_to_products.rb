class AddPricesToProducts < ActiveRecord::Migration
  def change
    add_column :products, :original_price, :decimal, :precision => 8, :scale => 2
    add_column :products, :asking_price, :decimal, :precision => 8, :scale => 2
  end
end

class AddSubSizeIdToProducts < ActiveRecord::Migration
  def change
    add_reference :products, :sub_size, index: true
  end
end

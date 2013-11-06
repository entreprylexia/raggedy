class AddSubCategoryIdToProducts < ActiveRecord::Migration
  def change
    add_reference :products, :sub_category, index: true
  end
end

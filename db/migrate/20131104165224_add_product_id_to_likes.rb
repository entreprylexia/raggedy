class AddProductIdToLikes < ActiveRecord::Migration
  def change
    add_reference :likes, :product, index: true
  end
end

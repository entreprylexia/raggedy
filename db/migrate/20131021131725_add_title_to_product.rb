class AddTitleToProduct < ActiveRecord::Migration
  def change
  	add_column :products, :title, :string
  	add_column :products, :text, :text
  end
end

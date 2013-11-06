class CreateSubSizes < ActiveRecord::Migration
  def change
    create_table :sub_sizes do |t|
    	t.string :name
    	t.belongs_to :size
      t.timestamps
    end
  end
end

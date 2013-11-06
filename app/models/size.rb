class Size < ActiveRecord::Base
    has_many :sub_sizes
    belongs_to :category
	has_many :products, through: :category

end

class SubCategory < ActiveRecord::Base
	belongs_to :category
	has_many :products

	def to_param
		name.parameterize
	end
end

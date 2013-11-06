class SubSize < ActiveRecord::Base
	belongs_to :size
	has_many :products
end

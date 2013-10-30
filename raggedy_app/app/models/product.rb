class Product < ActiveRecord::Base
	belongs_to :sub_category
	belongs_to :sub_size
	validates :title, presence: true,
                    length: { minimum: 3 }
    has_attached_file :image, styles: {thumb: '208 x 294>'},
								storage: :s3,
								bucket: 'raggedy_development'


	def discount 
	  discount = ((1-(asking_price/original_price))*100).to_i
	  "#{discount}%"
	end 
end

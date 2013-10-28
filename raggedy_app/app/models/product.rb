class Product < ActiveRecord::Base
	validates :title, presence: true,
                    length: { minimum: 3 }
    has_attached_file :image, styles: {thumb: '208 x 294>'}
end

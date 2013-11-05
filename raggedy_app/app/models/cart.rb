class Cart < ActiveRecord::Base
	has_and_belongs_to_many :products

  def count
    products.count
  end

  def empty!
  	products.clear
  end

end

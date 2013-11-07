class Cart < ActiveRecord::Base
	has_and_belongs_to_many :products

  def count
    products.count
  end

  def empty!
  	products.clear
  end

  def total
  	# products.map(&:asking_price)
  	products.map{|p| p.asking_price}.inject(&:+)
  end

end

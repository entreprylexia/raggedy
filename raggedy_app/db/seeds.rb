# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.delete_all
SubCategory.delete_all

clothing = Category.create(name: 'Clothing')
shoes = Category.create(name: 'Shoes')
bags = Category.create(name: 'Bags')

clothing.sub_categories = [ SubCategory.create(name: 'Dresses'),
							SubCategory.create(name: 'Tops'),
							SubCategory.create(name: 'Jeans') ]

shoes.sub_categories = [ SubCategory.create(name: 'Heels'),
							SubCategory.create(name: 'Flats'),
							SubCategory.create(name: 'Trainers') ]

bags.sub_categories = [ SubCategory.create(name: 'Shoulder Bags'),
							SubCategory.create(name: 'Purses') ]


Size.delete_all
SubSize.delete_all 

clothing_size = Size.create(name: 'Clothing Size')
shoe_size = Size.create(name: 'Shoe Size')

clothing_size.sub_sizes = [ SubSize.create(name: 'S'),
					   SubSize.create(name: 'M'),
					   SubSize.create(name: 'L') ]
					
shoe_size.sub_sizes = [ SubSize.create(name: '3.5'),
					SubSize.create(name: '4'),
					SubSize.create(name: '5'),
					SubSize.create(name: '6') ]






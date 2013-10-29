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
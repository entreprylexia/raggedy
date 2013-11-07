task :recalculate_likes => :environment do
	Product.update_all("likes_count=(Select count(*) 
	from likes where likes.product_id=products.id)")
end
# heroku run rake recalculate_likes
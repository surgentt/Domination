class CombineItemsInCart < ActiveRecord::Migration
  def up
  	# replace multiple items for a single course in a cart with a single item
  	Cart.all.each do |cart|
  		#count the number of each courses in a cart
  		sums = cart.line_items.group(:course_id).sum(:quantity)
  		sums.each do |course_id, quantity|
  			if quantity > 1
  				#remove individual items
  				cart.line_items.where(course_id: course_id).delete_all
  				#replace with a single item
  				item = cart.line_items.build(course_id: course_id)
  				item.quantity = quantity
  				item.save
  			end
  		end
  	end
  end

  def down
  	LineItem.where("quantity>1").each do |line_item|
  		line_item.quantity.times do
  			LineItem.create cart_id: line_item.cart_id,
  				course_id: line_item.course_id
  			end
  			line_item.destroy
  		end
  end
end

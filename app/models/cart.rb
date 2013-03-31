class Cart < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :line_items, dependent: :destroy

  #Check whether our list of items includes the course we're adding
  #If it does, it bumps the quantity and if it doesn't it builds a new LineItem:
  def add_course(course_id)
  	current_item=line_items.find_by_course_id(course_id)
  	if current_item
  		current_item.quantity += 1
  	else
  		current_item = line_items.build(course_id: course_id)
  	end
  	current_item
  end

  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end

  def total_credit
    line_items.to_a.sum { |item| item.total_credit }
  end

end

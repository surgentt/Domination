class LineItem < ActiveRecord::Base
  attr_accessible :cart_id, :course_id
  belongs_to :course
  belongs_to :cart

  def total_price
    course.price * quantity
  end

  def total_credit
    course.credit * quantity
  end
end

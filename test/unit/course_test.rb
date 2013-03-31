require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  fixtures :courses
  test "course attributes must not be empty" do
    course = Course.new
    assert course.invalid?
    assert course.errors[:title].any?
    assert course.errors[:description].any?
    assert course.errors[:price].any?
    assert course.errors[:credit].any?
  end
end

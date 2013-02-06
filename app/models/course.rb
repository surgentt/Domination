class Course < ActiveRecord::Base
  attr_accessible :title, :author, :content, :credit, :description, :pdf, :photo, :price, :survey_id

  validates :title, :description, :price, :credit, presence: true
  validates :title, uniqueness: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :credit, numericality: {greater_than_or_equal_to: 0}
  
  has_attached_file :photo
  has_attached_file :pdf
                  
  validates_attachment_content_type :pdf,
    :content_type => [ 'application/pdf' ],
    :message => "only pdf files are allowed"

end

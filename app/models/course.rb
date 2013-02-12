class Course < ActiveRecord::Base
  attr_accessible :title, :author, :content, :credit, :description, :document, :photo, :price, :survey_id

  validates :title, :description, :price, :credit, :author, presence: true
  validates :title, uniqueness: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :credit, numericality: {greater_than_or_equal_to: 0}
  
  has_attached_file :photo
                  
  has_attached_file :document
  
  validates_attachment_content_type :document,
    :content_type => [ 'application/pdf' ],
    :message => "only pdf files are allowed"

  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png', 'image/jpg']

end

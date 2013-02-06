class AddAttachmentsToCourses < ActiveRecord::Migration
  def self.up
  	change_table :courses do |t|
      t.attachment :photo
      t.attachment :pdf
  	end
  end

  def self.down
  	drop_attached_file :courses, :photo
  	drop_attached_file :courses, :pdf
  end
end
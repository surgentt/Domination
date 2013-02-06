class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title
      t.string :author
      t.text :description
      t.text :content
      t.decimal :price, precision: 8, scale: 2
      t.decimal :credit, precision: 5
      t.integer :survey_id

      t.timestamps
    end
  end
end

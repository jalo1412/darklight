class CreateLectureCourseEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :lecture_course_entries do |t|
      t.integer :number, :default => @numberoflectures
      t.date :date
      t.time :time
      t.text :description
      t.references :Lecture_course, foreign_key: true
      t.timestamps
    end
  end
end

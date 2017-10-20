class CreateLectureCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :lecture_courses do |t|
      t.references :Course, foreign_key: true
      t.references :Lecture, foreign_key: true

      t.timestamps
    end
  end
end

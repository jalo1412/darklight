class CreateAttendances < ActiveRecord::Migration[5.1]
  def change
    create_table :attendances do |t|
      t.references :Status_of_attendance, foreign_key: true
      t.references :Lecture_course_entry, foreign_key: true
      t.references :Student, foreign_key: true

      t.timestamps
    end
  end
end

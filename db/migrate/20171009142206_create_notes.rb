class CreateNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :notes do |t|
      t.date :date
      t.string :description
      t.references :Student, foreign_key: true
      t.references :Lecture_course, foreign_key: true

      t.timestamps
    end
  end
end

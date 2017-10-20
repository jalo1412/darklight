class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.string :level
      t.string :section
      t.integer :graduation_year
      t.references :Teacher, foreign_key: true

      t.timestamps
    end
  end
end

class CreateEvaluations < ActiveRecord::Migration[5.1]
  def change
    create_table :evaluations do |t|
      t.date :date
      t.string :title
      t.string :content
      t.references :Type_of_evaluation, foreign_key: true
      t.references :Lecture_course, foreign_key: true

      t.timestamps
    end
  end
end

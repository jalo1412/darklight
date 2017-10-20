class CreateGrades < ActiveRecord::Migration[5.1]
  def change
    create_table :grades do |t|
      t.integer :grade
      t.references :Evaluation, foreign_key: true
      t.references :Student, foreign_key: true

      t.timestamps
    end
  end
end

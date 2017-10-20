class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :name
      t.string :last_name
      t.string :matricule_number
      t.string :blood_type
      t.string :allergy
      t.references :Parent, foreign_key: true
      t.references :Course, foreign_key: true

      t.timestamps
    end
  end
end

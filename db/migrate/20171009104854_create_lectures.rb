class CreateLectures < ActiveRecord::Migration[5.1]
  def change
    create_table :lectures do |t|
      t.integer :year
      t.string :name
      t.string :program
      t.string :level
      t.references :Teacher, foreign_key: true

      t.timestamps
    end
  end
end

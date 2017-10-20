class CreateTypeOfEvaluations < ActiveRecord::Migration[5.1]
  def change
    create_table :type_of_evaluations do |t|
      t.string :name
      t.integer :weight

      t.timestamps
    end
  end
end

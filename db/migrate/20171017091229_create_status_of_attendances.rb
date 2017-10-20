class CreateStatusOfAttendances < ActiveRecord::Migration[5.1]
  def change
    create_table :status_of_attendances do |t|
      t.string :status

      t.timestamps
    end
  end
end

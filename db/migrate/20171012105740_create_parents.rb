class CreateParents < ActiveRecord::Migration[5.1]
  def change
    create_table :parents do |t|
      t.string :name
      t.string :email
      t.string :mobil_phone
      t.references :User, foreign_key: true

      t.timestamps
    end
  end
end

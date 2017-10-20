class CreateTypeOfUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :type_of_users do |t|
      t.string :type_of_user

      t.timestamps
    end
  end
end

class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :mob_no
      t.string :password_digest
      t.string :dob
      t.string :city

      t.timestamps
    end
  end
end

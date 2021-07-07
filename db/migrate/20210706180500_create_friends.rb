class CreateFriends < ActiveRecord::Migration[6.1]
  def change
    create_table :friends do |t|
      t.integer :user_id
      t.integer :friend_id
      t.string :status, default: :pending

      t.timestamps
    end
    add_index :friends, :user_id
    add_index :friends, :friend_id
    add_index :friends, %i[friend_id user_id], unique: true
  end
end

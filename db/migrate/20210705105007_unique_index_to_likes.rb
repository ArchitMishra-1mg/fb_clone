class UniqueIndexToLikes < ActiveRecord::Migration[6.1]
  def change
    add_index :likes, %i[User_id Post_id], unique: true
  end
end

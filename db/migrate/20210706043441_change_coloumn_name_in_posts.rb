class ChangeColoumnNameInPosts < ActiveRecord::Migration[6.1]
  def change
    rename_column :posts, :likes, :nLikes
    rename_column :posts, :comments, :nComments
  end
end

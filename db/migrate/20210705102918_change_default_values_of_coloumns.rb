class ChangeDefaultValuesOfColoumns < ActiveRecord::Migration[6.1]
  def change
    change_column_default :posts, :likes, 0
    change_column_default :posts, :comments, 0
  end
end

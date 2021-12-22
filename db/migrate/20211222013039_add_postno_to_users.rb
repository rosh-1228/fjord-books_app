class AddPostnoToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :Postno, :text
  end
end

class AddPostnoToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :post_no, :text
  end
end

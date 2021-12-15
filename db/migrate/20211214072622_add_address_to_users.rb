class AddAddressToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :Address, :varchar
  end
end

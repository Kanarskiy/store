class AddUsernameToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :username, :string
    add_index :customers, :username, unique: true
  end
end

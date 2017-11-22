class AddUsernameToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :username, :string
    rename_column :users, :name, :first_name
    add_column :users, :last_name, :string
  end
end

class ChangeContactToFollow < ActiveRecord::Migration[5.1]
  def change
    rename_table :user_contacts, :user_follows
  end
end

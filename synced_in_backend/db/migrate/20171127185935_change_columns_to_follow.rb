class ChangeColumnsToFollow < ActiveRecord::Migration[5.1]
  def change
    rename_column :user_follows, :user_id, :following_id
    rename_column :user_follows, :contact_id, :followed_id
  end
end

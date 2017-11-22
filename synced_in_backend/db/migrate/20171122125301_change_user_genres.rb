class ChangeUserGenres < ActiveRecord::Migration[5.1]
  def change
    rename_table :user_genres, :skills
  end
end

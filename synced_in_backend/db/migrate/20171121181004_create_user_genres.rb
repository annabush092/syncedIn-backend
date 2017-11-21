class CreateUserGenres < ActiveRecord::Migration[5.1]
  def change
    create_table :user_genres do |t|
      t.integer :user_instrument_id
      t.integer :genre_id
      t.boolean :perform
      t.boolean :teach
    end
  end
end

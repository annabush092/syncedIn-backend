class Genre < ApplicationRecord

  has_many :user_genres
  has_many :user_instruments, through: :user_genres
  has_many :users, through: :user_instruments

end

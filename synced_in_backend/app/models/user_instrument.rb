class UserInstrument < ApplicationRecord

  belongs_to :user
  belongs_to :instrument

  has_many :user_genres
  has_many :genres, through: :user_genres

end

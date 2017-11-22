class Skill < ApplicationRecord

  belongs_to :user_instrument
  belongs_to :genre

  validates :user_instrument_id, uniqueness: {scope: :genre_id}
  validates :genre_id, uniqueness: {scope: :user_instrument_id}

end

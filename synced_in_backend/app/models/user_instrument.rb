class UserInstrument < ApplicationRecord

  belongs_to :user
  belongs_to :instrument

  has_many :skills
  has_many :genres, through: :skills

  validates :instrument_id, uniqueness: {scope: :user_id}
  validates :user_id, uniqueness: {scope: :instrument_id}

end

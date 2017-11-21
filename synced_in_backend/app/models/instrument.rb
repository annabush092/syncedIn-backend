class Instrument < ApplicationRecord

  belongs_to :family

  has_many :user_instruments
  has_many :users, through: :user_instruments

end

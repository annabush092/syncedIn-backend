class User < ApplicationRecord

  has_many :user_contacts
  has_many :contacts, through: :user_contacts

  has_many :user_instruments
  has_many :instruments, through: :user_instruments

  has_many :user_genres, through: :user_instruments
  has_many :genres, through: :user_genres

end

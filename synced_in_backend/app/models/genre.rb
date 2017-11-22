class Genre < ApplicationRecord

  has_many :skills
  has_many :user_instruments, through: :skills
  has_many :users, through: :user_instruments

  validates :name, presence: true, uniqueness: true


end

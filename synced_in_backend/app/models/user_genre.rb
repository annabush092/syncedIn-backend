class UserGenre < ApplicationRecord

  belongs_to :user_instrument 
  belongs_to :genre

end

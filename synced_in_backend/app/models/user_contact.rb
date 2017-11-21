class UserContact < ApplicationRecord

  belongs_to: :user
  belongs_to: :contact, class: "User"

end

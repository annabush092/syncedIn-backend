class UserContact < ApplicationRecord

  belongs_to :user
  belongs_to :contact, class_name: "User"

  validates :user_id, uniqueness: {scope: :contact_id}
  validates :contact_id, uniqueness: {scope: :user_id}

end

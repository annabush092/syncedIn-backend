class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :full_name, :show_skills, :users_i_am_following, :picture_url
end

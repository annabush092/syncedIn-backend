class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :full_name, :show_skills
end

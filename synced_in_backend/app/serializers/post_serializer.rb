class PostSerializer < ActiveModel::Serializer
  attributes :id, :content, :user_id, :tags
end

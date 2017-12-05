class PostSerializer < ActiveModel::Serializer
  attributes :id, :content, :user_id, :time_published, :tags
end

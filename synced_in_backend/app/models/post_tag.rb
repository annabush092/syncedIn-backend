class PostTag < ApplicationRecord

  belongs_to :post
  belongs_to :tag

  validates :post_id, uniqueness: {scope: :tag_id}
  validates :tag_id, uniqueness: {scope: :post_id}

end

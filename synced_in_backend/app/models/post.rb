class Post < ApplicationRecord

  belongs_to :user
  has_many :post_tags
  has_many :tags, through: :post_tags

  validates :content, presence: true

  def time_published
    my_time = self.created_at
    if(my_time)
      my_time.to_f * 1000
    else
      (DateTime.new(2017, 12, 1, 12, 00, 00)).to_f * 1000
    end
  end

end

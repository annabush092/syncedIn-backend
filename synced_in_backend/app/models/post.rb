class Post < ApplicationRecord

  belongs_to :user
  has_many :post_tags
  has_many :tags, through: :post_tags

  validates :content, presence: true

  def time_published
    if(self.created_at)
      "#{self.created_at.strftime("%B")} #{self.created_at.day}, #{self.created_at.year}"
    else
      "No date provided"
    end
  end

end

class Post < ApplicationRecord

  belongs_to :user
  has_many :post_tags
  has_many :tags, through: :post_tags

  validates :content, presence: true

  def time_published
    my_time = self.created_at
    if(my_time)
      "#{my_time.year}/#{my_time.strftime("%B")}/#{my_time.day}/#{my_time.hour - 5}/#{my_time.min}/#{my_time.sec}"
    else
      "2017/December/1/12/00/00"
    end
  end

end

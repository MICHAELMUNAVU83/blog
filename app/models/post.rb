class Post < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: :user_id
  has_many :comments
  has_many :likes
  validates :title, presence: true, length: { maximum: 250 }
  validates :postscounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likescounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def last_five_comments
    comments.last(5)
  end

  def posts_counter
    user.increment!(:postscounter)
  end
end

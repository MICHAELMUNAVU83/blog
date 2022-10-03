class User < ApplicationRecord
  has_many :posts, foreign_key: :user_id
  has_many :comments, foreign_key: :user_id
  has_many :likes, foreign_key: :user_id
  validates :name, presence: true
  validates :postscounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def last_three_post
    posts.includes(:user).order(created_at: :DESC).limit(3)
  end
end

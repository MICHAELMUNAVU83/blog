class User < ApplicationRecord
  has_many :posts, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id
  has_many :likes, foreign_key: :author_id
  validates :name, presence: true 

  def last_three_post
    posts.last(3)
  end
end

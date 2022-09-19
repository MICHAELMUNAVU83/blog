after_save :update_post_counter
class Post < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: :author_id
  has_many :comments
  has_many :likes

  def last_five_comments
    comments.last(5)
  end

  def posts_counter
    user.increment!(:posts_counter)
  end
end

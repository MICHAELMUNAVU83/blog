class Like < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :post, class_name: 'Post'
  after_save :likes_counter

  def likes_counter
    post.increment!(:likescounter)
  end
end

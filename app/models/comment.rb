class Comment < ApplicationRecord
  belongs_to :author
  belongs_to :post
  def comments_counter
    post.increment!(:comments_counter)
  end
end

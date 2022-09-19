class Like < ApplicationRecord
  belongs_to :author
  belongs_to :post

  def likes_counter
    post.increment!(:likes_counter)
  end
end

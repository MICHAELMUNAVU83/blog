require 'rails_helper'
RSpec.describe Comment, type: :model do
  comment = Comment.new
  it 'Comments should be not be Valid with no parameters' do
    expect(comment).to_not be_valid
  end
  it 'User counter to increment' do
    comment.post = Post.new(title: 'Post 1', text: 'This is the post one')
    comment.send(:comments_counter)
    expect(comment.post.commentscounter).to be(1)
  end
end

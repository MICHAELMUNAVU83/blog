require 'rails_helper'
RSpec.describe Like, type: :model do
  like = Like.new
  it 'Likes should be not be Valid with no parameters' do
    expect(like).to_not be_valid
  end
  it 'User countr to increment' do
    like.post = Post.new(title: 'Post One', text: 'This is the post one')
    like.send(:likes_counter)
    expect(like.post.likescounter).to be(1)
  end
end

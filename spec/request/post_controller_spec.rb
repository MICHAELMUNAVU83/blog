require 'rails_helper'

RSpec.describe 'Posr Tests', type: :request do
  context 'Index' do
    before(:each) do
      @user = User.create(id: 1, name: 'kim', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                          bio: 'Teacher from Mexico.', postscounter: 8)

      get '/users/1/posts'
    end
    it 'Correct template was rendered.' do
      expect(response).to render_template(:index)
    end
    it 'Response status was correct.' do
      expect(response).to have_http_status(:ok)
    end
  end
  context 'Show' do
    before(:each) do
      @user = User.create(id: 1, name: 'kim', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                          bio: 'Teacher from Mexico.', postscounter: 8)
      @post = Post.create(id: 1, title: 'Post 1', text: 'This is the post one', postscounter: 8, likescounter: 5,
                          commentscounter: 7, user_id: 1)
      get '/users/1/posts/1'
    end
    it 'Correct template was rendered' do
      expect(response).to render_template(:show)
    end
    it 'Response status was correct.' do
      expect(response).to have_http_status(:ok)
    end
  end
end

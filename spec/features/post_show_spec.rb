require 'rails_helper'

RSpec.describe 'User Post features' do
  it 'displays the posts title' do
    mike = User.create(name: 'Mike', photo: 'https://man.jpg', bio: 'Teacher from Poland.', postscounter: 9)
    post = Post.create(user: mike, title: 'Post 1', text: 'text for 1', postscounter: 6, likescounter: 5,
                       commentscounter: 2)
    visit user_post_path(mike, post)
    expect(page).to have_content('Post 1')
  end
  it 'displays the posts text body' do
    mike = User.create(name: 'Mike', photo: 'https://man.jpg', bio: 'Teacher from Poland.', postscounter: 9)
    post = Post.create(user: mike, title: 'Post 1', text: 'text for 1', postscounter: 6, likescounter: 5,
                       commentscounter: 2)
    visit user_post_path(mike, post)
    expect(page).to have_content('text for 1')
  end
  it 'shows who wrote the post' do
    mike = User.create(name: 'Mike', photo: 'https://man.jpg', bio: 'Teacher from Poland.', postscounter: 9)
    post = Post.create(user: mike, title: 'Post 1', text: 'text for 1', postscounter: 6, likescounter: 5,
                       commentscounter: 2)
    visit user_post_path(mike, post)
    expect(page).to have_content('Mike')
  end
  it 'shows the number of comments for the post' do
    mike = User.create(name: 'Mike', photo: 'https://man.jpg', bio: 'Teacher from Poland.', postscounter: 9)
    post = Post.create(user: mike, title: 'Post 1', text: 'text for 1', postscounter: 6, likescounter: 5,
                       commentscounter: 2)
    visit user_post_path(mike, post)
    expect(page).to have_content(2)
  end
  it 'shows the number of likes for the post' do
    mike = User.create(name: 'Mike', photo: 'https://man.jpg', bio: 'Teacher from Poland.', postscounter: 9)
    post = Post.create(user: mike, title: 'Post 1', text: 'text for 1', postscounter: 6, likescounter: 5,
                       commentscounter: 2)
    visit user_post_path(mike, post)
    expect(page).to have_content(5)
  end
  it 'shows the username for each comment' do
    mike = User.create(name: 'Mike', photo: 'https://man.jpg', bio: 'Teacher from Poland.', postscounter: 9)
    post = Post.create(user: mike, title: 'Post 1', text: 'text for 1', postscounter: 6, likescounter: 5,
                       commentscounter: 2)
    Comment.create(user: mike, post: post, text: 'comment 1')
    visit user_post_path(mike, post)
    expect(page).to have_content('Mike')
  end
  it 'shows the comment for each commentor' do
    mike = User.create(name: 'Mike', photo: 'https://man.jpg', bio: 'Teacher from Poland.', postscounter: 9)
    post = Post.create(user: mike, title: 'Post 1', text: 'text for 1', postscounter: 6, likescounter: 5,
                       commentscounter: 2)
    Comment.create(user: mike, post: post, text: 'comment 1')
    visit user_post_path(mike, post)
    expect(page).to have_content('comment 1')
  end
end

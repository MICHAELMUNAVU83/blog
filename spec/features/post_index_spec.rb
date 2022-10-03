require 'rails_helper'

RSpec.describe 'User Posts features' do
  it "displays a user's name" do
    mike = User.create(name: 'Mike', photo: 'https://man.jpg', bio: 'Teacher from Poland.', postscounter: 9)
    Post.create(user: mike, title: 'Post 1', text: 'text for 1', postscounter: 6, likescounter: 5,
                commentscounter: 2)
    visit user_posts_path(mike)
    expect(page).to have_content('Mike')
  end
  it "displays the user's photo and alt text" do
    mike = User.create(name: 'Mike', photo: 'https://man.jpg', bio: 'Teacher from Poland.', postscounter: 9)
    Post.create(user: mike, title: 'Post 1', text: 'text for 1', postscounter: 6, likescounter: 5,
                commentscounter: 2)
    visit user_posts_path(mike)
    find('img[alt="Mike"]')
  end
  it "displays the user's number of posts" do
    mike = User.create(name: 'Mike', photo: 'https://man.jpg', bio: 'Teacher from Poland.', postscounter: 9)
    Post.create(user: mike, title: 'Post 1', text: 'text for 1', postscounter: 6, likescounter: 5,
                commentscounter: 2)
    visit user_posts_path(mike)
    expect(page).to have_content(9)
  end
  it 'displays the posts titles' do
    mike = User.create(name: 'Mike', photo: 'https://man.jpg', bio: 'Teacher from Poland.', postscounter: 9)
    Post.create(user: mike, title: 'Post 1', text: 'text for 1', postscounter: 6, likescounter: 5,
                commentscounter: 2)
    visit user_posts_path(mike)
    expect(page).to have_content('Post 1')
  end
  it 'displays the posts text body' do
    mike = User.create(name: 'Mike', photo: 'https://man.jpg', bio: 'Teacher from Poland.', postscounter: 9)
    Post.create(user: mike, title: 'Post 1', text: 'text for 1', postscounter: 6, likescounter: 5,
                commentscounter: 2)
    visit user_posts_path(mike)
    expect(page).to have_content('text for 1')
  end
  it 'first comments for each post' do
    mike = User.create(name: 'Mike', photo: 'https://man.jpg', bio: 'Teacher from Poland.', postscounter: 9)
    post = Post.create(user: mike, title: 'Post 1', text: 'text for 1', postscounter: 6, likescounter: 5,
                       commentscounter: 2)
    5.times do
      Comment.create(user: mike, post: post, text: 'comment')
    end
    visit user_posts_path(mike)
    expect(page).to have_content('comment')
  end
  it 'shows the number of comments for each post' do
    mike = User.create(name: 'Mike', photo: 'https://man.jpg', bio: 'Teacher from Poland.', postscounter: 9)
    Post.create(user: mike, title: 'Post 1', text: 'text for 1', postscounter: 6, likescounter: 5,
                commentscounter: 2)
    visit user_posts_path(mike)
    expect(page).to have_content(2)
  end
  it 'shows the number of likes for each post' do
    mike = User.create(name: 'Mike', photo: 'https://man.jpg', bio: 'Teacher from Poland.', postscounter: 9)
    Post.create(user: mike, title: 'Post 1', text: 'text for 1', postscounter: 6, likescounter: 5,
                commentscounter: 2)
    visit user_posts_path(mike)
    expect(page).to have_content(5)
  end
  it 'has a section for pagination' do
    mike = User.create(name: 'Mike', photo: 'https://man.jpg', bio: 'Teacher from Poland.', postscounter: 9)
    visit user_posts_path(mike)
    expect(page).to have_content('Pagination')
  end
  it 'displays a link to see each post' do
    mike = User.create(name: 'Mike', photo: 'https://man.jpg', bio: 'Teacher from Poland.', postscounter: 9)
    Post.create(user: mike, title: 'Post 1', text: 'text for 1', postscounter: 6, likescounter: 5,
                commentscounter: 2)
    visit user_posts_path(mike)
    click_link('See Post')
    expect(page).to have_content('text for 1')
  end
end

require 'rails_helper'

RSpec.describe 'User Show features' do
  it "displays a user's name" do
    mike = User.create(name: 'Mike', photo: 'https://man.jpg', bio: 'Teacher from Poland.', postscounter: 9)
    visit user_path(mike)
    expect(page).to have_content('Mike')
  end
  it "displays the user's photo and alt text" do
    mike = User.create(name: 'Mike', photo: 'https://man.jpg', bio: 'Teacher from Poland.', postscounter: 9)
    visit user_path(mike)
    find('img[alt="Mike"]')
  end
  it 'displays the number of posts for the user' do
    mike = User.create(name: 'Mike', photo: 'https://man.jpg', bio: 'Teacher from Poland.', postscounter: 9)
    visit user_path(mike)
    expect(page).to have_content(9)
  end
  it 'displays the bio for the user' do
    mike = User.create(name: 'Mike', photo: 'https://man.jpg', bio: 'Teacher from Poland.', postscounter: 9)
    visit user_path(mike)
    expect(page).to have_content('Teacher from Poland')
  end
  it 'shows a users 3  most recent posts' do
    mike = User.create(name: 'Mike', photo: 'https://man.jpg', bio: 'Teacher from Poland.', postscounter: 9)
    Post.create(user: mike, title: 'Post 1', text: 'text for 1', postscounter: 6, likescounter: 5,
                commentscounter: 2)
    Post.create(user: mike, title: 'Post 2', text: 'text for 2', postscounter: 6, likescounter: 5,
                commentscounter: 2)
    Post.create(user: mike, title: 'Post 3', text: 'text for 3', postscounter: 6, likescounter: 5,
                commentscounter: 2)
    Post.create(user: mike, title: 'Post 4', text: 'text for 4', postscounter: 6, likescounter: 5,
                commentscounter: 2)

    visit user_path(mike)
    expect(page).to have_content('Post 2')
    expect(page).to have_content('Post 3')
    expect(page).to have_content('Post 4')
  end
  it 'displays a link to see all post for  of each user' do
    mike = User.create(name: 'Mike', photo: 'https://man.jpg', bio: 'Teacher from Poland.', postscounter: 9)
    visit user_path(mike)
    click_link('See all posts')
    expect(page).to have_content('Mike')
  end
  it 'displays a each post when see post button is clicked' do
    mike = User.create(name: 'Mike', photo: 'https://man.jpg', bio: 'Teacher from Poland.', postscounter: 9)
    Post.create(user: mike, title: 'Post 1', text: 'text for 1', postscounter: 6, likescounter: 5,
                commentscounter: 2)
    visit user_path(mike)
    click_link('See Post')
    expect(page).to have_content('text for 1')
  end
end

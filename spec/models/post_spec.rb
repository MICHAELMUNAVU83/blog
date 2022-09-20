require 'rails_helper'
RSpec.describe Post, type: :model do
  post1 = Post.new
  it 'is not valid without a title' do
    post = Post.new(title: nil)
    expect(post).to_not be_valid
  end
  it 'is not valid if title has more than 250 characters' do
    post = Post.new(title: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,
        molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum
        numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium
        optio, eaque rerum! Provident similique accusantium nemo autem. Veritatis
        obcaecati tenetur iure eius earum ut molestias architecto voluptate aliquam
        nihil, eveniet aliquid culpa officia aut! Impedit sit sunt quaerat, odit,
        tenetur error, harum nesciunt ipsum debitis quas aliquid. Reprehenderit,
        atis Voluptatem quaerat non architecto ab laudantium
        modi minima sunt esse temporibus sint culpa, recusandae aliquam numquams
        totam ratione voluptas quod exercitationem fuga. Possimus quis earum veniam
        quasi aliquam eligendi, placeat qui corporis!")
    expect(post).to_not be_valid
  end
  it 'is not valid if posts counter is not a number ' do
    post = Post.new(title: 'New post', postscounter: 'not a number')
    expect(post).to_not be_valid
  end
  it 'is not valid if likes counter is not a number ' do
    post = Post.new(title: 'New post', likescounter: 'not a number')
    expect(post).to_not be_valid
  end
  it 'is not valid if posts counter is less than 0 ' do
    post = Post.new(title: 'New post', postscounter: -1)
    expect(post).to_not be_valid
  end
  it 'is not valid if likes counter is less than 0 ' do
    post = Post.new(title: 'New post', likescounter: -1)
    expect(post).to_not be_valid
  end
  it 'Post like counter to increment' do
    post1.user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    post1.send(:posts_counter)
    expect(post1.user.postscounter).to be(1)
  end
end

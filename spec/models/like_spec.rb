require 'rails_helper'

RSpec.describe Like, type: :model do
  it 'likes_counter of post should update' do
    author = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    post = Post.new(author:, title: 'Hello', text: 'This is my first post')
    like = Like.new(author:, post:)
    author.save
    post.save
    like.save
    expect(post.likes_counter).to eq(1)
  end
end

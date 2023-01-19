require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'title must be present' do
    author = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    subject = Post.new(author: author, title: 'Hello', text: 'This is my first post')
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'title must be less than 250 chars' do
    author = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    subject = Post.new(author: author, title: 'Hello', text: 'This is my first post')
    subject.title = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
    aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
    aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
    aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
    aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'
    expect(subject).to_not be_valid
  end

  it 'user likes should not be negative' do
    author = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    subject = Post.new(author: author, title: 'Hello', text: 'This is my first post')
    subject.likes_counter = -1
    expect(subject).to_not be_valid
  end

  it 'nil should be allowed' do
    author = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    subject = Post.new(author: author, title: 'Hello', text: 'This is my first post')
    subject.likes_counter = nil
    expect(subject).to be_valid
  end

  it 'user comments should not be negative' do
    author = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    subject = Post.new(author: author, title: 'Hello', text: 'This is my first post')
    subject.comments_counter = -1
    expect(subject).to_not be_valid
  end

  it 'nil should be allowed' do
    author = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    subject = Post.new(author: author, title: 'Hello', text: 'This is my first post')
    subject.comments_counter = nil
    expect(subject).to be_valid
  end

  it 'recent comments should return the last 5' do
    author = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    subject = Post.new(author: author, title: 'Hello', text: 'This is my first post')
    author.save
    subject.save
    first_comment = Comment.new(post: subject, author: author, text: 'Hi Tom!' )
    second_comment = Comment.new(post: subject, author: author, text: 'Hi Tom!' )
    third_comment = Comment.new(post: subject, author: author, text: 'Hi Tom!' )
    fourth_comment = Comment.new(post: subject, author: author, text: 'Hi Tom!' )
    fifth_comment = Comment.new(post: subject, author: author, text: 'Hi Tom!' )
    sixth_comment = Comment.new(post: subject, author: author, text: 'Hi Tom!' )
    first_comment.save
    second_comment.save
    third_comment.save
    fourth_comment.save
    fifth_comment.save
    sixth_comment.save
    expect(subject.recent_comments).to eq([sixth_comment, fifth_comment, fourth_comment, third_comment, second_comment])
  end

  it 'posts_counter of author should update' do
    author = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    subject = Post.new(author: author, title: 'Hello', text: 'This is my first post')
    author.save
    subject.save
    expect(author.posts_counter).to eq(1)
  end
end
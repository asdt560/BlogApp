require_relative 'application_record'

class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes
  def update_counter(user)
    number = Post.where(:author_id => user.id).count
    user.increment('posts_counter', number)
  end
  def recent_comments
    Comment.where(:post_id => self.id).order('created_at DESC').limit(5)
  end
end
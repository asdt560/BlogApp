require_relative 'application_record'

class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes
  def recent_posts
    Post.where(:author_id => self.id).order('created_at DESC').limit(3)
  end
end

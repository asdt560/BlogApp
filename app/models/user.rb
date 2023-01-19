require_relative 'application_record'

class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'
  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true
  
  def recent_posts
    Post.where(author_id: id).order('created_at DESC').limit(3)
  end
end

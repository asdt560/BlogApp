require_relative 'application_record'

class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, foreign_key: 'post_id'
  has_many :likes, foreign_key: 'post_id'
  after_save :update_posts_counter
  validates :title, presence: true, length: { maximum: 250 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true

  def recent_comments
    Comment.where(post_id: id).order('created_at DESC').limit(5)
  end

  private

  def update_posts_counter
    author.increment!(:posts_counter)
  end
end

require_relative 'application_record'

class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post
  def update_counter(post)
    number = Like.where(post_id: post.id).count
    post.increment('likes_counter', number)
  end
end

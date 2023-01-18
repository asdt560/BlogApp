require_relative 'application_record'

class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post
  def update_counter(post)
    number = Comment.where(:post_id => post.id).count
    post.increment('comment_counter', number)
  end
end

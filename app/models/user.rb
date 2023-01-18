require_relative 'application_record'

class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes
end


require_relative 'application_record'

class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post
end

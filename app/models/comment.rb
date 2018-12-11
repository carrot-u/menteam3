class Comment < ApplicationRecord
  validates :comment, presence: true, length: {minimum: 5, maximum: 600}
  
  belongs_to :post
  belongs_to :user
end

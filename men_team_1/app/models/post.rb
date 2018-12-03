class Post < ApplicationRecord
   ### validates :user_id, presence: true ###

    validates :subject, presence: true, length: {minimum: 3, maximum: 40}
    validates :body, presence: true, length: {minimum: 10, maximum: 600}

    belongs_to :user
    belongs_to :pairing
    has_many :comments
end

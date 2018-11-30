class Post < ApplicationRecord
   ### validates :user_id, presence: true ###
    belongs_to :user
    belongs_to :pairing
    has_many :comments
end

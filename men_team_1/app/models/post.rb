class Post < ApplicationRecord
    belongs_to :user
    belongs_to :pairing
    has_many :comments
end

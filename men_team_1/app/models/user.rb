class User < ApplicationRecord
  # has_many :pairings
  has_many :mentee_pairings, class_name: 'Pairing', foreign_key: 'mentee_id'
  has_many :mentor_pairings, class_name: 'Pairing', foreign_key: 'mentor_id'
  # has_many :mentees, class_name: 'User', through: :pairings
  # has_many :mentors, class_name: 'User', through: :pairings
  has_many :posts
end
 
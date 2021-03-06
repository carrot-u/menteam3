class User < ApplicationRecord
  before_save { self.email = email.downcase }
  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }
  validates :position, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, on: :create

  # has_many :pairings
  has_many :mentee_pairings, class_name: 'Pairing', foreign_key: 'mentee_id'
  has_many :mentor_pairings, class_name: 'Pairing', foreign_key: 'mentor_id'
  # has_many :mentees, class_name: 'User', through: :pairings
  # has_many :mentors, class_name: 'User', through: :pairings
  has_many :posts
  has_many :comments

  has_many :topics, through: :user_tags

  def name
    "#{first_name} #{last_name}"
  end
  def name_bio
    "#{name} #{bio}"
  end

  def all_pairings
    mentor_pairings + mentee_pairings
  end

  def all_mentors
    all_pairings.map do |pairing|
      pairing.mentor
    end
  end

  def mentor_pairings_with_post
    mentor_pairings.map do |pairing|
      pairing unless pairing.posts.nil?
    end
  end

  def mentee_pairings_with_post
    mentee_pairings.map do |pairing|
      pairing unless pairing.posts.nil?
    end
  end

end

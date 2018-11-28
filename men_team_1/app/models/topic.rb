class Topic < ApplicationRecord
  has_many :users, through: :user_tags

  def self.search(term)
    if term
      where('topic LIKE ?', "%#{term}%").order('id DESC')
    else
      all
    end
  end
end

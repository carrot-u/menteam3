class Post < ApplicationRecord
   ### validates :user_id, presence: true ###

    validates :subject, presence: true, length: {minimum: 3, maximum: 150}
    validates :body, presence: true, length: {minimum: 10, maximum: 600}

    belongs_to :user
    belongs_to :pairing
    has_many :comments

    def receiving_user
        pairing = Pairing.find(pairing_id)
        receiving_user = user_id == pairing.mentor_id ? User.find(pairing.mentee_id) : User.find(pairing.mentor_id)
        receiving_user
    end

end

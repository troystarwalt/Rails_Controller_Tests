class Card < ActiveRecord::Base

	has_many :user_cards
	has_many :users, through: :user_cards

	validates :expires_month, inclusion: {in: 1..12}
	validates :number, presence: true, uniqueness:true, length: {minimum: 4}

end

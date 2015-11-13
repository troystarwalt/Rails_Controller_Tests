class User < ActiveRecord::Base

	has_many :user_cards
	has_many :cards, through: :user_cards

	validates :password, confirmation: true, presence: true, :length => { :in => 6..100 }
	validates :fname, presence: true
	# validates :lname, presence: true
	# validates :email, presence: true, uniqueness: true
	# validates :balance, numericality: { greater_than_or_equal_to: 0}
	# has_secure_password
	# before_create  :fix_email
	# need to add phone validation before_update :fix_phone_format
	# after_update :fix_phone_format

	def to_s
		"#{self.fname} #{self.lname}"
	end

	attr_accessor :password_salt, :password_digest
	# def fix_phone_number
	# 	puts "TROY >>>>>>>>>>>>>>>>>>> User.before_save()"
	# 	updated = self.phone_number.gsub("\s", "")
	# 	self.phone_number = updated
	# end

	# :fix_phone_number,

	def fix_email
		updated = self.email.downcase
		self.email = updated
	end

	def fix_phone_format
		cleanup = self.phone.gsub("[ .,-]", "")
	end

end

class UserCard < ActiveRecord::Base
  belongs_to :user
  belongs_to :card

  # def ownership
  # end
  	
end

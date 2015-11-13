FactoryGirl.define do
	factory :dog do
		name "Lucy"
		email "lucy@gmail.com"
		city "New Rochelle"
		state "NJ"
		password "woohoo123"
		password_confirmation "woohoo123"
		birthday Time.new(2010)
		newsletter true
	end

end
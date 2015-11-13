require 'rails_helper'

RSpec.describe Dog, :type => :model do

	# let( :invalid_attributes){
	# 	invalid_attributes = {
	# 		name: "Johnny",
	# 		email: "johnny@gmail.com",
	# 		city: "Rogers",
	# 		state: nil,
	# 		password: "qwerty123",
	# 		password_confirmation: "qwerty123",
	# 		birthday: Time.new(2012),
	# 		newsletter: false
	# 	}
	# }

	dog = FactoryGirl.build(:dog)

	cdog = FactoryGirl.create(:dog)

	describe "is invalid w/o... " do
		# let(:dog){Dog.new(valid_attributes)}

		it "name" do
			dog.name = nil
			expect(dog).to be_invalid
		end

		it "email" do
			dog.email = nil
			expect(dog).to be_invalid
		end

		it "a unique email" do
			cdog#(valid_attributes)
			expect(dog).to be_invalid
		end

		it "city" do
			dog.city = nil
			expect(dog).to be_invalid
		end

		it "state" do
			# dog.state = "NJ"
			expect(dog).to be_valid
		end

		xit "state" do
			dog.state = nil
			expect(dog).to be_invalid
		end

		after(:each) do
			puts "#{dog.name}"
		end
	end

	describe "#birthday" do
		# let(:dog){Dog.new (valid_attributes)}

		it " should return ???" do
			dog.birthday = Time.now
			expect(dog.birthday?).to eq(true)
		end

		it " should return false with no birthday" do
			expect(dog.birthday?).to eq(false)
		end
	end

	describe "#age" do
		let(:dog){Dog.new(valid_attributes)}

		it " should return the age of the dog" do
			expect(dog.age).to be(5)
		end	
	end

	describe "#location" do
		let(:dog){Dog.new valid_attributes}

		it "should combine the dogs city and state" do
			expect(dog.location).to eq("New Rochelle, NJ")
		end
	end

	describe "#puppy?" do
		let(:dog){Dog.new valid_attributes}

		xit " Should be false" do
			expect(dog.puppy?).to be false
		end

		it " should be true" do
			dog.birthday = Time.new(2015)
			expect(dog.puppy?).to be true
		end
	end

	describe "#age_in_dog_years" do
		let(:dog){Dog.new valid_attributes}

		it " should returns the age times 7" do
			expect(dog.age_in_dog_years).to be 35
		end
	end

	describe "#subscribe_to_newsletter" do
		let(:dog){Dog.new valid_attributes}

		it " Dog will subscirbe to newsletter" do
			dog.subscribe_to_newsletter
			expect(dog.newsletter).to be true
		end
	end

	describe "#unsubscribe_from_newsletter" do
		let(:dog){Dog.new valid_attributes}

		it " Dog will unsubscribe_from_newsletter and return false" do
			dog.unsubscribe_from_newsletter
			expect(dog.newsletter).to be false
		end
	end
end

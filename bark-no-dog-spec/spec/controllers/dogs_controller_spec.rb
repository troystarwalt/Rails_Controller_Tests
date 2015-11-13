require 'rails_helper'

RSpec.describe DogsController, :type => :controller do

	let(:valid_attributes){
		@valid_attributes={
			name: "Lucy",
			email: "dogs@gmail.com",
			city: "Edwardsville",
			state: "IL",
			newsletter: true,
			password: "password123",
			password_confirmation: "password123"
		}
	}

	let(:invalid_attributes){
		@invalid_attributes = {
			email: nil
		}
	}

	let(:newdog){
		@dog = Dog.new
	}

	let(:mostrecentdog){
		Dog.last
	}

	describe "GET #index" do
		it "returns http success" do
			get :index
			expect(response).to have_http_status(:success)
		end

		it " will create a dog" do
			dog = Dog.create! valid_attributes
			get :index, {}
			expect(assigns(:dogs)).to eq([dog])
		end
	end

	describe "GET #show" do
		it "should assign requested dog as @dog" do
			dog = Dog.create! valid_attributes
			get :show, id: dog.id
			expect(assigns(:dog)).to eq(dog)
		end
	end

	describe "GET #new" do
		it "assigns a nesw dog as @dog " do
			dog = Dog.create! valid_attributes
			get :new, {}
			expect(assigns(:dog)).to be_a(Dog)
		end
	end

	describe "GET #edit" do
		it "assigns the requested dog as @dog" do
			dog = Dog.create! valid_attributes
			get :edit, id: dog.id
			expect(assigns(:dog)).to eq(dog)
		end
	end

	describe "GET #destroy" do
		it "creates a dog and then destroys @dog" do
			dog = Dog.create! valid_attributes
			get :destroy, id: dog.id
			expect(Dog.find_by(id: 1)).to eq(nil)
		end

		it "redirects to dogs index" do
			dog = Dog.create! valid_attributes
			get :destroy, id: dog.id
			expect(response).to redirect_to(dogs_url)
		end
	end

	describe "POST #create" do
		context "Valid Attributes" do
			it " should assign the record to @dog" do
				post :create, {dog: valid_attributes}
				expect(assigns(:dog)).to eq(Dog.find_by_email(valid_attributes[:email]))
			end

			it " should create a record for @dog" do
				post :create, {dog: valid_attributes}
				expect(mostrecentdog).to eq(Dog.find_by_name(valid_attributes[:name]))  #also used Dog.all.last or Dog.last
			end

			it " Should redirect to a new page after creation"do
				post :create, {dog: valid_attributes}
				expect(response).to redirect_to("/dogs/1")  #expect(response).to redirect_to dog_path(assigns(:dog))
			end
		end

		context "Invalid Attributes" do
			it " Should not work" do
				post :create, {dog: invalid_attributes}
				expect(Dog.find_by_email(invalid_attributes[:email])).to be_nil  #can also be ... .to eq(nil)
			end

			it " Should render the form again on failure" do
				post :create, {dog: invalid_attributes}
				expect(response.status).to eq(200)
			end
		end
	end

	describe "POST #update" do
		context "valid attributes" do
			it " should match the specific record to @dog" do
				dog = Dog.create! valid_attributes
				name = "Spot"
				put :update, {id: dog.id, dog: {name: name}}
				expect(assigns(:dog)).to eq(Dog.find_by_name(name))
			end

			it " should update @dog's record" do
				dog = Dog.create! valid_attributes
				name = "John"
				put :update, {id: dog.id, dog: {name: name}}
				expect(Dog.find_by(:id => 1)).to eq(Dog.last)
			end

			it " render a new page after record createion" do
				dog = Dog.create! valid_attributes
				put :update, {id: dog.id, dog: valid_attributes}
				expect(response).to redirect_to(assigns(:dog))
			end
		end

		context "invalid_attributes" do
			it " should match the specific record to @dog" do
				dog = Dog.create! valid_attributes
				email = nil
				put :update, {id: dog.id, dog: {email: email}}
				expect(assigns(:dog)[:email]).to be_nil
			end       # @dog.name

			it " should direct to the form again" do
				dog = Dog.create! valid_attributes
				name = nil
				put :update, {id: dog.id, dog: {name: name}}
				expect(response).to render_template :edit
			end
		end
	end
	after(:all) do
		puts "Done Thanks"
	end
end
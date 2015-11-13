require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  let(:valid_attributes){
    @valid_attributes = {
      email: "tester@testing.com",
      fname: "Michael",
      lname: "Roberts",
      phone: "2199391092",
      balance: 450,
      password: "aintnothang",
      password_confirmation: "aintnothang"
    }
  }

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it " should render users#new" do
      get :new
      expect(response).to render_template :new
    end

    it " should show create a new @user" do
      newuser = User.create! valid_attributes

      get :new, {}
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  describe "POST #create" do
    it " should create a new user via create" do
      post :create, {user: valid_attributes}
      expect(assigns(:user)).to eq(User.last)
    end
  end

  describe "POST #create" do
    it "returns http success" do
      post :create, {user: valid_attributes}
      expect(response).to have_http_status(:success)
    end
  end

  # describe "GET #edit" do
  #   it "returns http success" do
  #     get :edit
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "PUT #udpate" do
  #   it "returns http success" do
  #     get :udpate
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
    it " should return all users" do
      user = User.create! valid_attributes
      get :index, {}
      expect(assigns(:users)).to eq([user])
    end
  end

  describe "GET #show" do
    # before { get :show, id: 1}
    it "returns http success" do
      user = User.create!(valid_attributes)
      get :show, id: user.id
      expect(response).to have_http_status(:success)
    end
    after { puts "Completed"}
  end

  # describe "GET #destroy" do
  #   it "returns http success" do
  #     get :destroy
  #     expect(response).to have_http_status(:success)
  #   end
  # end

end

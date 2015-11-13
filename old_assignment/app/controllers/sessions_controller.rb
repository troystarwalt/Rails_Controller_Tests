class SessionsController < ApplicationController

	def new
	end

	def create
		result = User.all.where(
			email: params[:email], password: params[:password]).first
		if result
			flash[:notice] = "You have logged in!"
			redirect_to user_path result
		else
			flash[:notice] = "invalid login/password. Please try again."
			redirect_to "/login"
		end
	end

	def destroy
		session[:user_id] = nil
		flash[:notice] = "You have logged out."
		redirect_to users_path
	end

end

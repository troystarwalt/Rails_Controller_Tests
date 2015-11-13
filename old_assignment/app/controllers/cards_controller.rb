class CardsController < ApplicationController

	def new
		@card = Card.new
		@user = User.all
	end

	def create
		@user = current_user
		card = Card.create(card_params)
		
		if card.persisted?
			flash[:notice]
			redirect_to cards_path(card)
		else
			flash[:notice] = "Sorry try again."
			redirect_to new_card_path
		end
	end

	def update

	end

	def show
		@card = Card.find(params[:id])
		@ownership = UserCard.find_by(user_id: 1, card_id: @card.id)
		# ToDo unhardcode user_id, change to session[:user_id]
		# find_by returns an item if there is an ownership
		# otherwise returns nil
	end

	def destroy
		Card.find(params[:id]).destroy
		redirect_to cards_path
	end

	def index
		@cards = Card.all
	end

	private

	def card_params
		params.require(:card).permit(:number, :cardtype, :expires_month, :expires_year, :code)
	end


end

class UserCardsController < ApplicationController

	def create
		puts "UsersCardsController.create()"
		# user_id = params[:user_id]
		# card_id = params[:card_id]
		# result = UserCard.create(params.permit(:user_id).permit(:card_id))
		result = UserCard.create(
			user_id: params[:user_id],
			card_id: params[:card_id]
		)
		# user_id = session[:user_id]
		# card_id = params[:card][:id]
		flash[:notice] = "Card Added"
		redirect_to user_cards_path
	end

	def index
		@user_cards = UserCard.all
	end

	def destroy
		uc = UserCard.find(params[:id])
		card_id = uc.card.id
		uc.destroy

		redirect_to card_path(card_id)
	end

end

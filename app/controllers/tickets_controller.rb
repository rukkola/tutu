class TicketsController < ApplicationController
	before_action :authenticate_user!, only: :create

	def show
		@ticket = Ticket.find(params[:id])
	end

	def create
		@ticket = current_user.tickets.new #(params) #icket - так не работает

		if @ticket.save
			redirect_to @ticket
		else
			redirect_to search_path
		end

	end
end

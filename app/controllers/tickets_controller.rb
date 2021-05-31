class TicketsController < ApplicationController
	before_action :authenticate_user! #, only: :create

	def index
		#byebug
		#@tickets = Ticket.all.where(user_id: current_user.id)
		@tickets = current_user.tickets # разлогинивается при таком сценарии
	end

	def show
		@ticket = Ticket.find(params[:id])
	end

	def create
		@ticket = current_user.tickets.new(station_params)

		if @ticket.save
			redirect_to @ticket
		else
			redirect_to search_path
		end
	end

	private

  def station_params
    params.permit(:start_station_id, :end_station_id)
  end

end

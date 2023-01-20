class TicketsController < ApplicationController
before_action :authenticate_user!, only: :create

  def index
    @tickets = current_user.tickets
  end

  def show
    @ticket = Ticket.find(params[:id])
  end

  def create
    @ticket = current_user.tickets.new(station_params)

    if @ticket.save
      redirect_to @ticket, notice: 'Письмо о покупке билета Вам направлено на почту'
    else
      redirect_to search_path
    end
  end

  private

  def station_params
    params.permit(:start_station_id, :end_station_id)
  end

end

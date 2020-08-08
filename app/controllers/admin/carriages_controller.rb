class Admin::CarriagesController < Admin::BaseController
	before_action :set_train, only: [:new, :create]

	def new	
		@carriage = Carriage.new
	end

	def show
		@carriage = Carriage.find(params[:id])
	end

	def create
		@carriage = @train.carriages.new(carriage_params)

		if @carriage.save
			redirect_to @train
		else
			render :new
		end
	end

	protected

	def set_train
		@train = Train.find(params[:train_id]) #родительский ресурс обязательно нужно загрузить. :train_id - указан в роутинге
	end

	def carriage_params
		params.require(:carriage).permit(:number, :top_seats, :botton_seats, :side_top_seats, :side_botton_seats)
	end	 

end
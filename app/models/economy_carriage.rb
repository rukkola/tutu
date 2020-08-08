class EconomyCarriage < Carriage
	validates :side_top_seats, :side_botton_seats, presence: true
end
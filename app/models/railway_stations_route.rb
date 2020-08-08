class RailwayStationsRoute < ApplicationRecord
	belongs_to :railway_station
	belongs_to :route

	#Проверяется уникальность что с route_id = 1 может быть railway_station_id только один раз
	validates :railway_station_id, uniqueness: { scope: :route_id }
end
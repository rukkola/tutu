class Route < ApplicationRecord
	#has_and_belongs_to_many :railway_stations #название ассоциации railway_stations
	# Есть третья таблица(_ailway_stations_routes) и через нее мы получаем доступ к (ailway_stations)
	has_many :railway_stations_routes
	has_many :railway_stations, through: :railway_stations_routes

	validates :name, presence: true
end

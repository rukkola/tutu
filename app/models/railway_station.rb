class RailwayStation < ApplicationRecord
	validates :title, presence: true

	has_many :trains
 	#has_and_belongs_to_many :routes # Старый вариант
 	has_many :railway_stations_routes
	has_many :routes, through: :railway_stations_routes

	scope :ordered, -> { joins(:railway_stations_routes).order("railway_stations_routes.position").uniq }	

	def update_position(route, position)
		station_route = station_route(route) 
		station_route.update(position: position) if station_route
	end

	def position_in(route)
		station_route(route).try(:position) # try - вызывает объект если он не nil
	end

	def station_route(route)
		# were - возвращает релейшен, поэтому добавляем first (т.е. получаем сам объект)
		# делаем мемоизацию. Если какой-то метод загрузил объект то будем просто возвращать
		@station_route ||= railway_stations_routes.where(route: route).first
	end

end

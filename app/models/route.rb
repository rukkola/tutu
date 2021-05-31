class Route < ApplicationRecord
	
	has_many :railway_stations_routes
	has_many :railway_stations, through: :railway_stations_routes

  #before_validation :set_name
	validates :name, presence: true
	validate :stations_count
 
	def root_start_station(route)
    route.railway_stations_routes.order('position').first.railway_station_id
  end

  def root_end_station(route)
    route.railway_stations_routes.order('position DESC').first.railway_station_id
  end 

	private
  
  # переписать с использованием "position".
	#def set_name
	#	self.name = "#{railway_stations.first.title} - #{railway_stations.last.title}"
	#end

	def stations_count
		if railway_stations.size < 2
			# base - добавление объекта целиком
			errors.add(:base, "Маршрут должен содержать минимум 2 станции")
		end
	end
end
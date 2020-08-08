class Route < ApplicationRecord
	#has_and_belongs_to_many :railway_stations #название ассоциации railway_stations
	# Есть третья таблица(_ailway_stations_routes) и через нее мы получаем доступ к (ailway_stations)
	has_many :railway_stations_routes
	has_many :railway_stations, through: :railway_stations_routes

	validates :name, presence: true
	#validates :stations_count

	before_validation :set_name

	private

	def set_name
		self.name ||= "#{railway_stations.first.title} - #{railway_stations.last.title}"
	end

	#def stations_count
	#	if railway_stations.size < 2
	#		# base - добавление объекта целиком
	#		errors.add(:base, "Маршрут должен содержать минимум 2 станции")
	#	end
	#end

end

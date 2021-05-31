class Search < ApplicationRecord

  def self.find_routes(start_station_id, end_station_id)
       
      start = RailwayStationsRoute.where(railway_station_id: start_station_id)
      
      routes = []  
      start.each do |i|
        start_end_station = RailwayStationsRoute.where(route_id: i.route_id, railway_station_id: end_station_id).where("position > #{i.position}")
        
        if start_end_station != [] || start_end_station.first != nil 
          routes << start_end_station.first.route
        end  
      end
      routes
  end 
end

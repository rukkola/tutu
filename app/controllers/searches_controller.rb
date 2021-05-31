class SearchesController < ApplicationController

  def show    
    if start_station_param
      @stations       = RailwayStation.all
      @start_station  = @stations.find(start_station_param)
      @end_station    = @stations.find(end_station_param)
      @routes         = Search.find_routes(start_station_param, end_station_param)
    else
      @stations = RailwayStation.all
      @routes = Route.all
    end
  end

  private

  def start_station_param
    params[:start_station]
  end

  def end_station_param
    params[:end_station]
  end
end
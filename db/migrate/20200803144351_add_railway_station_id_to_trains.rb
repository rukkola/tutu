class AddRailwayStationIdToTrains < ActiveRecord::Migration[6.0]
  def change
  	#add_column :trains, :railway_station_id, :integer # Таблица, поле, тип
  	add_belongs_to :trains, :current_station
  end
end

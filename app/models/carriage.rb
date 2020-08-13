class Carriage < ApplicationRecord
	belongs_to :train
	validates :number, :top_seats, :botton_seats, presence: true

end

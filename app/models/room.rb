class Room < ActiveRecord::Base

	#  add relationships between models

	has_many :users

	# validations

	validates :name, presence: true
	validates :address, presence:true
	validates :price_in_pence, presence: true, numericality: {greater_than_or_equal_to: 50}



	#  geocoder setup

	geocoded_by :address
	after_validation :geocode


end

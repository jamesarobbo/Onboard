class Room < ActiveRecord::Base

	#  add relationships between models. A room can only belong to one user

	belongs_to :user # this means belong to the User model (with capital U)

	# validations

	validates :name, presence: true
	validates :address, presence:true
	validates :price_in_pence, presence: true, numericality: {greater_than_or_equal_to: 50}



	#  geocoder setup

	geocoded_by :address
	after_validation :geocode


end

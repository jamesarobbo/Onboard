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

	# add image attachment
	# in my styles i can use
  # 720x240 -> either 720 wide or 240 high
	# 720x -> 720 wide and however tall
	# 240x -> 240 high and however wide
	# 720x240# -> crop to 720 by 240

	has_attached_file :image, styles: {large: "720x240#", medium:"240x240#", thumbnail:"60x60#"  }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/


end

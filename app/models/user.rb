class User < ActiveRecord::Base

# add relatioships
	has_many :rooms

# validations

	validates :name, presence: true
	validates :email, presence: true, uniqueness: true
	validates :username, presence: true, uniqueness: true


# gems

	# this gem is built into rails. turns password field in form into something that's encrypted by working with password_digest	
	has_secure_password 


end

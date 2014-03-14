class User < ActiveRecord::Base

# add relatioships
	has_many :rooms

	has_many :orders

# validations

	validates :name, presence: true, if: -> { self.provider.nil? } # this is a lambda and we're using it to say if we're using a social login don't validate
	validates :email, presence: true, uniqueness: true, if: -> { self.provider.nil? }
	validates :username, presence: true, uniqueness: true, if: -> { self.provider.nil? }


# gems

	# this gem is built into rails. turns password field in form into something that's encrypted by working with password_digest
	has_secure_password


end

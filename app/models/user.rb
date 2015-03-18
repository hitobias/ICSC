class User < ActiveRecord::Base
	before_save :format_attribute
	before_save :default_value

	validates :username,  presence: true, length: { minimum: 5 }
	validates :firstname, presence: true
	validates :lastname, 	presence: true
	validates :gender,		presence: true
	validates :country,		presence: true
	validates :church,		presence: true

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :email,			presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false}

	has_secure_password
	validates :password, 	presence: { on: create }, length: { minimum: 6 }, confirmation: true
	validates :password_confirmation, presence: true

	private
		def default_value
			self.actived ||= "N"
			self.role ||= "normal"
		end

		def format_attribute
			self.username = self.username.downcase
			self.firstname = self.firstname.strip.capitalize
			self.lastname = self.lastname.strip.capitalize

			self.email = self.email.downcase

		end
end

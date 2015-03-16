class User < ActiveRecord::Base
	validates :username, 	presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: false}
	validates :password, 	presence: true, length: { minimum: 6 }
	validates :firstname, presence: true
	validates :lastname, 	presence: true
	validates :gender,		presence: true
	validates :country,		presence: true
	validates :church,		presence: true

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :email,			presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false}
end

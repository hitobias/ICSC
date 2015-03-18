class User < ActiveRecord::Base
	attr_accessor :remember_token, :activation_token
	before_create :create_activation_digest
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

	def User.digest(string)
		cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
		BCrypt::Password.create(string, cost: cost)
	end

	def User.new_token
		SecureRandom.urlsafe_base64
	end

	def remember
		self.remember_token = User.new_token
		update_attribute(:remember_digest, User.digest(remember_token))
	end

	def forget
		update_attribute(:remember_digest, nil)
	end

	def authenticated?(remember_token)
		return false if remember_digest.nil?
		BCrypt::Password.new(remember_digest).is_password?(remember_token)
	end

	private
		def create_activation_digest
			self.activation_token = User.new_token
			self.activation_digest = User.digest(activation_token)
		end

		def default_value
			self.actived_at = nil
			self.role ||= "normal"
		end

		def format_attribute
			self.username = self.username.downcase
			self.firstname = self.firstname.strip.capitalize
			self.lastname = self.lastname.strip.capitalize

			self.email = self.email.downcase
		end
end

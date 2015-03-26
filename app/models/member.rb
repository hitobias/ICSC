class Member < ActiveRecord::Base
	belongs_to :user
	belongs_to :group

	GENDER_OPTION = %w(男 女 M F)
	validates :gender, inclusion: {in: GENDER_OPTION}

	validates :age, numericality: {only_integer: true, greater_than: 0, less_than: 100}, allow_blank: true
	validates :country, presence: true
	validates :church, presence:true

	# VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	# validates :email,	format: { with: VALID_EMAIL_REGEX }

	CONFERENCE_OPTION = %W(OC BC AC OB OC)
	validates :conference_option, inclusion: {in: CONFERENCE_OPTION}

end

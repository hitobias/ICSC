class Conference < ActiveRecord::Base
	has_many :conference_options, dependent: :destroy
	before_save :default_value

	private
		def default_value
			self.enabled ||= true
		end
end

module ApplicationHelper
	def full_title(page_title = '')
		base_title = "ICSC"
		if page_title.empty?
			base_title
		else
			"#{page_title} | #{base_title}"
		end
	end

	def copyright_notice_year_range()
		current_year = Time.now.year
	end
end

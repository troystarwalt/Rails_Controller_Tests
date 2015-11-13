module UsersHelper

	def display_in_list(users)

		# content_tag(:p, "Rails HTML content builder")

		content_tag(:ul) do
			users.each do |users|
				concat content_tag(:li, users)
			end
		end
	end

end

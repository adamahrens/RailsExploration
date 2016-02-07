module ApplicationHelper
	def navbar_items
		[
			{displayText: 'Companies', controller: 'companies', link: companies_path},
		 	{displayText: 'Works', controller: 'works', link: works_path},
		 	{displayText: 'Projects', controller: 'projects', link: projects_path}
		]
	end

	def display_navbar_item(displayText, controller, link)
		raw("<li#{controller_name == controller ? ' class="active"' : ''}>#{link_to displayText, link}</li>")
	end
end

module ApplicationHelper
	def markdown(text)
	    options = {
	      filter_html:     true,
	      hard_wrap:       true,
	    }

	    extensions = {
	      autolink:           true,
	      superscript:        true,
	      disable_indented_code_blocks: true
	    }

	    renderer = Redcarpet::Render::HTML.new(options)
	    markdown = Redcarpet::Markdown.new(renderer, extensions)

	    markdown.render(text).html_safe
		end
end

require 'builder'

title = "The Michigan Beer Show"
author = "The Michigan Beer Show"
description = "Michigan's only podcast dedicated to its finest natural resource. Beer reviews from all around the Great Lakes State as well as reviews of craft brews from around the country."
keywords = "beer, craft beer, microbreweries, homebrewing, lifestyle, Michigan, food and drink"

xml = Builder::XmlMarkup.new(:target => $stdout, :indent => 2)
xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
	xml.channel do
		xml.link 'http://michiganbeershow.com'
		xml.description description
		xml.language 'eng'
		xml.pubDate @podcasts.first.published_at.to_s
		xml.lastBuildDate @podcasts.first.published_at
		xml.itunes :author, author
		xml.itunes :explicit, 'explicit'
		xml.itunes :owner do
			xml.itunes :name, author
			xml.itunes :email, 'hello@michiganbeershow.com'
		end
		xml.itunes :block, 'no'
		xml.itunes :category, :text => 'Society & Culture'
		@podcasts.each do |episode|
			xml.item do
				xml.title episode.title
				xml.description episode.description
				xml.pubDate episode.published_at.to_s
				xml.length episode.length
				xml.link episode.resource_url
				xml.itunes :author, author
				xml.itunes :subtitle, episode.subtitle
				xml.itunes :summary, episode.description
				xml.itunes :explicit, 'yes'
				xml.itunes :duration, episode.length
			end
		end
	end
end
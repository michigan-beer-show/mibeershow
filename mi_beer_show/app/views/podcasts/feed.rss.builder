title = "The Michigan Beer Show"
author = "The Michigan Beer Show"
description = "Michigan's only podcast dedicated to its finest natural resource. Beer reviews from all around the Great Lakes State as well as reviews of craft brews from around the country."
keywords = "beer, craft beer, microbreweries, homebrewing, lifestyle, Michigan, food and drink"

xml.instruct!
xml.rss "xmlns:itunes" => '<rss xmlns:itunes="http://www.itunes.com/dtds/podcast-1.0.dtd" version="2.0">', :version => "2.0" do
	xml.channel do
		xml.link 'http://michiganbeershow.com'
		xml.description description
		xml.language 'eng'
		xml.pubDate @podcasts.first.published_at.to_s(:rfc822)
		xml.lastBuildDate @podcasts.first.published_at(:rfc822)
		xml.itunes :author, author
		xml.itunes :explicit, 'explicit'
		xml.itunes :image, :href => image
		xml.itunes :owner do
			xml.itunes :name, author
			xml.itunes :email, 'michiganbeershow@gmail.com'
		end
		xml.itunes :block, 'no'
		xml.itunes :category, :text => 'Society & Culture'
		@podcasts.each do |episode|
			xml.item do
				xml.title episode.title
				xml.description episode.description
				xml.pubDate episode.published_at.to_s(:rfc822)
				xml.length episode.length
				xml.link episode.resource_url
				xml.itunes :author, author
				xml.itunes :subtitle, episode.description.truncate
				xml.itunes :summary, episode.description
				xml.itunes :explicit, 'no'
				xml.itunes :duration, episode.duration
			end
		end
	end
end
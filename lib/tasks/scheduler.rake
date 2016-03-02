desc "This task checks the RSS feed for new episodes and adds them to the database"
task :check_feed => :environment do
	require 'rss'
	require 'open-uri'
	url = 'http://feeds.soundcloud.com/users/soundcloud:users:39602775/sounds.rss'
	open(url) do |rss|
		feed = RSS::Parser.parse(rss)
		feed.items.each do |item|
			puts item.title
			puts item.pubDate.strftime("%B %-d, %Y")
			puts item.link
			puts item.description
		end
	end
end
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
tracks = PodcastsHelper.get_all_tracks

tracks.each do |track|
	Podcast.create!(title: track[:title], uri: track[:uri], permalink_url: track[:permalink_url], description: track[:description])
end

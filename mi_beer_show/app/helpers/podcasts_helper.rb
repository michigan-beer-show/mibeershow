module PodcastsHelper
	def self.new_client
		client = Soundcloud.new(
			:client_id => 'cdaff8e173b4b3167440d503d026337e',
			:client_secret => '47f3f820dd66de16a21029a04b7a281d',
			:username => 'brandon@michiganbeershow.com',
			:password => 'jVerlander35!'
		)
	end

	def self.get_all_tracks
		client = self.new_client
		tracks = client.get('/me/tracks')
		tracks.map! do |track|
			{title: track.title, uri: track.uri, permalink_url: track.permalink_url, description: track.description}
		end
	end
end

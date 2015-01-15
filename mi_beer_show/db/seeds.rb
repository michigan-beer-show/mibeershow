# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

s3 = AWS::S3.new
podcasts = s3.buckets[ENV['AWS_BUCKET']]

podcasts.objects.each do |obj|
	episode_length = Time.at(obj.metadata[:audio_length].to_i).gmtime.strftime('%R:%S')
	Podcast.create(title: obj.key, resource_url: 'https://s3.amazonaws.com/media.michiganbeershow.com/#{obj.key}', length: episode_length)
end

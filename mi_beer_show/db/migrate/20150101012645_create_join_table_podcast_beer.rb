class CreateJoinTablePodcastBeer < ActiveRecord::Migration
  def change
  	has_and_belongs_to_many :podcasts
  	has_and_belongs_to_many :beers
  end
end

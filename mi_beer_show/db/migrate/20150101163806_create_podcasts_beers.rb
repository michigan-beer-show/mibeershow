class CreatePodcastsBeers < ActiveRecord::Migration
  def change
    create_table :podcasts_beers do |t|
    	t.belongs_to :podcast, index: true
    	t.belongs_to :beer, index: true
      t.timestamps
    end
  end
end

class AddPodcasts < ActiveRecord::Migration
  def change
  	create_table :podcasts do |t|
  		t.string :title
  		t.string :descsription
  		t.string :resource_url
  		t.integer :length
  		t.date   :published_at
  		t.timestamps
  	end
  end
end

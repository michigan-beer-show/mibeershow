class CreateBeersPodcasts < ActiveRecord::Migration
  def change
    create_table :beers_podcasts do |t|
    	t.belongs_to :podcast, index: true
    	t.belongs_to :beer, index: true
      t.timestamps
    end
  end
end

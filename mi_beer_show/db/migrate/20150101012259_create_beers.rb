class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
    	t.string :name
    	t.string :brewery
    	t.string :location
    	t.string :style
    	t.integer :average_score
      t.timestamps
    end
  end
end

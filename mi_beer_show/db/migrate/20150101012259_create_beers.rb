class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
    	t.string :name
    	t.string :brewery
    	t.float  :average_score
      t.belongs_to :style
      t.timestamps
    end
  end
end

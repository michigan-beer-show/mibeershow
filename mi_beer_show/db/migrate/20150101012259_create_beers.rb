class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
    	t.string :name
    	t.float  :average_score
      t.belongs_to :style
      t.belongs_to :brewery
      t.timestamps
    end
  end
end

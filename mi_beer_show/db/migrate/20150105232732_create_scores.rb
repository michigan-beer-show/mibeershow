class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
    	t.integer :rating
    	t.string  :judge
    	t.string  :description
      t.integer :beer_id
      t.timestamps
    end
  end
end

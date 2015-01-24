class CreateReviewsBeers < ActiveRecord::Migration
  def change
    create_table :reviews_beers do |t|
    	t.belongs_to :beer, index: true
    	t.belongs_to :review, index: true
    t.timestamps
    end
  end
end

class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
    	t.text :body
    	t.integer :rating
    	t.belongs_to :user
    	t.belongs_to :beer
      t.timestamps
    end
  end
end

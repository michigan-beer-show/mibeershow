class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
    	t.text :body
    	t.float :rating
    	t.belongs_to :brewery
    	t.belongs_to :user
    	t.belongs_to :beer
      t.timestamps
    end
  end
end

class CreateBlogPosts < ActiveRecord::Migration
  def change
    create_table :blog_posts do |t|
      t.string :url
      t.text :summary

      t.timestamps
    end
  end
end

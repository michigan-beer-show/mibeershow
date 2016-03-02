class CreateEpisodes < ActiveRecord::Migration
  def change
    create_table :episodes do |t|
      t.string :title
      t.time :upload_date
      t.string :media_link
      t.string :blog_link
      t.text :description

      t.timestamps
    end
  end
end

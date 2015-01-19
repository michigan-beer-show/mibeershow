class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :username
    	t.string :password_hash
    	t.string :remember_token, index: true
      t.timestamps
    end
  end
end

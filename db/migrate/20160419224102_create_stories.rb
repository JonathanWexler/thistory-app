class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
    	t.datetime :time_period
    	t.string :title
    	t.text :body
    	t.integer :user_id
    	t.integer :place_id
    	t.integer :status

      t.timestamps null: false
    end
  end
end

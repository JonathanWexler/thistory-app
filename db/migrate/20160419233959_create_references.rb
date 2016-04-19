class CreateReferences < ActiveRecord::Migration
  def change
    create_table :references do |t|
    	t.string :title
    	t.string :link
    	t.string :type

      t.timestamps null: false
    end
  end
end

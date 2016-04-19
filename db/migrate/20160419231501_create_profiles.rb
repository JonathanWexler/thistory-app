class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :first_name
      t.string :last_name
      t.string :bio
      t.integer :age_range
      t.string :expertise
      t.string :neighborhood

      t.timestamps null: false
    end

    add_index :profiles, :user_id
  end
end

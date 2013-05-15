class CreateAchievements < ActiveRecord::Migration
  def change
    create_table :achievements do |t|
      t.date :date
      t.text :note
      t.string :time
      t.integer :track_id
      t.integer :user_id

      t.timestamps
    end
  end
end

class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :name
      t.text :description
      t.string :slope
      t.string :difficulty
      t.integer :altitude
      t.text :note

      t.timestamps
    end
  end
end

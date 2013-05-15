class CreateAreas < ActiveRecord::Migration
  def change
    create_table :areas do |t|
      t.string :name
      t.integer :location_id
      t.text :description

      t.timestamps
    end
  end
end

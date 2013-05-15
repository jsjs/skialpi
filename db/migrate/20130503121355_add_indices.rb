class AddIndices < ActiveRecord::Migration
  def change
  	add_index :achievements, :points
  	add_index :achievements, :date
  	add_index :locations, :name
  	add_index :areas, :name
  	add_index :tracks, :id
  end
end

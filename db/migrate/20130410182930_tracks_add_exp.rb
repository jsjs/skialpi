class TracksAddExp < ActiveRecord::Migration
 
  def change
    add_column :tracks, :exposure, :string
    add_column :tracks, :area_id, :integer
  end
 
end
